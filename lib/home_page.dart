// ignore_for_file: prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_animais/pages/hello_listview.dart';
import 'package:flutter_animais/pages/hello_page1.dart';
import 'package:flutter_animais/pages/hello_page2.dart';
import 'package:flutter_animais/pages/hello_page3.dart';
import 'package:flutter_animais/utils/nav.dart';
import 'package:flutter_animais/widgets/blue-button.dart';
import 'package:flutter_animais/widgets/drawer_list.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hello Flutter",
          ),
          centerTitle: true,
          bottom: TabBar(tabs: const <Widget>[
            Tab(
              text: "TAB 1",
            ),
            Tab(
              text: "TAB 2",
            ),
          ]),
        ),
        body: TabBarView(children: [
          _body(context),
          _body(context)
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _onClickFab();
          },
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _body(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),
        ],
      ),
    );
  }

  Container _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      height: 290,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.jpg"),
          _img("assets/images/dog6.webp"),
        ],
      ),
    );
  }

  _buttons() {
    return Builder(builder: (context) {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButton("ListView",
                  () => _onClickNavigator(context, HelloListView())),
              BlueButton(
                  "Page 2", () => _onClickNavigator(context, HelloPage2())),
              BlueButton(
                  "Page 3", () => _onClickNavigator(context, HelloPage3())),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButton("Snack", () => _onClickSnack(context)),
              BlueButton("Dialog", () => _onClickDialog(context)),
              BlueButton("Toast", () => _onClickToast(context)),
            ],
          ),
        ],
      );
    });
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
  }

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("Olá Flutter"),
        action: SnackBarAction(
          textColor: Colors.yellow,
          label: "OK",
          onPressed: () {
            print("OK!");
          },
        ),
      ),
    );
  }

  _onClickDialog(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Flutter Show"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  _onClickToast(BuildContext context) {
    Fluttertoast.showToast(
        msg: "Flutter Toast",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos:5,
        //timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _img(String img) {
    return Container(
      margin: EdgeInsets.all(15),
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
      ),
    );
  }

  void _onClickFab() {
    print("Adicionar");
  }
}
