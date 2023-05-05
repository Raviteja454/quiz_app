// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';

// ignore: must_be_immutable
class resultpage extends StatefulWidget {
  int marks;
   resultpage({Key? key,required this.marks}) : super(key: key);
   @override
  // ignore: no_logic_in_create_state
  State<resultpage> createState() => _resultpageState(marks);
}
class _resultpageState extends State<resultpage> {
  List<String> images=[
    "images/first.png",
    "images/goodjob.png",
    "images/bad.png",
  ];
  String message="";
  String image="images/first.png";
  @override
  void initState(){
    if(marks <15){
      image=images[2];
      message="You should try hard....\n"+"You scored $marks";
    }
    else if(marks <40) {
      image=images[1];
      message="You can do better....\n"+"You scored $marks";
    }
    else{
      image=images[0];
      message="You did very well....\n"+"You scored $marks";
    }
    super.initState();}

  int marks;
  _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Result",
        ),      ),
      body: Column(
        children: <Widget>[
        Expanded(
              flex:7,
              child: Material(
                color: Colors.white,
                child: Container(
                  child:Column(
                    children: <Widget>[
                      Material(
                        color: Colors.white,
                        child:Container(
                            width:400.0,
                            height: 400.0,
                            child: Image(
                              image: AssetImage(
                                image,),),),),
                      Padding(
                        padding:const EdgeInsets.symmetric(
                        vertical: 0.0,
                        horizontal: 15.0,
                        ),
                        child: Center(
                          child: Text(
                            message,
                            style: const TextStyle(
                              fontSize: 25.0,
                            ),
                          ),),)],)),),),
          Expanded(
            flex:2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlinedButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context)=> homepage(),
                            ));},
                      child: const Text(
                        "continue",
                        style: TextStyle(
                          fontSize: 45.0,
                        ),),),],),),],));}
}
