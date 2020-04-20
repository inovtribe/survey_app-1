import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:async';
import 'package:surveyapp/models/covid.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{
  static DatabaseHelper _databaseHelper; //Singleton DatabaseHelper Instance
  static Database _database;

  String covidTable = 'himachal_covid_table';

  String col_id = 'id';
  String col_teamNo = 'teamNo';
  String col_dateOfScreening  = 'dateOfScreening';
  String col_ACFHouseNo = 'ACFHouseNo';
  String col_address = 'address';
  String col_headOfFamilyName = 'headOfFamilyName';
  String col_nameOfMemberUnderScreening = 'nameOfMemberUnderScreening';
  String col_age = 'age';
  String col_sex = 'sex';
  String col_mobileNo = 'mobileNo';
  String col_havingAnyDisease = 'havingAnyDisease';
  String col_contactWithCovidPatient = 'contactWithCovidPatient';
  String col_difficultyInBreathing = 'difficultyInBreathing';
  String col_foreignTravelHistory = 'foreignTravelHistory';
  String col_stateTravelHistory = 'stateTravelHistory';
  String col_countryName = 'countryName';
  String col_indiaArrivalDate = 'indiaArrivalDate';
  String col_stateName = 'stateName';
  String col_himachalArrivalDate = 'himachalArrivalDate';

  DatabaseHelper._createInstance(); // Named Constructor to create instance od DatabaseHelper

  factory DatabaseHelper() {
    if(_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // This is Executed only once, singleton Object
    }

    return _databaseHelper;
  }

  Future<Database> initializeDatabase() async {
    //get the directory path for Android and IOS
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'survey.db';

    //open/Create database at the given path
    var surveyDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return surveyDatabase;
  }

  Future<Database> get database async {
    if(_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

  void _createDb(Database db, int newVersion) async{
    await db.execute('CREATE TABLE $covidTable($col_id INTEGER PRIMARY KEY AUTOINCREMENT, $col_teamNo TEXT, $col_dateOfScreening TEXT, $col_ACFHouseNo TEXT, $col_address TEXT, $col_headOfFamilyName TEXT, $col_nameOfMemberUnderScreening TEXT, $col_age INTEGER, $col_sex TEXT, $col_mobileNo TEXT, $col_havingAnyDisease TEXT, $col_contactWithCovidPatient TEXT, $col_difficultyInBreathing TEXT, $col_foreignTravelHistory TEXT, $col_stateTravelHistory TEXT, $col_countryName TEXT, $col_indiaArrivalDate TEXT, $col_stateName TEXT, $col_himachalArrivalDate TEXT)');
  }

  Future<List<Map<String, dynamic>>> getCovidMapList() async {
    Database db = await this.database;
    var result = await db.query(covidTable);
    return result;
  }

  Future<int> insertCovidInformation(Covid covid) async {
    Database db = await this.database;
    var result = await db.insert(covidTable, covid.toMap());
    return result;
  }
  
  Future<int> updateCovidInformation(Covid covid) async {
    Database db = await this.database;
    var result = await db.update(covidTable, covid.toMap(), where: '$col_id = ?', whereArgs: [covid.id]);
    return result;
  }

  Future<int> deleteCovidInformation(Covid covid) async {
    Database db = await this.database;
    var result = await db.delete(covidTable, where: '$col_id = ?', whereArgs: [covid.id]);
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) FROM $covidTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<Covid>> getCovidFormList() async {
    var covidMapList = await getCovidMapList();
    int count = covidMapList.length;

    List<Covid> covidList = List<Covid>();

    for(int i=0; i < count; i++){
      covidList.add(Covid.fromMapObject(covidMapList[i]));
    }
    return covidList;
  }

  
  
}