import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_app/Features/HomeScreen/Provider/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../Core/Constants/firebase_constants.dart';
import '../../../Models/userModel.dart';

class HomeProvider extends ChangeNotifier {
  final HomeModel homeModel = HomeModel();
  int selectedValue = 1;
  Stream<List<UserModel>> getUser() {
    if (selectedValue == 1) {
      return FirebaseFirestore.instance
          .collection(FirebaseConstants.userCollection)
          .where("search",
              arrayContains: homeModel.search.text.isEmpty
                  ? null
                  : homeModel.search.text.toUpperCase().trim())
          .snapshots()
          .map(
            (event) => event.docs
                .map(
                  (e) => UserModel.fromMap(e.data()),
                )
                .toList(),
          );
    } else if (selectedValue == 2) {
      return FirebaseFirestore.instance
          .collection(FirebaseConstants.userCollection)
          .where("search",
              arrayContains: homeModel.search.text.isEmpty
                  ? null
                  : homeModel.search.text.toUpperCase().trim())
          .where('age', isGreaterThanOrEqualTo: 60)
          .snapshots()
          .map(
            (event) => event.docs
                .map(
                  (e) => UserModel.fromMap(e.data()),
                )
                .toList(),
          );
    } else {
      return FirebaseFirestore.instance
          .collection(FirebaseConstants.userCollection)
          .where("search",
              arrayContains: homeModel.search.text.isEmpty
                  ? null
                  : homeModel.search.text.toUpperCase().trim())
          .where('age', isLessThan: 60)
          .snapshots()
          .map(
            (event) => event.docs
                .map(
                  (e) => UserModel.fromMap(e.data()),
                )
                .toList(),
          );
    }
  }

  void changeValue({required int nbr, required BuildContext context}) {
    selectedValue = nbr;
    Navigator.pop(context);
    notifyListeners();
  }
}
