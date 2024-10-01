import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/usermodel.dart';

class UserController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  var users = <Usermodel>[].obs;
  void adduser() {
    try {
      final userdata = Usermodel(
        name: nameController.text,
        address: addressController.text,
        age: int.parse(ageController.text),
        phone: int.parse(phoneController.text),
      );
      if (userdata != null) {
        users.add(userdata);
      }
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

  void editUser(int index){
   
    try {
      final updatedUser = Usermodel(
        name: nameController.text,
        address: addressController.text,
        age: int.parse(ageController.text),
        phone: int.parse(phoneController.text),
      );
      users[index] = updatedUser; 
      clearUser();
    } catch (e) {
      print(e);
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
