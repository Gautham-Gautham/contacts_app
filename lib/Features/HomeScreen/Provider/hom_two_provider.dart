import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../../Core/Constants/firebase_constants.dart';
import '../../../Core/common/exception.dart';
import '../../../Models/userModel.dart';

class HomTwoProvider extends ChangeNotifier {
  bool isLoading = false;
  int selectedValue = 1;
  QueryDocumentSnapshot? lastDocument;
  List<UserModel> allUsers = [];
  final ScrollController scroll = ScrollController();
  TextEditingController search = TextEditingController();
  @override
  Future<StreamSubscription<QuerySnapshot<Map<String, dynamic>>>>
      getInitialUsers() async {
    print("woooooooorrrrrkkrkrinjj");
    // allUsers = [];
    try {
      print(search);
      print(
          "Sssssssssseeeeeeeaaaaaaaaaaaaaarrrrrrrrrrrrrrrrrrccccccccccccccchhhhhhhhhhhhhhhhhhhhh");

      if (search.text.trim().isEmpty) {
        if (selectedValue == 3) {
          print("1111111111111111111111111111");
          return FirebaseFirestore.instance
              .collection(FirebaseConstants.userCollection)
              .where("age", isLessThan: 60)
              .limit(10)
              .snapshots()
              .listen((event) {
            lastDocument = event.docs.last;
            allUsers = [];
            for (var i in event.docs) {
              allUsers.add(UserModel.fromMap(i.data()));
            }
            notifyListeners();
          });
        } else if (selectedValue == 2) {
          print("22222222222222222222222");
          return FirebaseFirestore.instance
              .collection(FirebaseConstants.userCollection)
              .where("age", isGreaterThanOrEqualTo: 60)
              .limit(10)
              .snapshots()
              .listen((event) {
            lastDocument = event.docs.last;
            allUsers = [];
            for (var i in event.docs) {
              allUsers.add(UserModel.fromMap(i.data()));
            }
          });
        } else {
          print("33333333333333333333333333333");
          return FirebaseFirestore.instance
              .collection(FirebaseConstants.userCollection)
              .limit(10)
              .snapshots()
              .listen((event) {
            lastDocument = event.docs.last;
            allUsers = [];
            for (var i in event.docs) {
              allUsers.add(UserModel.fromMap(i.data()));
            }
          });
        }
      } else {
        if (selectedValue == 3) {
          print("44444444444444444444444444444444444");
          return FirebaseFirestore.instance
              .collection(FirebaseConstants.userCollection)
              .where("age", isLessThan: 60)
              .where("search", arrayContains: search.text.trim().toUpperCase())
              .limit(10)
              .snapshots()
              .listen((event) {
            lastDocument = event.docs.last;
            allUsers = [];
            for (var i in event.docs) {
              allUsers.add(UserModel.fromMap(i.data()));
            }
            notifyListeners();
          });
        } else if (selectedValue == 2) {
          print("555555555555555555555555555555");
          return FirebaseFirestore.instance
              .collection(FirebaseConstants.userCollection)
              .where("age", isGreaterThanOrEqualTo: 60)
              .where("search", arrayContains: search.text.trim().toUpperCase())
              .limit(10)
              .snapshots()
              .listen((event) {
            lastDocument = event.docs.last;
            allUsers = [];
            for (var i in event.docs) {
              allUsers.add(UserModel.fromMap(i.data()));
            }
            notifyListeners();
          });
        } else {
          print("6666666666666666666666666666666");
          return FirebaseFirestore.instance
              .collection(FirebaseConstants.userCollection)
              .where("search", arrayContains: search.text.trim().toUpperCase())
              .limit(10)
              .snapshots()
              .listen((event) {
            lastDocument = event.docs.last;
            allUsers = [];
            for (var i in event.docs) {
              allUsers.add(UserModel.fromMap(i.data()));
            }
            notifyListeners();
          });
        }
      }
    } on FirebaseException catch (e) {
      throw ServerException(message: e.toString());
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<StreamSubscription<QuerySnapshot<Map<String, dynamic>>>>
      getNextUsers() async {
    List<UserModel> res = [];
    try {
      {
        if (search.text.isEmpty) {
          if (selectedValue == 3) {
            return FirebaseFirestore.instance
                .collection(FirebaseConstants.userCollection)
                .where("age", isLessThan: 60)
                .startAfterDocument(lastDocument!)
                .limit(10)
                .snapshots()
                .listen((event) {
              lastDocument = event.docs.last;
              allUsers = [];
              for (var i in event.docs) {
                allUsers.add(UserModel.fromMap(i.data()));
              }
              allUsers = allUsers.toSet().toList();
              // allUsers = res.toSet().toList();
            });
          } else if (selectedValue == 2) {
            return FirebaseFirestore.instance
                .collection(FirebaseConstants.userCollection)
                .where("age", isGreaterThanOrEqualTo: 60)
                .startAfterDocument(lastDocument!)
                .limit(10)
                .snapshots()
                .listen((event) {
              lastDocument = event.docs.last;
              allUsers = [];
              for (var i in event.docs) {
                allUsers.add(UserModel.fromMap(i.data()));
              }
              // allUsers.toSet().toList();
            });
          } else {
            return FirebaseFirestore.instance
                .collection(FirebaseConstants.userCollection)
                .startAfterDocument(lastDocument!)
                .limit(10)
                .snapshots()
                .listen((event) {
              lastDocument = event.docs.last;
              allUsers = [];
              for (var i in event.docs) {
                allUsers.add(UserModel.fromMap(i.data()));
              }
              allUsers.toSet().toList();
            });
          }
        } else {
          if (selectedValue == 3) {
            return FirebaseFirestore.instance
                .collection(FirebaseConstants.userCollection)
                .where("age", isLessThan: 60)
                .where("search",
                    arrayContains: search.text.trim().toUpperCase())
                .startAfterDocument(lastDocument!)
                .limit(10)
                .snapshots()
                .listen((event) {
              lastDocument = event.docs.last;
              allUsers = [];
              for (var i in event.docs) {
                allUsers.add(UserModel.fromMap(i.data()));
              }
              // allUsers.toSet().toList();
            });
          } else if (selectedValue == 2) {
            return FirebaseFirestore.instance
                .collection(FirebaseConstants.userCollection)
                .where("age", isGreaterThanOrEqualTo: 60)
                .where("search",
                    arrayContains: search.text.trim().toUpperCase())
                .startAfterDocument(lastDocument!)
                .limit(10)
                .snapshots()
                .listen((event) {
              lastDocument = event.docs.last;
              allUsers = [];
              for (var i in event.docs) {
                allUsers.add(UserModel.fromMap(i.data()));
              }
              // allUsers.toSet().toList();
            });
          } else {
            return FirebaseFirestore.instance
                .collection(FirebaseConstants.userCollection)
                .where("search",
                    arrayContains: search.text.trim().toUpperCase())
                .startAfterDocument(lastDocument!)
                .limit(10)
                .snapshots()
                .listen((event) {
              lastDocument = event.docs.last;
              allUsers = [];
              for (var i in event.docs) {
                allUsers.add(UserModel.fromMap(i.data()));
              }
              // allUsers.toSet().toList();
            });
          }
        }
      }
    } on FirebaseException catch (e) {
      throw ServerException(message: e.toString());
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  void changeValue({required int nbr, required BuildContext context}) {
    selectedValue = nbr;
    Navigator.pop(context);
    notifyListeners();
  }

  void change() {
    isLoading = true;
    notifyListeners();
  }

  void change1() {
    isLoading = false;
    notifyListeners();
  }
}
