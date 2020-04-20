import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:surveyapp/fragment/template/feedback_tempate.dart';

class TemplateScreen extends StatefulWidget {
  
  final tabItems = [
    new TabItem("Feedback"),
    new TabItem("Education"),
    new TabItem("Health"),
    new TabItem("NPS"),
  ];
  
  @override
  _TemplateScreenState createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> 
  with SingleTickerProviderStateMixin{
  
  TabController _tabController;
  TabPageSelector _pageSelector;

  @override
  void initState() {
    _tabController = new TabController(length: widget.tabItems.length, vsync: this);
    _pageSelector = new TabPageSelector(controller: _tabController);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    var tabOptions = <Tab>[];

    for(var i = 0; i < widget.tabItems.length; i++){
      var tab = widget.tabItems[i];
      tabOptions.add(
        Tab(text: tab.title,)
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Templates", style: TextStyle(fontWeight: FontWeight.bold),),
        bottom: TabBar(
          labelColor: Colors.red,
          unselectedLabelColor: Colors.white,
          indicatorColor: Colors.yellow,
          indicatorWeight: 4,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: Colors.white
          ),

          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Caviar_Dreams_Bold'),
          isScrollable: true,
          controller: _tabController,
          tabs: tabOptions,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabOptions.map((e){
          return FeedBackTemplates(templateName: e.text);
        }).toList()
      ),
    );
  }
}

class TabItem {
  String title;
  TabItem(this.title);
}
