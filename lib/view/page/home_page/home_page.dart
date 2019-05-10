import 'package:flutter/material.dart';
import 'package:flutter_shell/localization/app_translation.dart';
import 'package:flutter_shell/tools/internet_provider.dart';
import 'package:flutter_shell/view/page/setting_page/setting_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool isInternet=InternetProvider.of(context).internet;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                return SettingPage();
              }));
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          isInternet?Container():Container(
            color: Colors.red,
            child: Center(child: Text(AppTranslations.of(context).trans("no_internet"))),
          ),
          SizedBox(height: 40.0,),
          Center(child: Text(AppTranslations.of(context).trans("hello"))),
        ],
      ),
    );
  }

}
