// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:convert';
import 'dart:ffi';

import 'package:fine_lines_granite/constants/Color.dart';
import 'package:fine_lines_granite/dark_mode/notifier_provider.dart';
import 'package:fine_lines_granite/responsive/base_widget.dart';
import 'package:fine_lines_granite/screens/User/UserConstants.dart';
import 'package:fine_lines_granite/screens/User/UserList.dart';
import 'package:fine_lines_granite/screens/User/model_class.dart';
import 'package:fine_lines_granite/screens/User/provider.dart';
import 'package:fine_lines_granite/utils/shared_prefrences_helprt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../../constants/String.dart';

class AddEditUser extends StatefulWidget {
  static const String routeName = 'Add/Edit';
  String ErrorMessage = "";
  String unUserId;

  AddEditUser(
    this.unUserId,
  );

  // AddEditUser(String string, String s);

  // This widget is the root of your application.
  // String UserId;

  // AddEditUser(this.UserId);
  @override
  State<StatefulWidget> createState() {
    return AddEditstate();
  }
}

class AddEditstate extends State<AddEditUser> {
  @override
  // void initState() {
  //   super.initState();
  //   _UserData();
  //   // futureAlbum = GetList();
  // }
  // var selectedStatusValue1;
  // static const deviceTypes1 = [
  //   "Manger",
  //   "Demo",
  //   "RR",
  //   "test",
  //   "worker",
  //   "SuperAdmin",
  //   "User 2",
  //   "User"
  // ];

  var selectedStatusValue2;
  static const deviceTypes2 = ["Active", "DeActive"];

  // get _ProjectNotes => null;
  List? RoleData;
  String Token = "";
  String UnUserId = "";
  String Password = "";
  String SelectedStatus = "Status";
  String ErrorMessage = "";
  bool IsErrorShow = false;
  final _UnitNumber = TextEditingController();
  final _UserStatus = TextEditingController();
  final _UserName = TextEditingController();
  final _UserEmail = TextEditingController();
  final _UserMobile_number = TextEditingController();
  final _UserRole = TextEditingController();
  final _UserLastname = TextEditingController();
  final _UserFristname = TextEditingController();
  final _UserPassward = TextEditingController();

  // var selectedStatusValue3;
  // String UserTypeConroller = "Test";
  TextEditingController dateinput = TextEditingController();

  final prefs = SharedPreferences.getInstance();

  String? newValue;

  // final String url = "http://192.168.5.10:7845/api/Role/GetRoleList";

  // // ignore: deprecated_member_use
  // List data = [];

  // get stRoleName => null;

  // set stRoleName(Object? stRoleName) {} //edited line

  // Future<String> GetRoleList() async {
  //   var res = await http.post(
  //       Uri.parse("http://192.168.5.10:7845/api/Role/GetRoleList"),
  //       headers: {
  //         "Content-Type": "application/json",
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $Token',
  //       },
  //       body: {
  //         "stSearch": "string"
  //       });
  //   var data = jsonDecode(res.body);
  //   print(data);
  //   var resBody = json.decode(res.body);

  //   setState(() {
  //     data = resBody;
  //   });

  //   print(resBody);

  //   return "Sucess";
  // }
  late Future<AlbumData> futureAlbum;

  @override
  void initState() {
    super.initState();
    _UserData();
    futureAlbum = fetchAlbum();
    // this.GetRoleList();
  }

