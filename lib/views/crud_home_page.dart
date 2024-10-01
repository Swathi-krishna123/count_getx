import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/controller/user_controller.dart';
import 'package:task/utilities/custom_textformfield.dart';

class CrudHomePage extends StatelessWidget {
  final UserController controller = Get.put(UserController());
  CrudHomePage({super.key});
  final _formkey = GlobalKey<FormState>();

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
                const SizedBox(
                  height: 10,
                ),
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
                const SizedBox(
                  height: 10,
                ),
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
                const SizedBox(
                  height: 10,
                ),
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
                const SizedBox(
                  height: 10,
                ),
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
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 170),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.amber)),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        controller.adduser();
                        controller.clearUser();
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('sucessfully added')));
                      }
                    },
                    child: const Center(
                      child: Text('Add User'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 200,
                  child: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.users.length,
                      itemBuilder: (context, index) {
                        final user = controller.users[index];
                        // ignore: prefer_const_constructors
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

                                          controller.getUser(index);
                                        },
                                        icon:const Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          controller.deleteUser(index);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                  ],
                                ),
                              ),
                            ));
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
