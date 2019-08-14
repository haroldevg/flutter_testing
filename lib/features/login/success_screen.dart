import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
            child: Text("SUCCESS!!",style: TextStyle(
              color: Colors.white,
              fontSize: 40
            ),key: Key("success_message"),),
        ),
            Positioned(
              bottom: 0,
              child: Image.asset("assets/images/success_icon.png"),
            ),
            Positioned(
              top: 0,
              child: Image.asset("assets/images/confite.png",fit: BoxFit.fill,width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,),
            ),

          ],
        ),
      ),
    );
  }
}
