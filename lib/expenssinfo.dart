class ExpenseInfo{
  String? roll;
  String? expenseName;
  String? amount;
  String? date;
  ExpenseInfo({required this.roll,required this.expenseName,required this.amount,required this.date});

  ExpenseInfo.fromMap(Map<String,dynamic>map){
    roll=map["roll"];
    expenseName=map["expenseName"];
    amount=map["amount"];
    date=map["date"];
  }
}