import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("row widget with expanded"),
          Container(
            height: 100,
            color: Colors.grey,
            child: Row(//occupy full width of screen
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,//stretch to parent widget(container height)
              children: [
                Expanded(flex: 1,child: blueBox()),//expanded takes all available space
                SizedBox(height:100,child: blueBox()),
                Expanded(flex:2,child: blueBox()),
                //if two expanded - takes equal available space remains left by other elements
                //use flex property inside expanded
              ],
            ),
          ),
          SizedBox(height: 20,),
          Text("column widget"),
          Container(
            // height: 100,
            color: Colors.grey,
            child: Row(//occupy full width of screen
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.end,//stretch to parent widget(container height)
              children: [
                Flexible(fit: FlexFit.tight,flex:1,child: blueBox()),//if tight it work as expanded

                blueBox(),
              ],
            ),
          ),
          SizedBox(height: 20,),

          Text("row widget with flexible"),
          Container(
            height: 100,
            color: Colors.grey,
            child: Row(//occupy full width of screen
             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisSize: MainAxisSize.min,
            //  crossAxisAlignment: CrossAxisAlignment.end,//stretch to parent widget(container height)
              children: [
                SizedBox(width: 100,child: blueBox()),//expanded takes all available space
                Spacer(flex: 1,),
                Flexible(fit: FlexFit.tight,flex:2,child: SizedBox(height:100,child: blueBox())),
                Flexible(fit: FlexFit.tight,flex:1,child: blueBox()),
                //if two expanded - takes equal available space remains left by other elements
                //use flex property inside expanded
                //flexible- if we specify width it takes that much only..if width is not specify in row..
                //it takes available space like expanded
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget blueBox() {
    return Container(
        padding: EdgeInsets.all(10),
      width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(
              color: Colors.black,width: 3
            )),
        // child: Padding(
        //   padding: const EdgeInsets.only(top: 80.0),
        //   child: Text("padding"),
        // ),
      );
  }
}

class MyHomePage2 extends StatelessWidget {
  const MyHomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey,
          child: Column(//occupy full height of screen
            mainAxisSize: MainAxisSize.min,//it takes only required height needed
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,//stretch to parent widget(container height)
            children: [
              blueBox(),
              SizedBox(height:100,child: blueBox()),
              blueBox(),
            ],
          ),
        ),
      ),
    );
  }
//https://www.youtube.com/watch?v=nwhLY4XHXCM
  Widget blueBox() {
    return Container(
        padding: EdgeInsets.all(10),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(
              color: Colors.black,width: 3
            )),
        // child: Padding(
        //   padding: const EdgeInsets.only(top: 80.0),
        //   child: Text("padding"),
        // ),
      );
  }
}