  _UserData() async {
    MySharedPreferences.instance
        .getStringValue("AuthorizationToken")
        .then((value) => setState(() {
              if (value.isNotEmpty) {
                Token = value.toString();
                GetUserByUserId();
              }
            }));

    MySharedPreferences.instance
        .getListData("LoginDataList")
        .then((value) => setState(() {}));
    MySharedPreferences.instance
        .getListData("LoginDataList")
        .then((value) => setState(() {
              UnUserId = value[0];
              // Password = value[2];
            }));
  }

// ==========================================================================================================
  Future<String> GetUserByUserId() async {
    // print("123");
    var token = 'Bearer ' + Token;
    final queryParameters = {
      "unUserId": widget.unUserId == "" ? null : widget.unUserId
    };
    var url = 'http://192.168.5.10:7845/api/User/GetUserById';
    var body = json.encode(queryParameters);
    try {
      var response = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
            'Authorization': 'Bearer $Token',
          },
          body: body);
      var data = jsonDecode(response.body);
      var roleData = (data["getRoleListResponses"]);
      // var roleData1 = jsonDecode(roleData);
      // print(data["getRoleListResponses"]);
      print(roleData);
      RoleData = roleData;
      _UserName.text = data["userData"]["stUserId"];
      // final splitted = data["userData"]["stName"].split(' ');
      // print(splitted[1]);
      //  final   _UserFristname.text = splitted[0];
      //  final _UserLastname.text = splitted[1];
      _UserEmail.text = data["userData"]["stEmail"];
      _UserMobile_number.text = data["userData"]["stPhone"];
      _UserRole.text = data["userData"]["stRoleName"];

      // _UnitDescriptionController.text = data[0]["stNotes"];
      setState(() {
        data = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
    return "Success!";
  }

  void _submitCommand() async {
    var token = 'Bearer ' + Token;
    // if (formKey.currentState!.validate()) {
    final queryParameters = {
      "stUserId": '',
      "stPassword": _UserPassward.text,
      "stName": _UserName.text,
      "stPhone": _UserMobile_number.text,
      "stEmail": _UserEmail.text,
      "unRoleId": _UserRole.text,
      "inStatus": 0,
      "unCreatedBy": widget.unUserId
    };
    var url = 'http://192.168.5.10:7845/api/User/RegisterUserProfile';
    var body = json.encode(queryParameters);
    print(body);

    var response = await http.put(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer $Token',
        },
        body: body);
    var data = jsonDecode(response.body.toString());
    if (data['flgIsSuccess'] == false) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UserList()),
      );
    } else {
      ErrorMessage = data['stMessage'];
      setState(() {
        IsErrorShow = true;
        // startTime() async {
        //   var duration = Duration(seconds: 3);
        //   return Timer(duration, _IsErrorHide);
        // }
      });
      // print("Faild");
    }
  }

