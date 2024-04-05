import 'dart:io';

import 'package:contacts_app/Features/CreateUser/Provider/create_user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateUserProvider extends ChangeNotifier {
  final CreateUserModel userModel = CreateUserModel();
  String downloadImageUrl = '';
  final picker = ImagePicker();
  Future<void> showImagePickerDialog({required BuildContext context}) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Choose an option"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  onTap: () => getImageFromGallery(context: context),
                  child: const Text("Gallery"),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => getImageFromCamera(context: context),
                  child: const Text("Camera"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> getImageFromGallery({required BuildContext context}) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // ref
      //     .watch(imageProvider.notifier)
      //     .update((state) => File(pickedFile.path));
      // showSnackBar(context, 'Uploading File.......');
      var uploadTask = FirebaseStorage.instance
          .ref('images/image-${DateTime.now()}')
          .putFile(File(pickedFile.path));
      final snapshot = await uploadTask.whenComplete(() {});
      downloadImageUrl = await snapshot.ref.getDownloadURL();

      // showSnackBar(context, 'Uploaded Successfully...');
      notifyListeners();
    }
    Navigator.of(context).pop();
  }

  Future<void> getImageFromCamera({required BuildContext context}) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // ref
      //     .watch(imageProvider.notifier)
      //     .update((state) => File(pickedFile.path));
      // showSnackBar(context, 'Uploading File.......');
      var uploadTask = FirebaseStorage.instance
          .ref('images/image-${DateTime.now()}')
          .putFile(File(pickedFile.path));
      final snapshot = await uploadTask.whenComplete(() {});
      downloadImageUrl = await snapshot.ref.getDownloadURL();

      // showSnackBar(context, 'Uploaded Successfully...');

      notifyListeners();
    }
    Navigator.of(context).pop();
  }
}
