import 'package:flutter/material.dart';
import 'package:my_monthly_salary/model/salary_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfLiteDatabase{

  Future<Database> initializeDatabase() async {
    final path = await getDatabasesPath();
    return openDatabase(
      join(path,'salary_db'),
      version: 1,
      onCreate: (Database database, int version) async {
        await database.execute(
          '''
          CREATE TABLE salary (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            description TEXT,
            prise REAL,
            createdDate TEXT
          )'''
        );
      }
    );
  }

Future<int> insertSalary(Salary salary) async {
  int result = 0;
  final Database db = await initializeDatabase();

  result = await db.insert("salary", salary.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  return result;
}

 Future<List<Map<String,Object?>>> getAllDatas() async {
  final Database db = await initializeDatabase();
  final queryResult = await db.query("salary");

  debugPrint(queryResult.toString());
  return queryResult;
}
}