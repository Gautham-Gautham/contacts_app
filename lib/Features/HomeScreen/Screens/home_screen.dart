import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_app/Core/Constants/firebase_constants.dart';
import 'package:contacts_app/Core/custom_textform_field/custom_textform.dart';
import 'package:contacts_app/Features/Authentication/Screens/login.dart';
import 'package:contacts_app/Features/HomeScreen/Provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../Models/userModel.dart';
import '../../CreateUser/Screens/create_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  List<UserModel> allUsers = [];
  final ScrollController scroll = ScrollController();
  Future<void> lazzyLoading() async {
    await Future.delayed(
      Duration(seconds: 1),
      () async {
        setState(() {
          isLoading = false;
        });
        final res = await FirebaseFirestore.instance
            .collection(FirebaseConstants.userCollection)
            .get();
        for (var i in res.docs) {
          final asjdjn = UserModel.fromMap(i.data());
          allUsers.add(asjdjn);
        }
      },
    );
  }

  @override
  void initState() {
    scroll.addListener(
      () {
        if (scroll.offset >= scroll.position.maxScrollExtent) {
          setState(() {
            isLoading = true;
          });
          lazzyLoading();
          print("object");
        }
      },
    );
    super.initState();
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
        body: Consumer<HomeProvider>(
          builder: (context, homeProvider, child) {
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
                              controller: homeProvider.homeModel.search,
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
                                                      groupValue: homeProvider
                                                          .selectedValue,
                                                      onChanged: (value) {
                                                        homeProvider
                                                            .changeValue(
                                                                nbr: value!,
                                                                context:
                                                                    context);
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
                                                      groupValue: homeProvider
                                                          .selectedValue,
                                                      onChanged: (value) {
                                                        // setState(() {
                                                        //   homeProvider
                                                        //           .selectedValue =
                                                        //       value!;
                                                        //   Navigator.pop(
                                                        //       context);
                                                        // });
                                                        homeProvider
                                                            .changeValue(
                                                                nbr: value!,
                                                                context:
                                                                    context);
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
                                                      groupValue: homeProvider
                                                          .selectedValue,
                                                      onChanged: (value) {
                                                        // setState(() {
                                                        //   homeProvider
                                                        //           .selectedValue =
                                                        //       value!;
                                                        //   Navigator.pop(
                                                        //       context);
                                                        // });
                                                        homeProvider
                                                            .changeValue(
                                                                nbr: value!,
                                                                context:
                                                                    context);
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
                    Text(
                      "Users List",
                      style: GoogleFonts.poppins(
                          fontSize: width * 0.05, color: Colors.black),
                    ),
                    StreamBuilder(
                      stream: homeProvider.getUser(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<UserModel> users = snapshot.data!;
                          return SizedBox(
                              height: height * 0.77,
                              child: ListView.builder(
                                controller: scroll,
                                scrollDirection: Axis.vertical,
                                itemCount: users.length,
                                itemBuilder: (context, index) {
                                  final currentUserNow = users[index];
                                  return Card(
                                    color: Colors.white,
                                    child: ListTile(
                                      // tileColor: Colors.transparent,
                                      minTileHeight: height * 0.1,
                                      leading: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(currentUserNow.image),
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
                              ));
                        } else if (snapshot.hasError) {
                          print("object");
                          return const Center(
                            child: Text("data"),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    )
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
