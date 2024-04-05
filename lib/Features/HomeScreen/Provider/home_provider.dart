import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_app/Features/HomeScreen/Provider/home_model.dart';
import 'package:flutter/foundation.dart';

import '../../../Core/Constants/firebase_constants.dart';
import '../../../Models/userModel.dart';

class HomeProvider extends ChangeNotifier {
  final HomeModel homeModel = HomeModel();
  Stream<List<UserModel>> getUser() {
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
  }
}
