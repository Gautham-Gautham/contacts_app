import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';

import '../../../Core/Constants/firebase_constants.dart';
import '../../../Core/common/exception.dart';
import '../../../Models/userModel.dart';
import '../../Authentication/Screens/login.dart';
import '../../CreateUser/Screens/create_user.dart';
import '../Provider/hom_two_provider.dart';
import '../Provider/home_provider.dart';

class Homescreen2 extends StatefulWidget {
  const Homescreen2({super.key});

  @override
  State<Homescreen2> createState() => _Homescreen2State();
}

class _Homescreen2State extends State<Homescreen2> {
  HomTwoProvider _provider = HomTwoProvider();
  bool isLoading = false;
  // bool isLoading = false;
  // int selectedValue = 1;
  //
  // List<UserModel> allUsers = [];
  // final ScrollController scroll = ScrollController();
  // TextEditingController search = TextEditingController();

  // QueryDocumentSnapshot? lastDocument;
  @override
  // Future<StreamSubscription<QuerySnapshot<Map<String, dynamic>>>>
  //     getInitialUsers({required String search, required int ageFilter}) async {
  //   try {
  //     print(search);
  //     print(
  //         "Sssssssssseeeeeeeaaaaaaaaaaaaaarrrrrrrrrrrrrrrrrrccccccccccccccchhhhhhhhhhhhhhhhhhhhh");
  //     if (search.isEmpty) {
  //       if (ageFilter == 3) {
  //         print("1111111111111111111111111111");
  //         return FirebaseFirestore.instance
  //             .collection(FirebaseConstants.userCollection)
  //             .where("age", isLessThan: 60)
  //             .limit(10)
  //             .snapshots()
  //             .listen((event) {
  //           lastDocument = event.docs.last;
  //           for (var i in event.docs) {
  //             allUsers.add(UserModel.fromMap(i.data()));
  //           }
  //         });
  //       } else if (ageFilter == 2) {
  //         print("22222222222222222222222");
  //         return FirebaseFirestore.instance
  //             .collection(FirebaseConstants.userCollection)
  //             .where("age", isGreaterThanOrEqualTo: 60)
  //             .limit(10)
  //             .snapshots()
  //             .listen((event) {
  //           lastDocument = event.docs.last;
  //           for (var i in event.docs) {
  //             allUsers.add(UserModel.fromMap(i.data()));
  //           }
  //         });
  //       } else {
  //         print("33333333333333333333333333333");
  //         return FirebaseFirestore.instance
  //             .collection(FirebaseConstants.userCollection)
  //             .limit(10)
  //             .snapshots()
  //             .listen((event) {
  //           lastDocument = event.docs.last;
  //           for (var i in event.docs) {
  //             allUsers.add(UserModel.fromMap(i.data()));
  //           }
  //         });
  //       }
  //     } else {
  //       if (ageFilter == 3) {
  //         print("44444444444444444444444444444444444");
  //         return FirebaseFirestore.instance
  //             .collection(FirebaseConstants.userCollection)
  //             .where("age", isLessThan: 60)
  //             .where("search", arrayContains: search.toUpperCase())
  //             .limit(10)
  //             .snapshots()
  //             .listen((event) {
  //           lastDocument = event.docs.last;
  //           for (var i in event.docs) {
  //             allUsers.add(UserModel.fromMap(i.data()));
  //           }
  //         });
  //       } else if (ageFilter == 2) {
  //         print("555555555555555555555555555555");
  //         return FirebaseFirestore.instance
  //             .collection(FirebaseConstants.userCollection)
  //             .where("age", isGreaterThanOrEqualTo: 60)
  //             .where("search", arrayContains: search.toUpperCase())
  //             .limit(10)
  //             .snapshots()
  //             .listen((event) {
  //           lastDocument = event.docs.last;
  //           for (var i in event.docs) {
  //             allUsers.add(UserModel.fromMap(i.data()));
  //           }
  //         });
  //       } else {
  //         print("6666666666666666666666666666666");
  //         return FirebaseFirestore.instance
  //             .collection(FirebaseConstants.userCollection)
  //             .where("search", arrayContains: search.toUpperCase())
  //             .limit(10)
  //             .snapshots()
  //             .listen((event) {
  //           lastDocument = event.docs.last;
  //           for (var i in event.docs) {
  //             allUsers.add(UserModel.fromMap(i.data()));
  //           }
  //         });
  //       }
  //     }
  //   } on FirebaseException catch (e) {
  //     throw ServerException(message: e.toString());
  //   } catch (e) {
  //     throw ServerException(message: e.toString());
  //   }
  // }
  //
  // @override
  // Future<StreamSubscription<QuerySnapshot<Map<String, dynamic>>>> getNextUsers(
  //     {required String search,
  //     required int ageFilter,
  //     required lastDoc}) async {
  //   try {
  //     if (search.isEmpty) {
  //       if (ageFilter == 3) {
  //         return FirebaseFirestore.instance
  //             .collection(FirebaseConstants.userCollection)
  //             .where("age", isLessThan: 60)
  //             .startAfterDocument(lastDoc)
  //             .limit(10)
  //             .snapshots()
  //             .listen((event) {
  //           lastDocument = event.docs.last;
  //           for (var i in event.docs) {
  //             allUsers.add(UserModel.fromMap(i.data()));
  //           }
  //         });
  //       } else if (ageFilter == 2) {
  //         return FirebaseFirestore.instance
  //             .collection(FirebaseConstants.userCollection)
  //             .where("age", isGreaterThanOrEqualTo: 60)
  //             .startAfterDocument(lastDoc)
  //             .limit(10)
  //             .snapshots()
  //             .listen((event) {
  //           lastDocument = event.docs.last;
  //           for (var i in event.docs) {
  //             allUsers.add(UserModel.fromMap(i.data()));
  //           }
  //         });
  //       } else {
  //         return FirebaseFirestore.instance
  //             .collection(FirebaseConstants.userCollection)
  //             .startAfterDocument(lastDoc)
  //             .limit(10)
  //             .snapshots()
  //             .listen((event) {
  //           lastDocument = event.docs.last;
  //           for (var i in event.docs) {
  //             allUsers.add(UserModel.fromMap(i.data()));
  //           }
  //         });
  //       }
  //     } else {
  //       if (ageFilter == 3) {
  //         return FirebaseFirestore.instance
  //             .collection(FirebaseConstants.userCollection)
  //             .where("age", isLessThan: 60)
  //             .where("search", arrayContains: search.toUpperCase())
  //             .startAfterDocument(lastDoc)
  //             .limit(10)
  //             .snapshots()
  //             .listen((event) {
  //           lastDocument = event.docs.last;
  //           for (var i in event.docs) {
  //             allUsers.add(UserModel.fromMap(i.data()));
  //           }
  //         });
  //       } else if (ageFilter == 2) {
  //         return FirebaseFirestore.instance
  //             .collection(FirebaseConstants.userCollection)
  //             .where("age", isGreaterThanOrEqualTo: 60)
  //             .where("search", arrayContains: search.toUpperCase())
  //             .startAfterDocument(lastDoc)
  //             .limit(10)
  //             .snapshots()
  //             .listen((event) {
  //           lastDocument = event.docs.last;
  //           for (var i in event.docs) {
  //             allUsers.add(UserModel.fromMap(i.data()));
  //           }
  //         });
  //       } else {
  //         return FirebaseFirestore.instance
  //             .collection(FirebaseConstants.userCollection)
  //             .where("search", arrayContains: search.toUpperCase())
  //             .startAfterDocument(lastDoc)
  //             .limit(10)
  //             .snapshots()
  //             .listen((event) {
  //           lastDocument = event.docs.last;
  //           for (var i in event.docs) {
  //             allUsers.add(UserModel.fromMap(i.data()));
  //           }
  //         });
  //       }
  //     }
  //   } on FirebaseException catch (e) {
  //     throw ServerException(message: e.toString());
  //   } catch (e) {
  //     throw ServerException(message: e.toString());
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // getInitialUsers(search: search.text.trim(), ageFilter: selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              const Icon(
                CupertinoIcons.location_solid,
                color: Colors.white,
              ),
              Text(
                "Nilambur",
                style: GoogleFonts.poppins(color: Colors.white),
              )
            ],
          ),
        ),
        body: Consumer<HomTwoProvider>(
          builder: (context, provider, child) {
            provider.getInitialUsers();
            // provider.allUsers.toSet().toList();
            return SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.only(left: width * 0.03, right: width * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.03, right: width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: height * 0.06,
                            width: width * 0.7,
                            child: TextFormField(
                              controller: provider.search,
                              decoration: InputDecoration(
                                  hintText: "Enter Name",
                                  prefixIcon: const Icon(CupertinoIcons.search),
                                  contentPadding:
                                      EdgeInsets.only(bottom: height * 0.01),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                          ),
                          Container(
                              height: height * 0.05,
                              width: width * 0.11,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(14)),
                              child: IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text(
                                              "Sort",
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: width * 0.05,
                                                  color: Colors.black),
                                            ),
                                            content: Container(
                                              height: height * 0.25,
                                              child: Center(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    RadioListTile<int>(
                                                      title: Text(
                                                        'All',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize:
                                                              width * 0.04,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      value: 1,
                                                      groupValue: provider
                                                          .selectedValue,
                                                      onChanged: (value) {
                                                        provider.changeValue(
                                                            nbr: value!,
                                                            context: context);
                                                      },
                                                    ),
                                                    RadioListTile<int>(
                                                      title: Text(
                                                        'Age: Elder',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize:
                                                              width * 0.04,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      value: 2,
                                                      groupValue: provider
                                                          .selectedValue,
                                                      onChanged: (value) {
                                                        provider.changeValue(
                                                            nbr: value!,
                                                            context: context);
                                                      },
                                                    ),
                                                    RadioListTile<int>(
                                                      title: Text(
                                                        'Age: Younger',
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize:
                                                              width * 0.04,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      value: 3,
                                                      groupValue: provider
                                                          .selectedValue,
                                                      onChanged: (value) {
                                                        provider.changeValue(
                                                            nbr: value!,
                                                            context: context);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ));
                                },
                                icon: const Icon(
                                  Icons.sort,
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      "Users List",
                      style: GoogleFonts.poppins(
                          fontSize: width * 0.05, color: Colors.black),
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    SizedBox(
                      height: height * 0.75,
                      child: LazyLoadScrollView(
                        isLoading: isLoading,
                        scrollDirection: Axis.vertical,
                        onEndOfPage: () async {
                          print("11111111111111111111111");

                          setState(() {
                            isLoading = true;
                          });

                          Future.delayed(const Duration(milliseconds: 500))
                              .then((value) {
                            provider.getNextUsers();
                            setState(() {
                              isLoading = false;
                            });
                          });
                          // provider.allUsers.toSet().toList();
                        },
                        child: Scrollbar(
                          child: provider.allUsers.isEmpty
                              ? SizedBox(
                                  child: Image.asset("assets/peakpx.jpg"),
                                )
                              : ListView.builder(
                                  controller: provider.scroll,
                                  scrollDirection: Axis.vertical,
                                  itemCount: provider.allUsers.length,
                                  itemBuilder: (context, index) {
                                    final currentUserNow =
                                        provider.allUsers[index];

                                    return Card(
                                      color: Colors.white,
                                      child: ListTile(
                                        // tileColor: Colors.transparent,
                                        minTileHeight: height * 0.1,
                                        leading: CircleAvatar(
                                          backgroundImage:
                                              currentUserNow.image == ""
                                                  ? const AssetImage(
                                                      "assets/peakpx.jpg")
                                                  : NetworkImage(
                                                      currentUserNow.image),
                                          radius: height * 0.04,
                                          // child: SvgPicture.asset("assets/Rectangle 88.svg"),
                                        ),
                                        title: Text(
                                          currentUserNow.name,
                                          style: GoogleFonts.poppins(
                                              fontSize: width * 0.05,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        subtitle: Text(
                                          "Age :${currentUserNow.age}",
                                          style: GoogleFonts.poppins(
                                              fontSize: width * 0.04,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ),
                    )
                    // Consumer<HomTwoProvider>(
                    //   builder: (context, provider1, child) {
                    //     return SizedBox(
                    //       height: height * 0.75,
                    //       child: LazyLoadScrollView(
                    //         isLoading: isLoading,
                    //         scrollDirection: Axis.vertical,
                    //         onEndOfPage: () async {
                    //           print("11111111111111111111111");
                    //
                    //           setState(() {
                    //             isLoading = true;
                    //           });
                    //
                    //           Future.delayed(const Duration(seconds: 2))
                    //               .then((value) {
                    //             provider.getNextUsers();
                    //             setState(() {
                    //               isLoading = false;
                    //             });
                    //           });
                    //         },
                    //         child: Scrollbar(
                    //           child: provider.allUsers.isEmpty
                    //               ? SizedBox(
                    //                   child: Image.asset("assets/peakpx.jpg"),
                    //                 )
                    //               : ListView.builder(
                    //                   controller: provider.scroll,
                    //                   scrollDirection: Axis.vertical,
                    //                   itemCount: provider.allUsers.length,
                    //                   itemBuilder: (context, index) {
                    //                     final currentUserNow =
                    //                         provider.allUsers[index];
                    //
                    //                     return Card(
                    //                       color: Colors.white,
                    //                       child: ListTile(
                    //                         // tileColor: Colors.transparent,
                    //                         minTileHeight: height * 0.1,
                    //                         leading: CircleAvatar(
                    //                           backgroundImage:
                    //                               currentUserNow.image == ""
                    //                                   ? const AssetImage(
                    //                                       "assets/peakpx.jpg")
                    //                                   : NetworkImage(
                    //                                       currentUserNow.image),
                    //                           radius: height * 0.04,
                    //                           // child: SvgPicture.asset("assets/Rectangle 88.svg"),
                    //                         ),
                    //                         title: Text(
                    //                           currentUserNow.name,
                    //                           style: GoogleFonts.poppins(
                    //                               fontSize: width * 0.05,
                    //                               fontWeight: FontWeight.w500),
                    //                         ),
                    //                         subtitle: Text(
                    //                           "Age :${currentUserNow.age}",
                    //                           style: GoogleFonts.poppins(
                    //                               fontSize: width * 0.04,
                    //                               fontWeight: FontWeight.w500),
                    //                         ),
                    //                       ),
                    //                     );
                    //                   },
                    //                 ),
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: CircleAvatar(
            radius: width * 0.07,
            backgroundColor: Colors.black,
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const CreateUser(),
                );
                // CreateUser();
              },
              icon: const Icon(
                CupertinoIcons.add,
                color: Colors.white,
              ),
            )),
      )),
    );
  }
}
