import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isAuth=false;

  Widget buildUnAuthPage(){
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text("Flutter Share",style: TextStyle(fontSize: 44),),
              ),
              Material(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                onTap: (){
                  print("clicked");
                },
                  child: Container(
                    margin: EdgeInsets.only(top:50.0),
                    height: 50,
                    width: 230,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("Assets/google sign in.png"),
                        fit: BoxFit.cover
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAuthPage(){
    return Container(child: Text("Auth Page"),);
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthPage() : buildUnAuthPage();
  }
}
