import 'package:database1/expenssinfo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static late Database database;
  late ExpenseInfo expenseInfo;

  static Future createDataBase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "Expense.db");

    database = await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
          "create table Expense(roll text primary key,expenseName text not null,amount text,date text)");
      print("create table");
    });
  }

  static Future addExpense(ExpenseInfo info) async {
    await database.rawInsert("insert or replace into Expense values(?,?,?,?)",
        [info.roll, info.expenseName, info.amount, info.date]);
    print("data inserted");
  }

  static Future<List<ExpenseInfo>> getExpense() async {
   if (database != null) {
      List<ExpenseInfo> expenseInfoList = [];
      List<Map<String, dynamic>> listExpense =
          await database.rawQuery("select * from Expense");
      for (int i = 0; i < listExpense.length; i++) {
        ExpenseInfo expenseInfo = ExpenseInfo.fromMap(listExpense[i]);
        expenseInfoList.add(expenseInfo);
      }
      return expenseInfoList;
    }
    return [];
  }
  static Future delete(String? roll)async{
   await database.rawDelete("delete from student where roll=?",[roll]);
  }
}
