import 'package:fluttershare/pages/activityfeed.dart';
import 'package:fluttershare/pages/profile.dart';
import 'package:fluttershare/pages/search.dart';
import 'package:fluttershare/pages/timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/pages/upload.dart';
import 'package:google_sign_in/google_sign_in.dart';

final googleSignIn = GoogleSignIn();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;
  PageController pageController;
  int pageIndex = 0;

  login() {
    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }

  onPageChanged(int pageindex) {
    setState(() {
      this.pageIndex = pageindex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(pageIndex,
        duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
  }

  Widget buildUnAuthPage() {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  "Flutter Share",
                  style: TextStyle(fontFamily: "Kalam", fontSize: 55),
                ),
              ),
              Material(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    login();
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 50.0),
                    height: 50,
                    width: 230,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("Assets/google sign in.png"),
                          fit: BoxFit.cover),
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

  Widget buildAuthPage() {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Timeline(),
          Search(),
          Upload(),
          ActivityFeed(),
          Profile()
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Colors.blue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.photo_camera,
            size: 34,
          )),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active)),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle)),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    // when user signed in
    googleSignIn.onCurrentUserChanged.listen((account) {
      handlingAuthState(account);
    }, onError: (err) {
      print(err);
    });

    // when app reopened
    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handlingAuthState(account);
    }).catchError((err) {
      print(err);
    });
  }

  handlingAuthState(GoogleSignInAccount account) {
    if (account != null) {
      print(account);
      setState(() {
        isAuth = true;
      });
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthPage() : buildUnAuthPage();
  }
}
