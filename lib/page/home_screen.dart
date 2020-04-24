import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surveyapp/fragment/about_us.dart';
import 'package:surveyapp/fragment/contact_us.dart';
import 'package:surveyapp/fragment/home_fragment.dart';
import 'package:surveyapp/fragment/my_survey_fragment.dart';
import 'package:surveyapp/fragment/setting_fragment.dart';
import 'package:surveyapp/fragment/privacy_fragment.dart';
import 'package:surveyapp/utils/my_navigator.dart';
import 'package:surveyapp/utils/surveyapp.dart';

class HomeScreen extends StatefulWidget {

  final drawerItems = [
    new DrawerItem("Home", Icons.home, false),
    new DrawerItem("Your Survey", Icons.supervisor_account, true),
    new DrawerItem("Settings", Icons.settings,false),
    new DrawerItem("Contact Us", Icons.mail,false),
    new DrawerItem("About Us", Icons.ac_unit,false),
    new DrawerItem("Share", Icons.share,false),
    new DrawerItem("Privacy Pocily", Icons.content_copy,false),
    new DrawerItem("Logout", Icons.highlight_off,false),
  ];

  @override
  _HomeScreenState createState() => _HomeScreenState();


}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<MySurveyFragmentState> _key = GlobalKey();
  int _selectedDrawerIndex = 0;
  final TextEditingController _filter = TextEditingController();
  String _searchText = "";
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle;


  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return HomeFragment();
      case 1:
        return MySurveyFragment(key: _key);
      case 2:
        return SettingFragment();
      case 3:
        return ContactUsFragment();
      case 4:
        return AboutUsFragment();
      case 6:
        return PrivacyPolicyFragment();
      case 7:
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

  setTextStyle(){
    return TextStyle(
      color: Colors.white
    );
  }
  void _searchPressed(String title) {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          style: setTextStyle(),
          controller: _filter,
          decoration: new InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white
              )
            ),
            prefixIcon: new Icon(Icons.search, color: Colors.white,),
            hintText: 'Search...',
            hintStyle: setTextStyle()
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text(title);
        _filter.clear();
        this._appBarTitle = null;
      }
    });
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _filter.addListener(() {
      if(_filter.text.isEmpty){
        setState(() {
          _searchText = "";
          _key.currentState.updateFilter(_searchText);
        });
      }
      else{
        setState(() {
          _searchText = _filter.text;
          _key.currentState.updateFilter(_searchText);
        });
      }
    });
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
          onTap: () => (d.title!="Share")?_onSelectItem(i):{
            Share.share("https://play.google.com/store/apps", subject: 'Share Survey App'),
            Navigator.of(context).pop()},
        )
      );
      if(i==2 || i==5){
        drawerOptions.add(
          Divider(color: Colors.redAccent,thickness: 1,),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          widget.drawerItems[_selectedDrawerIndex].searchIconVisibility?IconButton(icon: _searchIcon, onPressed: (){_searchPressed(widget.drawerItems[_selectedDrawerIndex].title);}, tooltip: "Search",):Container()
        ],
        title: _appBarTitle==null?Text(widget.drawerItems[_selectedDrawerIndex].title == "Home" ? "Smart Survey" : widget.drawerItems[_selectedDrawerIndex].title):_appBarTitle
        /*style: TextStyle(fontWeight: FontWeight.bold),*/
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [const Color(0xffFF7878),const Color(0xffFCD181)])
                ),
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
  bool searchIconVisibility;

  DrawerItem(this.title, this.icon, this.searchIconVisibility);
}
