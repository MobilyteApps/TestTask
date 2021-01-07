import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:test_task/VerifySubscriptionRes.dart';
import 'verify_subscription_response_withtoken.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///todo Hit API here for verify subscription_id and jw_token
    _makeFirstPostRequest(context);
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //todo hit First API
    //
    _makeFirstPostRequest(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.white),
      child: Center(
        ///todo slash screen text
        child: Text("Splash Screen",style: TextStyle(
          color: Colors.black,fontSize: 20,
        ),),
      ),
    );
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///UI part
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
          child: Text("Welcome to Home Page",
              style: TextStyle(color: Colors.white, fontSize: 30))),
    );
  }
}
///calls the first api
_makeFirstPostRequest(ctx) async {
  /// set up POST request arguments
  String url =
      'https://staging1.store.cyberlobe.com/mobile_api/verify_user_token_and_subscription/';
  Map<String, String> param = {
    "subscription_id": "124",
    "jwt_token":
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvc3RvcmUuY3liZXJsb2JlLmNvbSIsImlhdCI6MTYwOTgyMjk5MSwibmJmIjoxNjA5ODIyOTkxLCJleHAiOjE2MTA0Mjc3OTEsImRhdGEiOnsidXNlciI6eyJpZCI6IjczIn19fQ.Kk3swkswzY7W-XQHWeh5S5HJ96Rw3neuV3yn8pGvpZI1"
  };
  /// make POST request
  Response response = await post(
    url,
    body: param,
  );
  /// check the status code for the result
  var json = jsonDecode(response.body);
  var model = VerifySubscriptionWithToken.fromJson(json);
  if (model.status) {
    //todo hit  second API
    _makeSecondPostRequest(ctx);
  } else {
    /// show error message
  }
}
/// calls the second api
_makeSecondPostRequest(BuildContext ctx) async {
  String url = 'https://staging1.store.cyberlobe.com/mobile_api/verify_user_token_and_subscription/';
  /// next api call
  Map<String, String> _postProperties = {"subscription_id": "124"};
  Response _response = await post(url, body: _postProperties);
  var json = jsonDecode(_response.body);
  var _modelClass = VerifySubscriptionRes.fromJson(json);
  if (_modelClass.status) {
    ///todo go to home screen
    /// todo splash screen..
    /// for 5 second then goto home screen...
    Timer(Duration(seconds: 5),
            () => Navigator.pushReplacement(
            ctx, MaterialPageRoute(builder: (context) => HomeScreen())));
    // Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (context) => HomeScreen()));
  } else {
    /// show error message here
    Fluttertoast.showToast(
        msg: "There is no Some issue with api hit",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}