import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:surveyapp/database/db_helper.dart';
import 'package:surveyapp/models/covid.dart';

class MySurveyFragment extends StatefulWidget {
  @override
  _MySurveyFragmentState createState() => _MySurveyFragmentState();
}

class _MySurveyFragmentState extends State<MySurveyFragment> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Covid> covidList;
  int count = 0;

  @override
  Widget build(BuildContext context) {

    if (covidList == null) {
      covidList = List<Covid>();
      updateListView();
    }
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: getCovidListView(),
      ),
    );
  }

  ListView getCovidListView(){
    TextStyle titleStyle = Theme.of(context).textTheme.subtitle1;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: <Widget>[
            IconSlideAction(
              icon: Icons.delete,
              color: Colors.red,
              caption: "Delete",
              onTap: (){
                _delete(context, this.covidList[position]);
              },
            )
          ],
          child: ExpansionTile(
            backgroundColor: (position % 2 == 0)?Colors.orangeAccent.withOpacity(0.9):Colors.green.withOpacity(0.9),
            title: Text(this.covidList[position].nameOfMemberUnderScreening, style: titleStyle,),
            children: <Widget>[
              Column(
                children: _buildExpandableContent(this.covidList[position],position)
              )
            ]
          ),
        );
      },
    );
  }

  _buildExpandableContent(Covid covid, int position) {

    Color color = (position % 2 == 0)?Colors.black:Colors.white;
    TextStyle textStyle = TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
    );
    List<Widget> columnContent = [];
    covid.toMap().forEach((key, value) {
      columnContent.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(child: Text(key[0].toUpperCase() + key.substring(1), style: textStyle,), flex: 2,),
            Expanded(
              child: Text((value.toString() == "null" || value.toString() == "")?"-":value.toString(),
                style: textStyle,
                textAlign: TextAlign.end,
              ),
              flex: 2,
            ),
          ],
        ),
      ));
      columnContent.add(Divider(color: color.withAlpha(50),));
    });

    return columnContent;
  }


  void updateListView() {

    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {

      Future<List<Covid>> noteListFuture = databaseHelper.getCovidFormList();
      noteListFuture.then((covidList) {
        setState(() {
          this.covidList = covidList;
          this.count = covidList.length;
        });
      });
    });
  }

  void _delete(BuildContext context, Covid covid) async {

    int result = await databaseHelper.deleteCovidInformation(covid);
    if (result != 0) {
      _showSnackBar(context, 'Patient Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {

    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

