import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navoiy_uy_joy/view/home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SplashScreen> {
  @override
  void initState() {
    nextPage();
    super.initState();
  }
  Future<void> nextPage()async{
    Future.delayed(const Duration(seconds: 2)).
    then((value) =>  Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context)=>const HomePage(),),(Route<dynamic> route) => false));

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      body:Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: FlutterLogo(size: 70,),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 70.0),
              child: CircularProgressIndicator(),
            ),
          )
        ],
      ),
    );
  }
}
