import 'package:contacts_app/Core/custom_textform_field/custom_textform.dart';
import 'package:contacts_app/Features/Authentication/Screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../CreateUser/Screens/create_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Icon(
                CupertinoIcons.location_solid,
                color: Colors.white,
              ),
              Text(
                "Nilambour",
                style: GoogleFonts.poppins(color: Colors.white),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.06, right: width * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: height * 0.06,
                      width: width * 0.7,
                      child: TextFormField(
                        controller: search,
                        decoration: InputDecoration(
                            prefixIcon: Icon(CupertinoIcons.search),
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
                      child: Icon(
                        Icons.sort,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                "Users List",
                style: GoogleFonts.poppins(
                    fontSize: width * 0.05, color: Colors.black),
              ),
              SizedBox(
                  height: height * 0.77,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          minTileHeight: height * 0.1,
                          leading: CircleAvatar(
                            backgroundImage: AssetImage("assets/peakpx.jpg"),
                            radius: height * 0.04,
                            // child: SvgPicture.asset("assets/Rectangle 88.svg"),
                          ),
                          title: Text(
                            "Name",
                            style: GoogleFonts.poppins(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            "Age : 20",
                            style: GoogleFonts.poppins(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      );
                    },
                  ))
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: CircleAvatar(
            radius: width * 0.07,
            backgroundColor: Colors.black,
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => CreateUser(),
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
