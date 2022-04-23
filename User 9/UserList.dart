// ignore_for_file: unused_import, unnecessary_import, deprecated_member_use, prefer_const_constructors, duplicate_ignore

import 'dart:convert';
import 'dart:ui';

import 'package:fine_lines_granite/constants/Color.dart';
import 'package:fine_lines_granite/constants/String.dart';

import 'package:fine_lines_granite/dark_mode/notifier_provider.dart';
import 'package:fine_lines_granite/Screens/Home/Home.dart';
import 'package:fine_lines_granite/responsive/base_widget.dart';
import 'package:fine_lines_granite/screens/Unit/UnitList.dart';
import 'package:fine_lines_granite/screens/User/AddEditUser.dart';
import 'package:fine_lines_granite/screens/User/UserConstants.dart';
import 'package:fine_lines_granite/utils/shared_prefrences_helprt.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class UserList extends StatefulWidget {
  // UserList(String string, String string2, String string3, String string4,
  //     String string5, String string6);

  // static const String routeName = '/User';

  // get unUserId => '';

  @override
  State<UserList> createState() => _UserState();
}

class _UserState extends State<UserList> {
  List? data;
  String Token = "";

  // String IsLogin = "";
  // int UserRole = 1;

  // get userInputValue => null;

  // get index => null;

  @override
  void initState() {
    super.initState();
    // String stUserId;
    _UserData();
    // futureAlbum = GetProjectList();
  }

  _UserData() async {
    MySharedPreferences.instance
        .getStringValue("AuthorizationToken")
        .then((value) => setState(() {
              if (value.isNotEmpty) {
                Token = value;
                GetUserList();
              }
              Token = value.toString();
            }));

    MySharedPreferences.instance
        .getListData("LoginDataList")
        .then((value) => setState(() {
              print(value);
            }));
  }

  Future<String> OnSearch(String value) async {
    final queryParameters = {"inStatus": 0, "stSearchText": value};
    var url = 'http://192.168.5.10:7845/api/User/GetUserList';
    var body = json.encode(queryParameters);
    print(body);
    try {
      var response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
            'Authorization': 'Bearer $Token',
          },
          body: body);

