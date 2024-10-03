import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/user_controller.dart';
import 'package:task/models/usermodel.dart';
import 'package:task/utilities/custom_textformfield.dart';

class CrudHomePage extends StatelessWidget {
  final UserController controller = Get.put(UserController());
  CrudHomePage({super.key});
  final _formkey = GlobalKey<FormState>();

  // Create an observable for editingUserId
  var editingUserId = Rxn<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD Operation'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                CustomTextformfield(
                  controller: controller.nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'required field';
                    }
                    return null;
                  },
                  hinttext: 'Name',
                  prefixIcon: Icons.person,
                ),
                const SizedBox(height: 10),
                CustomTextformfield(
                  controller: controller.ageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'required field';
                    }
                    return null;
                  },
                  hinttext: 'Age',
                  prefixIcon: Icons.sticky_note_2_rounded,
                ),
                const SizedBox(height: 10),
                CustomTextformfield(
                  controller: controller.addressController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'required field';
                    }
                    return null;
                  },
                  hinttext: 'Address',
                  prefixIcon: Icons.home,
                ),
                const SizedBox(height: 10),
                CustomTextformfield(
                  controller: controller.phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'required field';
                    }
                    return null;
                  },
                  hinttext: 'Phone Number',
                  prefixIcon: Icons.phone,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 170),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.amber),
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        if (editingUserId.value != null) {
                          // Update existing user
                          controller.editUser(Usermodel(
                            id: editingUserId.value,
                            name: controller.nameController.text,
                            age: int.parse(controller.ageController.text),
                            phone: int.parse(controller.phoneController.text),
                            address: controller.addressController.text,
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Successfully updated')),
                          );
                          controller.clearUser();
                          editingUserId.value = null; // Reset editingUserId
                        } else {
                          // Add new user
                          controller.adduser();
                          controller.clearUser();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Successfully added')),
                          );
                        }
                      }
                    },
                    child: Center(
                      child: Obx(() => Text(
                            editingUserId.value != null
                                ? 'Update User'
                                : 'Add User',
                          )),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.users.length,
                      itemBuilder: (context, index) {
                        final user = controller.users[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            tileColor: Colors.amber.shade100,
                            title: Text('${user.name}'),
                            trailing: SizedBox(
                              width: 80,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      editingUserId.value =
                                          user.id; // Set the editing user ID
                                      controller.getUser(
                                          index); // Populate fields with user data
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.green,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      controller.deleteUser(index);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
