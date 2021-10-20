import 'package:database1/addExpense_page.dart';
import 'package:database1/view_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text('Database'),
        bottom: TabBar(tabs: [
          Text('View'),
          Text('Expense')
        ],),
        ),
        body: TabBarView(children: [
          ViewPage(),
          AddExpensePage(),
        ],),
      ),
    );
  }
}
