import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/usermodel.dart';

class UserController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  var users = <Usermodel>[].obs;
  var currentId=0.obs;
  void adduser() {
    currentId.value++;
    try {
      final userdata = Usermodel(
        name: nameController.text,
        address: addressController.text,
        age: int.parse(ageController.text),
        phone: int.parse(phoneController.text),
        id: currentId.value
      );
      users.insert(0,userdata);
        } catch (e) {
      print(e);
    }
  }

  void clearUser() {
    nameController.clear();
    ageController.clear();
    addressController.clear();
    phoneController.clear();
  }

  void deleteUser(int index) {
    users.removeAt(index);
  }

 // Method to edit an existing user by ID
  void editUser(Usermodel user) {
    int index = users.indexWhere((u) => u.id == user.id);
    
    if (index != -1) {
      users[index] = user;
      Get.snackbar('Success', 'User updated successfully!', snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar('Error', 'User not found!', snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Edit the user data by populating the fields
  void getUser(int index) {
    final user = users[index];
    nameController.text = user.name ?? '';
    ageController.text = user.age?.toString() ?? '';
    addressController.text = user.address ?? '';
    phoneController.text = user.phone?.toString() ?? '';
  }
  
}
