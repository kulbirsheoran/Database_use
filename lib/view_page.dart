import 'package:database1/dbHelper.dart';
import 'package:database1/expenssinfo.dart';
import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  List<ExpenseInfo> expenseInfoList=[];
  @override
  void initState() {
    init();
    super.initState();

  }
  Future init()async{
    expenseInfoList = await DbHelper.getExpense();
    setState(() {

    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.cyanAccent,
        child: Expanded(
          child: ListView.builder(
              itemCount: expenseInfoList.length,
          shrinkWrap: true,
            itemBuilder: (context,index){
            ExpenseInfo expenseInfo = expenseInfoList[index];
            return GestureDetector(
              onLongPress: (){
                setState(() {
                  expenseInfoList.indexOf(expenseInfoList[index]);
                  expenseInfoList.removeAt(index);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2,color: Colors.black),
                  color: Colors.green[200],
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Roll:${expenseInfo.roll}"),
                     SizedBox(height: 8,),
                    Text("Name:${expenseInfo.expenseName}"),
                    SizedBox(height: 8,),
                    Text("Amount${expenseInfo.amount}"),
                    SizedBox(height: 8,),
                    Text("Date${expenseInfo.date}"),
                  ],
                ),
              ),
            );
            }
          ),
        ),
      ),
    );
  }
}
