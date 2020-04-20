import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surveyapp/fragment/home_fragment.dart';
import 'package:surveyapp/fragment/my_survey_fragment.dart';
import 'package:surveyapp/fragment/setting_fragment.dart';
import 'package:surveyapp/utils/my_navigator.dart';
import 'package:surveyapp/utils/surveyapp.dart';

class HomeScreen extends StatefulWidget {

  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Your Survey", Icons.supervisor_account),
    new DrawerItem("Settings", Icons.settings),
    new DrawerItem("Contact Us", Icons.mail),
    new DrawerItem("About Us", Icons.ac_unit),
    new DrawerItem("Share", Icons.share),
    new DrawerItem("Logout", Icons.highlight_off),
  ];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return HomeFragment();
      case 1:
        return MySurveyFragment();
      case 2:
        return SettingFragment();
      case 3:
        return HomeFragment();
      case 4:
        return HomeFragment();
      case 5:
        return HomeFragment();
      case 6:
        setState(() {
          doLogout();
        });
        break;

      default:
        return Text("Error");
    }
  }

  doLogout(){
    SharedPreferences.getInstance().then((prefs){
      setState(() {
        prefs.setBool(SurveyApp.isLogIn, false);
        MyNavigator.goToLogin(context);
      });
    });
  }


  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title, style: TextStyle(fontWeight: FontWeight.bold),),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
      if(i==2 || i==5){
        drawerOptions.add(
          Divider(color: Colors.redAccent,thickness: 1,),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.drawerItems[_selectedDrawerIndex].title == "Home" ? "Smart Survey" :  widget.drawerItems[_selectedDrawerIndex].title, style: TextStyle(fontWeight: FontWeight.bold),),),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("User Smart Survey Account"),
                accountEmail: Text("user@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: Text("S"),
                ),
              ),
              Column(
                children: drawerOptions,
              ),

            ],
          ),
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}
