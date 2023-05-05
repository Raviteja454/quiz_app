import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/resultpage.dart';
class getjson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assest/ques.json",cache: false),
        builder: (context,snapshot){
        List mydata=json.decode(snapshot.data.toString());
        if(mydata == null){
          return const Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        }
        else{
          return quizpage(mydata : mydata);
        }        },
    );  } }

class quizpage extends StatefulWidget {
  var mydata;
   quizpage({Key? key,required this.mydata}) : super(key: key);
  @override
  State<quizpage> createState() => _quizpageState(mydata);
}
class _quizpageState extends State<quizpage> {
  var mydata;
  _quizpageState(this.mydata);
  Color forshowing = Colors.blue;
  Color correct = Colors.green;
  Color wrong = Colors.red;
  int marks =0;
  int i=1;
  int timer=20;
  String showtimer ="20";
  Map<String,Color>btnColor ={
    "a":Colors.indigo,
    "b":Colors.indigo,
    "c":Colors.indigo,
    "d":Colors.indigo,
};
  bool canceltimer=false;
  @override
  void initState()
  {
    starttimer();
    super.initState();
  }
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    } }
void starttimer() async{
    const onesec =Duration(seconds:1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if(timer<1){
          t.cancel();
          nextques();
        }
        else if(canceltimer==true){
          t.cancel();
        }
        else{
          timer=timer-1;
        }
        showtimer=timer.toString();
      });
    });}
  void nextques() {
    canceltimer=false;
    timer=20;
    setState(() {
      if (i < 10) {
        i++;
      }
      else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => resultpage(marks : marks),
        ));}
      btnColor["a"]=Colors.indigo;
      btnColor["b"]=Colors.indigo;
      btnColor["c"]=Colors.indigo;
      btnColor["d"]=Colors.indigo;
      starttimer();
    });}
  void answercheck(String s) {
    if(mydata[2][i.toString()]==mydata[1][i.toString()][s]){
      marks=marks+5;
      forshowing =correct;
    }
    else{
      forshowing=wrong;
    }
    setState(() {
      btnColor[s]=forshowing;
      canceltimer=true;
    });
    Timer(Duration(seconds: 1),nextques);
  }
  Widget choicebutton(String s){
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 30.0,
        ),
      child: MaterialButton(
        onPressed:() => answercheck(s),
        child: Text(
          mydata[1][i.toString()][s],
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
      ),
        color: btnColor[s],
        highlightColor: Colors.white,
        minWidth: 200.0,
        height: 80.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,DeviceOrientation.portraitDown
      ]);
        return Scaffold(
          backgroundColor: Colors.orangeAccent,
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    mydata[0][i.toString()],
                    style: TextStyle(
                      fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[900],
                        letterSpacing: 2.5,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red[300],
                  ),),),
              Expanded(
                flex: 6,
                  child:Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        choicebutton('a'),
                        choicebutton('b'),
                        choicebutton('c'),
                        choicebutton('d'),
                      ],) ,),),
              Expanded(
                flex: 1,

                child: Container(
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 6,
                          child:Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 40

                            ),
                            child: Text(
                              "Timer",
                              style: TextStyle(
                                fontSize: 60
                              ),
                            ),

                          )),
                      Expanded(
                          flex:4,
                          child: Text(
                        showtimer,
                            style: TextStyle(
                              fontSize: 60,
                            ),
                      ))


                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.teal[400],
                  ),
                  ),),],),);
  }}
