import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_app/Features/Authentication/Screens/login.dart';
import 'package:contacts_app/Features/CreateUser/Provider/create_user_provider.dart';
import 'package:contacts_app/Models/userModel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../Core/custom_textform_field/custom_textform.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  // TextEditingController name = TextEditingController();
  // TextEditingController number = TextEditingController();
  // String downloadImageUrl = '';
  // final picker = ImagePicker();
  // Future<void> _showImagePickerDialog() async {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text("Choose an option"),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: [
  //               GestureDetector(
  //                 onTap: _getImageFromGallery,
  //                 child: const Text("Gallery"),
  //               ),
  //               const SizedBox(height: 20),
  //               GestureDetector(
  //                 onTap: _getImageFromCamera,
  //                 child: const Text("Camera"),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  //
  // PickedFile? imgFile;
  // Future<void> _getImageFromGallery() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     // ref
  //     //     .watch(imageProvider.notifier)
  //     //     .update((state) => File(pickedFile.path));
  //     // showSnackBar(context, 'Uploading File.......');
  //     var uploadTask = FirebaseStorage.instance
  //         .ref('images/image-${DateTime.now()}')
  //         .putFile(File(pickedFile.path));
  //     final snapshot = await uploadTask.whenComplete(() {});
  //     downloadImageUrl = await snapshot.ref.getDownloadURL();
  //
  //     // showSnackBar(context, 'Uploaded Successfully...');
  //
  //     setState(() {});
  //   }
  //   Navigator.of(context).pop();
  // }
  //
  // Future<void> _getImageFromCamera() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.camera);
  //
  //   if (pickedFile != null) {
  //     // ref
  //     //     .watch(imageProvider.notifier)
  //     //     .update((state) => File(pickedFile.path));
  //     // showSnackBar(context, 'Uploading File.......');
  //     var uploadTask = FirebaseStorage.instance
  //         .ref('images/image-${DateTime.now()}')
  //         .putFile(File(pickedFile.path));
  //     final snapshot = await uploadTask.whenComplete(() {});
  //     downloadImageUrl = await snapshot.ref.getDownloadURL();
  //
  //     // showSnackBar(context, 'Uploaded Successfully...');
  //
  //     setState(() {});
  //   }
  //   Navigator.of(context).pop();
  // }

  setSearchParam(String caseNumber) {
    List<String> caseSearchList = [];
    String temp = "";
    List<String> nameSplits = caseNumber.split(" ");
    for (int i = 0; i < nameSplits.length; i++) {
      String name = "";
      for (int k = i; k < nameSplits.length; k++) {
        name = name + nameSplits[k] + " ";
      }
      temp = "";
      for (int j = 0; j < name.length; j++) {
        temp = temp + name[j];
        caseSearchList.add(temp.toUpperCase());
      }
    }
    return caseSearchList;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CreateUserProvider>(context);
    return AlertDialog(
      backgroundColor: Colors.white,
      title: SizedBox(
        width: width,
        child: Text(
          "Add A New User",
          style: GoogleFonts.poppins(
              // backgroundColor: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: width * 0.05),
        ),
      ),
      content: Container(
          height: height * 0.5,
          width: width,
          color: Colors.white70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 55,
                    child: CircleAvatar(
                      radius: 52,
                      foregroundImage: AssetImage('assets/Rectangle 88.png'),
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    child: Container(
                      width: 110,
                      height: 55,
                      decoration: const BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      child: IconButton(
                          onPressed: () {
                            provider.showImagePickerDialog(context: context);
                          },
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          )),
                    ),
                  )
                ],
              ),
              Text(
                "Add A New User",
                style: GoogleFonts.poppins(
                    // backgroundColor: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.05),
              ),
              SizedBox(
                width: width * 0.85,
                child: CustomTextField(
                  keyboardType: TextInputType.text,
                  controller: provider.userModel.name,
                  label: 'Enter Name',
                ),
              ),
              SizedBox(
                width: width * 0.85,
                child: CustomTextField(
                  keyboardType: TextInputType.number,
                  controller: provider.userModel.number,
                  label: 'Enter Age',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        provider.userModel.name.clear();
                        provider.userModel.number.clear();
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: GoogleFonts.poppins(color: Colors.black),
                      )),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        final dta = UserModel(
                            name: provider.userModel.name.text.trim(),
                            image: provider.downloadImageUrl,
                            age: int.parse(
                                provider.userModel.number.text.trim()),
                            search: setSearchParam(
                                provider.userModel.name.text.trim()));
                        FirebaseFirestore.instance
                            .collection("name")
                            .add(dta.toMap())
                            .then(
                          (value) {
                            provider.userModel.name.clear();
                            provider.userModel.number.clear();
                            provider.downloadImageUrl = '';
                          },
                        );
                      },
                      child: Text(
                        "Save",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ))
                ],
              )
            ],
          )),
    );
  }
}
