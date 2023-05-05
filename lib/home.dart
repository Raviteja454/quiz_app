import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/quizpage.dart';
// ignore: camel_case_types
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);
  @override
  State<homepage> createState() => _homepageState();
}
// ignore: camel_case_types
class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,DeviceOrientation.portraitUp
        ]);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "images/home.png"
                ),
              fit: BoxFit.cover,
            ),
        ),
        child:Center(
            child: InkWell(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context)=>getjson(),
                ));},
              child: Material(
                color: Colors.purple,
                elevation: 10.0,
                borderRadius: BorderRadius.circular(150.0),
                child: Container(
                  child:Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(200.0),
                        child: Container(
                          height: 200.0,
                          width: 200.0,
                          child: const ClipOval(
                            child: Image(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                "images/start.png",
                              ),),),),),),
                ),),),),),);}
}