      data = jsonDecode(response.body);
      print(data);
      // setState(() {
      // });
    } catch (e) {
      print(e);
    }
    return "Success!";
  }

  Future<String> GetUserList() async {
    // print()

    final queryParameters = {"inStatus": 0, "stSearchText": ""};
    var url = 'http://192.168.5.10:7845/api/User/GetUserList';
    var body = json.encode(queryParameters);
    print(body);
    try {
      var response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
            'Authorization': 'Bearer $Token',
          },
          body: body);

      data = jsonDecode(response.body);
      print(data);
      // setState(() {
      // });
    } catch (e) {
      print(e);
    }
    return "Success!";
  }

  // Future<String> OnSearch(String value) async {
  //   var token = 'Bearer ' + Token;
  //   print(token);
  //   final queryParameters = {"stSearchText": value, "inStatus": 0};
  //   var url = 'http://192.168.5.10:7845/api/User/GetUserList';
  //   var body = json.encode(queryParameters);
  //   print(body);
  //   try {
  //     var response = await http.post(Uri.parse(url),
  //         headers: {
  //           "Content-Type": "application/json",
  //           'Accept': 'application/json',
  //           'Authorization': 'Bearer $Token',
  //         },
  //         body: body);

  //     setState(() {
  //       data = jsonDecode(response.body);
  //       // print(data);
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  //   return "Success!";
  // }

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);
    return BaseWidget(
      builder: (context, sizingInformation) {
        return Scaffold(
            backgroundColor: appModel.darkTheme == true
                ? AppColors.SMOKY_BLACK
                : const Color(0xffF5F6F8),
            appBar: AppBar(
              iconTheme: IconThemeData(color: AppColors.SMOKY_BLACK),
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: appModel.darkTheme == true
                      ? AppColors.HONEYDEW
                      : AppColors.SMOKY_BLACK,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              actions: <Widget>[
                // ignore: unnecessary_new
                new IconButton(
                  icon: Icon(
                    Icons.add,
                    color: appModel.darkTheme == true
                        ? AppColors.HONEYDEW
                        : AppColors.SMOKY_BLACK,
                  ),
                  onPressed: () {
                    // print(data?[index]["unUnitId"]);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => AddEditUser(
                    //       data![index]["unUserId"].toString(),
                    //     ),
                    //     // widget.userId.toString(),
                    //     // data?[index]["unUnitId"])
                    //   ),
                    // );
                  },
                ),
              ],
              title: Text(
                UserConstants.User_List,
                style: TextStyle(
                    color: appModel.darkTheme == true
                        ? AppColors.HONEYDEW
                        : AppColors.SMOKY_BLACK,
                    fontSize: 3.h),
              ),
              automaticallyImplyLeading: false,
              backgroundColor: appModel.darkTheme == true
                  ? AppColors.SMOKY_BLACK
                  : const Color(0xffF5F6F8),
            ),
            // drawer: NavDrawer(),
            body: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        // ignore: prefer_const_constructors
                        child: Text(
                          UserConstants.User_List,
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 2.h,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.all(1.w),
                        decoration: BoxDecoration(
                            color: appModel.darkTheme == true
                                ? AppColors.MEDIUM_JUNGLE_GREEN
                                : AppColors.HONEYDEW,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: Padding(
                            padding: EdgeInsets.only(top: 0.5.h),
                            child: TextFormField(
                                onChanged: (value) => OnSearch(value),
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                  hintText: UserConstants.User_search,
                                  border: InputBorder.none,
                                )),
                          ),
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          itemCount: data == null ? 0 : data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                  (data![index]["stName"]),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 2.h,
                                      fontFamily: Constants.SansProMedium),
                                ),
                                subtitle: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        // Icon(Icons.circle,
                                        //     color: data![index]["inStatus"]
                                        //                 .toString() ==
                                        //             "0"
                                        //         ? Color(0xff339965)
                                        //         : data![index]["inStatus"]
                                        //                     .toString() ==
                                        //                 "1"
                                        //             ? Color(0xff3da9f4)
                                        //             : data![index]["inStatus"]
                                        //                         .toString() ==
                                        //                     "2"
                                        //                 ? Color(0xfff69934)
                                        //                 : Color(0xff339965),
                                        //     size: 10),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        // InkWell(
                                        //     onTap: () {},
                                        //     child: Text(
                                        //       data![index]["inStatus"]
                                        //                   .toString() ==
                                        //               "0"
                                        //           ? "Pending"
                                        //           : data![index]["inStatus"]
                                        //                       .toString() ==
                                        //                   "1"
                                        //               ? "Active"
                                        //               : '${data![index]["inStatus"].toString() == "2" ? "Complete" : null}',
                                        //       style: TextStyle(
                                        //           color: data![index]
                                        //                           ["inStatus"]
                                        //                       .toString() ==
                                        //                   "0"
                                        //               ? Color(0xff339965)
                                        //               : data![index]["inStatus"]
                                        //                           .toString() ==
                                        //                       "1"
                                        //                   ? Color(0xff3da9f4)
                                        //                   : data![index]["inStatus"]
                                        //                               .toString() ==
                                        //                           "2"
                                        //                       ? Color(
                                        //                           0xfff69934)
                                        //                       : Color(
                                        //                           0xff339965),
                                        //           fontFamily:
                                        //               Constants.SansProRegular,
                                        //           fontSize: 11),
                                        //     )),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              print(data?[index]["unUserId"]
                                                  .toString());
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddEditUser(data?[index]
                                                            ["unUserId"])),
                                              );
                                            },
                                            child: Container(
                                                // ignore: prefer_const_literals_to_create_immutables
                                                child: Row(children: [
                                              const Icon(
                                                Icons.edit,
                                                color: Color(0xffA1A1A1),
                                                size: 10,
                                              ),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              const Text(
                                                UserConstants.User_Edit,
                                                style: TextStyle(
                                                    color: Color(0xffA1A1A1),
                                                    fontSize: 11,
                                                    fontFamily: Constants
                                                        .SansProRegular),
                                              )
                                            ]))),
                                        Spacer(),
                                        InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddEditUser(
                                                          "",
                                                          // data![index]["stName"]
                                                          //     .toString(),
                                                        )),
                                              );
                                            },
                                            child: Container(
                                                child: Text(
                                                    UserConstants
                                                        .User_view_more,
                                                    style: TextStyle(
                                                        color:
                                                            AppColors
                                                                .PERSIAN_ORANGE,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontSize: 2.w,
                                                        fontFamily: Constants
                                                            .SansProBold))))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              elevation: 3,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: appModel.darkTheme == true
                                        ? AppColors.MEDIUM_JUNGLE_GREEN
                                        : AppColors.HONEYDEW,
                                  )),
                            );
                          }),
                      const Spacer(),
                      Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          height: 70.0,
                          child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddEditUser(
                                            "",
                                          )),
                                );
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => AddEditUser(),
                                //     )
                                //     );
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    // ignore: prefer_const_constructors
                                    gradient: LinearGradient(
                                      colors: AppColors.Button,
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Container(
                                  alignment: Alignment.center,
                                  // ignore: prefer_const_constructors
                                  child: Text(
                                    UserConstants.User_ADD_New_User,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColors.SMOKY_BLACK,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )))
                    ])));
      },
    );
  }
}