// ==============================================================================================
  Future<String> UpdateUserProfile() async {
    var token = 'Bearer ' + Token;
    final queryParameters = {
      "unUserId": widget.unUserId,
      "stUserId": "string",
      "stName": _UserName.text,
      "stPhone": _UserMobile_number.text,
      "stEmail": _UserEmail.text,
      "unRoleId": selectedStatusValue2,
      "inStatus": 0,
      "dtUpdationDate": null,
      "unUpdatedBy": widget.unUserId
    };
    var url = 'http://192.168.5.10:7845/api/User/UpdateUserProfile';
    var body = json.encode(queryParameters);
    print(body);
    try {
      var response = await http.put(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
            'Authorization': 'Bearer $Token',
          },
          body: body);
      var data = jsonDecode(response.body);
      print(data[0]["unUserId"]);
      _UserName.text = data[0]["stName"];
      _UserEmail.text = data[0]["stEmail"];
      _UserMobile_number.text = data[0]["stPhone"];
      selectedStatusValue2 = data[0]["stRoleName"];
      // setState(() {
      //   data = jsonDecode(response.body);
      // });
    } catch (e) {
      print(e);
    }
    return "Success!";
  }

  var dataSet = "Please Select";

  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);
    final formKey = GlobalKey<FormState>();
    return BaseWidget(builder: (context, sizingInformation) {
      var outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: appModel.darkTheme == true
              ? AppColors.MEDIUM_JUNGLE_GREEN
              : Colors.white,
        ),
      );
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: DropdownButton<String>(
      //     borderRadius: BorderRadius.all(Radius.circular(5)),
      //     isExpanded: true,
      //     items: <String>['Status-1', 'Status-2', 'Status-3', 'Status-4']
      //         .map((String value) {
      //       return DropdownMenuItem<String>(
      //         value: value,
      //         child: Text(
      //           value,
      //           style: TextStyle(color: Colors.grey),
      //         ),
      //       );
      //     }).toList(),
      //     hint: Container(
      //       child: Text(
      //         "Select Status",
      //         style: TextStyle(color: Colors.grey),
      //         textAlign: TextAlign.end,
      //       ),
      //     ),
      //     onChanged: (_) {},
      //   ),
      // );
      // +++===================================================================================
      Future<AlbumData> fetchAlbum() async {
        final response = await http
            .post(Uri.parse(' http://192.168.5.10:7845/api/User/GetUserById'));

        if (response.statusCode == 200) {
          print("ook okkk");

          // If the server did return a 200 OK response,
          // then parse the JSON.
          return AlbumData.fromJson(jsonDecode(response.body));
        } else {
          print("not not");
          // If the server did not return a 200 OK response,
          // then throw an exception.
          throw Exception('Failed to load album');
        }
      }

      return Scaffold(
          backgroundColor: appModel.darkTheme == true
              ? AppColors.SMOKY_BLACK
              : AppColors.HONEYDEW,
          // backgroundColor: Color(0xffF5F6F8),
          appBar: AppBar(
            centerTitle: true,
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
            backgroundColor: appModel.darkTheme == true
                ? AppColors.SMOKY_BLACK
                : AppColors.HONEYDEW,
            title: Text(
              UserConstants.User_Name,
              style: TextStyle(
                color: appModel.darkTheme == true
                    ? AppColors.HONEYDEW
                    : AppColors.SMOKY_BLACK,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      // ignore: prefer_const_constructors
                      // ignore: unnecessary_new
                      // ignore: prefer_const_constructors
                      // ignore: unnecessary_new
                      child: new Text(
                        '',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(UserConstants.UserFristName,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 0.1.h,
                          ),
                          Container(
                            child: TextFormField(
                              controller: _UserFristname,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'User Name must be at list 2 Characters.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: appModel.darkTheme == true
                                        ? AppColors.MEDIUM_JUNGLE_GREEN
                                        : Colors.white,
                                  ),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(138, 138, 138, 1),
                                    fontFamily: Constants.RobotoRegular,
                                    fontSize: 14),
                                hintText: UserConstants.UserFristName_Hint,
                                fillColor: appModel.darkTheme == true
                                    ? Color(0xff2a2a2a)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 0.1.h,
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(UserConstants.UserLastname,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 0.1.h,
                          ),
                          Container(
                            child: TextFormField(
                              controller: _UserLastname,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'User Name must be at list 2 Characters.';
                                }
                                return null;
                              },
                              onEditingComplete: () {
                                print('onEditingComplete');
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: appModel.darkTheme == true
                                        ? AppColors.MEDIUM_JUNGLE_GREEN
                                        : Colors.white,
                                  ),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(138, 138, 138, 1),
                                    fontFamily: Constants.RobotoRegular,
                                    fontSize: 14),
                                hintText: UserConstants.UserLastname_Hint,
                                fillColor: appModel.darkTheme == true
                                    ? Color(0xff2a2a2a)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 0.1.h,
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(UserConstants.User_Name_Hint,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 0.1.h,
                          ),
                          Container(
                            child: TextFormField(
                              controller: _UserName,
                              // onTap: () {
                              //   print(_UserFristname.toString());
                              //   print(_UserLastname.toString());
                              // },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'User Name must be at list 2 Characters.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: appModel.darkTheme == true
                                        ? AppColors.MEDIUM_JUNGLE_GREEN
                                        : Colors.white,
                                  ),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(138, 138, 138, 1),
                                    fontFamily: Constants.RobotoRegular,
                                    fontSize: 14),
                                hintText: UserConstants.User_Name_Hint,
                                fillColor: appModel.darkTheme == true
                                    ? Color(0xff2a2a2a)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 0.1.h,
                    // ),
                    // Container(
                    //   margin: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(UserConstants.User_Name_Hint,
                    //           style: TextStyle(fontWeight: FontWeight.bold)),
                    //       SizedBox(
                    //         height: 0.1.h,
                    //       ),
                    //       Container(
                    //         child: TextFormField(
                    //           controller: _UserName,
                    //           validator: (value) {
                    //             if (value == null || value.isEmpty) {
                    //               return 'User Name must be at list 2 Characters.';
                    //             }
                    //             return null;
                    //           },
                    //           decoration: InputDecoration(
                    //             enabledBorder: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(10.0),
                    //               borderSide: BorderSide(
                    //                 color: appModel.darkTheme == true
                    //                     ? AppColors.MEDIUM_JUNGLE_GREEN
                    //                     : Colors.white,
                    //               ),
                    //             ),
                    //             filled: true,
                    //             hintStyle: TextStyle(
                    //                 color: Color.fromRGBO(138, 138, 138, 1),
                    //                 fontFamily: Constants.RobotoRegular,
                    //                 fontSize: 14),
                    //             hintText: UserConstants.Userpassward,
                    //             fillColor: appModel.darkTheme == true
                    //                 ? Color(0xff2a2a2a)
                    //                 : Colors.white,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(UserConstants.User_Email_Address,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 0.1.h,
                          ),
                          Container(
                            child: TextFormField(
                              controller: _UserEmail,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Valid Email Address.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: appModel.darkTheme == true
                                        ? AppColors.MEDIUM_JUNGLE_GREEN
                                        : Colors.white,
                                  ),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(138, 138, 138, 1),
                                    fontFamily: Constants.RobotoRegular,
                                    fontSize: 14),
                                hintText: UserConstants.User_Email_Address_Hint,
                                fillColor: appModel.darkTheme == true
                                    ? Color(0xff2a2a2a)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 0.1.h,
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(UserConstants.Userpassward,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 0.1.h,
                          ),
                          Container(
                            child: TextFormField(
                              controller: _UserPassward,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'User Name must be at list 2 Characters.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: appModel.darkTheme == true
                                        ? AppColors.MEDIUM_JUNGLE_GREEN
                                        : Colors.white,
                                  ),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(138, 138, 138, 1),
                                    fontFamily: Constants.RobotoRegular,
                                    fontSize: 14),
                                hintText: UserConstants.Userpassward,
                                fillColor: appModel.darkTheme == true
                                    ? Color(0xff2a2a2a)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(UserConstants.User_Mobile_no,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 0.1.h,
                          ),
                          Container(
                            child: TextFormField(
                              controller: _UserMobile_number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Mobile number must be number.';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: appModel.darkTheme == true
                                        ? AppColors.MEDIUM_JUNGLE_GREEN
                                        : Colors.white,
                                  ),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(138, 138, 138, 1),
                                    fontFamily: Constants.RobotoRegular,
                                    fontSize: 14),
                                hintText: UserConstants.User_Mobile_no_Hint,
                                fillColor: appModel.darkTheme == true
                                    ? Color(0xff2a2a2a)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 0.1.h,
                    // ),

                    // Container(
                    //   margin: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text("Role",
                    //           // controller: _UserMobile_number,
                    //           style: TextStyle(fontWeight: FontWeight.bold)),
                    //       SizedBox(
                    //         height: 0.1.h,
                    //       ),
                    //       Container(
                    //         decoration: BoxDecoration(
                    //           color: appModel.darkTheme == true
                    //               ? Color(0xff2a2a2a)
                    //               : Colors.white,
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(10)),
                    //         ),
                    //         child: Padding(
                    //           padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                    //           // child: new DropdownButton(
                    //           //   items: data.map((item) {
                    //           //     return new DropdownMenuItem(
                    //           //       child: new Text(item['stRoleName']),
                    //           //       value: item['stRoleName'].toString(),
                    //           //     );
                    //           //   }).toList(),
                    //           //   onChanged: (newVal) {
                    //           //     setState(() {
                    //           //       stRoleName = newVal;
                    //           //     });
                    //           //   },
                    //           //   value: stRoleName,
                    //           // ),
                    //           child: SizedBox(
                    //             child: FutureBuilder<AlbumData>(
                    //               // future: futureAlbum,
                    //               builder: (context, snapshot) {
                    //                 if (snapshot.hasData) {
                    //                   print(
                    //                       "${snapshot.data!.getRoleListResponses![1].stRoleName} 123123");
                    //                   return ExpansionTile(
                    //                     title: Text("dataSet"),
                    //                     children: [
                    //                       for (int i = 0; i <= 10; i++) ...{
                    //                         InkWell(
                    //                           onTap: () {
                    //                             setState(() {
                    //                               dataSet = snapshot
                    //                                   .data!
                    //                                   .getRoleListResponses![i]
                    //                                   .stRoleName!;
                    //                             });
                    //                           },
                    //                           child: ListTile(
                    //                               title: Text(
                    //                                   "${snapshot.data!.getRoleListResponses![i].stRoleName}")),
                    //                         ),
                    //                       }
                    //                     ],
                    //                   );
                    //                   // return ListView.builder(
                    //                   //     itemCount: 10,
                    //                   //     itemBuilder: (BuildContext context, int index) {
                    //                   //       cardKeyList.add(GlobalKey(debugLabel: "index :$index"));
                    //                   //       return ExpansionTileCard(
                    //                   //         title: Text('title'),
                    //                   //         key: cardKeyList[index],
                    //                   //         onExpansionChanged: (value) {
                    //                   //           if (value) {
                    //                   //             Future.delayed(const Duration(milliseconds: 500), () {
                    //                   //               for (var i = 0; i < cardKeyList.length; i++) {
                    //                   //                 if (index != i) {
                    //                   //                   cardKeyList[i].currentState?.collapse();
                    //                   //                 }
                    //                   //               }
                    //                   //             });
                    //                   //           }
                    //                   //         },
                    //                   //       );
                    //                   //     });
                    //                 }
                    //                 return Center(
                    //                   child: Container(),
                    //                 );
                    //               },
                    //             ),
                    //           ),
                    //
                    //           //  DropdownButton<String>(
                    //           //   borderRadius: const BorderRadius.all(
                    //           //       Radius.circular(5)),
                    //           //   isExpanded: true,
                    //           //   items: <String>[
                    //           //     'Status-1',
                    //           //     'Status-2',
                    //           //     'Status-3',
                    //           //     'Status-4'
                    //           //   ].map((String value) {
                    //           //     return DropdownMenuItem<String>(
                    //           //       value: value,
                    //           //       child: Text(
                    //           //         value,
                    //           //         style: const TextStyle(
                    //           //             color: Colors.grey),
                    //           //       ),
                    //           //     );
                    //           //   }).toList(),
                    //           //   hint: Container(
                    //           //     child: TextFormField(
                    //           //       controller: _Projectstatus,
                    //           //       style:
                    //           //           const TextStyle(color: Colors.grey),
                    //           //       validator: (value) {
                    //           //         if (value == null || value.isEmpty) {
                    //           //           return 'Select at list one status';
                    //           //         }
                    //           //         return null;
                    //           //       },
                    //           //     ),
                    //           //   ),
                    //           //   onChanged: (_) {},
                    //           // )
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    expanRole(),
                    Container(
                      margin: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Status",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 0.1.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: appModel.darkTheme == true
                                    ? Color(0xff2a2a2a)
                                    : Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                              child: SizedBox(
                                height: 50,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    hint: const Text(
                                      "Select Status",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(138, 138, 138, 1),
                                          fontFamily: Constants.RobotoRegular,
                                          fontSize: 14),
                                    ),
                                    value: selectedStatusValue2,
                                    isDense: true,
                                    isExpanded: true,
                                    onChanged: (newValue) {
                                      setState(() {
                                        selectedStatusValue2 = newValue;
                                      });
                                      print(selectedStatusValue2);
                                    },
                                    items: deviceTypes2.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),

                              // child: DropdownButton<String>(
                              //   isExpanded: true,
                              //   hint: const Text("Select Status"),
                              //   // value: SelectedStatus,
                              //   items: <String>[
                              //     'Pending',
                              //     'Active',
                              //     'Complete',
                              //   ].map((String value) {
                              //     return DropdownMenuItem<String>(
                              //       value: value,
                              //       child: Text(value),
                              //     );
                              //   }).toList(),
                              //   onChanged: (val) {
                              //     // setState(() {
                              //     //   SelectedStatus = val!;
                              //     // });
                              //   },
                              //   // onChanged: (String val) {
                              //   //   setState(() {
                              //   //     _selectedText = val;
                              //   //   });
                              //   // },
                              // ),

                              //  DropdownButton<String>(
                              //   borderRadius: const BorderRadius.all(
                              //       Radius.circular(5)),
                              //   isExpanded: true,
                              //   items: <String>[
                              //     'Status-1',
                              //     'Status-2',
                              //     'Status-3',
                              //     'Status-4'
                              //   ].map((String value) {
                              //     return DropdownMenuItem<String>(
                              //       value: value,
                              //       child: Text(
                              //         value,
                              //         style: const TextStyle(
                              //             color: Colors.grey),
                              //       ),
                              //     );
                              //   }).toList(),
                              //   hint: Container(
                              //     child: TextFormField(
                              //       controller: _Projectstatus,
                              //       style:
                              //           const TextStyle(color: Colors.grey),
                              //       validator: (value) {
                              //         if (value == null || value.isEmpty) {
                              //           return 'Select at list one status';
                              //         }
                              //         return null;
                              //       },
                              //     ),
                              //   ),
                              //   onChanged: (_) {},
                              // )
                            ),
                          ),
                        ],
                      ),
                    ),
                    // child: Padding(
                    //     padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                    //     child: DropdownButton<String>(
                    //       borderRadius: BorderRadius.all(Radius.circular(5)),
                    //       isExpanded: true,
                    //       items: <String>[
                    //         UnitConstants.Unit_status1,
                    //         UnitConstants.Unit_status2,
                    //         UnitConstants.Unit_status3,
                    //         UnitConstants.Unit_status4,
                    //       ].map((String value) {
                    //         return DropdownMenuItem<String>(
                    //           value: value,
                    //           child: Text(
                    //             value,
                    //             style: TextStyle(color: Colors.grey),
                    //           ),
                    //         );
                    //       }).toList(),
                    //       hint: Container(
                    //         child: Text(
                    //           UnitConstants.Unit_Status_Hint,
                    //           style: TextStyle(color: Colors.grey),
                    //           textAlign: TextAlign.end,
                    //         ),
                    //       ),
                    //       onChanged: (_) {},
                    //     )),

                    // SizedBox(
                    //   height: 0.1.h,
                    // ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(left: 3.5.w),
                              height: 55.0,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffc7954f)),
                                borderRadius: BorderRadius.circular(10),
                                // gradient: LinearGradient(
                                //     colors: [
                                //       Color(0xFFc89650),
                                //       Color(0xFFf2e294),
                                //     ],
                                //     begin: FractionalOffset(0.0, 0.0),
                                //     end: FractionalOffset(0.5, 0.0),
                                //     stops: [0.0, 1.0],
                                //     tileMode: TileMode.clamp),
                              ),
                              child: MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  UserConstants.Button_cancle,
                                  style: TextStyle(
                                      fontFamily: Constants.SansProMedium,
                                      fontSize: 16,
                                      color: Color(0xffc7954f)),
                                ),
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                              height: 55.0,
                              margin: EdgeInsets.only(right: 3.5.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    colors: [
                                      Color(0xFFc89650),
                                      Color(0xFFf2e294),
                                    ],
                                    begin: FractionalOffset(0.0, 0.0),
                                    end: FractionalOffset(0.5, 0.0),
                                    stops: [0.0, 1.0],
                                    tileMode: TileMode.clamp),
                              ),
                              child: MaterialButton(
                                onPressed: _submitCommand,

                                // onPressed: () {
                                //   // Navigator.push(
                                //   //     context,
                                //   //     MaterialPageRoute(
                                //   //         builder: (context) => AddProjectForm()));
                                // },
                                child: Text(
                                  UserConstants.Button_Save,
                                  style: TextStyle(
                                    fontFamily: Constants.SansProMedium,
                                    color: Color(0xff000000),
                                    fontSize: 16,
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ]),
            ),
          ));
    });
  }

  Widget expanRole() {
    return FutureBuilder<AlbumData>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print("${snapshot.data!.getRoleListResponses![1].stRoleName} 123123");
          return ExpansionTile(
            title: Text("dataSet"),
            children: [
              for (int i = 0; i <= 10; i++) ...{
                InkWell(
                  onTap: () {
                    setState(() {
                      dataSet =
                          snapshot.data!.getRoleListResponses![i].stRoleName!;
                    });
                  },
                  child: ListTile(
                      title: Text(
                          "${snapshot.data!.getRoleListResponses![i].stRoleName}")),
                ),
              }
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
