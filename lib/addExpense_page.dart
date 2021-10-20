import 'package:flutter/material.dart';

import 'dbHelper.dart';
import 'expenssinfo.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({Key? key}) : super(key: key);

  @override
  _AddExpensePageState createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  TextEditingController rollController=TextEditingController();
  TextEditingController expenseController=TextEditingController();
  TextEditingController amountController=TextEditingController();
  DbHelper dbhelper=DbHelper();
  final formkey=GlobalKey<FormState>();
  @override
  void initState(){
    init();
    super.initState();
  }
  Future init()async{
    await DbHelper.createDataBase();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: formkey,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: rollController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(

                            ),
                            labelText: "Roll Expense",
                            hintText: "RollNo Expense"
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please input Roll";
                          }
                        },


                      ),
                      TextFormField(
                        controller: expenseController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(

                            ),
                            labelText: "Name Expense",
                            hintText: "Name Expense"
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please input name";
                          }
                        },


                      ),
                      TextFormField(
                        controller: amountController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(

                            ),
                            labelText: "amount ",
                            hintText: "amount "
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "please input amount";
                          }
                        },
                      ),
                      ElevatedButton(onPressed: () {
                        addExpenseRecord();
                        if(formkey.currentState!.validate()){

                        }
                      }, child: Text("Submit"),),
                    ]
                ),
              ),
            )
        ));
  }
            Future addExpenseRecord()async{
     String roll=rollController.text;
     String expenseName =expenseController.text;
     String amount=amountController.text;
     String date=DateTime.now().toString();

     ExpenseInfo expenseInfo=ExpenseInfo(
       roll:roll,expenseName:expenseName,amount:amount,date:date
     );
     await DbHelper.addExpense(expenseInfo);
     setState((){});
     rollController.text="";
     expenseController.text="";
     amountController.text="";
            }
}
