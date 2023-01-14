part of pages;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textFieldController = TextEditingController();
  // String codeDialog = '';
  String valueText = '';
  double totalBudget = 200;
  double spendings = 0;
  double money = 394.19;


  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Transfer Amount:'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Amount "),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.withOpacity(0.4),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
                  child: Text('Cancel'),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.withOpacity(0.4),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
                  child: Text('Confirm'),
                  onPressed: () {
                    setState(() {
                      // codeDialog = valueText;
                      spendings += double.parse(valueText);
                      updateMoneySpent(double.parse(valueText));
                      Navigator.pop(context);
                    });
                  },
                ),
              ],)


            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),

                  border: Border.all(
                    color: Colors.cyan.withOpacity(0),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(6))
              ),
            margin: const EdgeInsets.all(10.0),
            
            width: 1000.0,
            height: 500.0,
            alignment: Alignment.topCenter,
            child: Column(
                children: [
                  SizedBox(height: 45.0),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.cyan.withOpacity(0.4),

                          border: Border.all(
                            color: Colors.cyan.withOpacity(0),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    margin: const EdgeInsets.all(10.0),
                    width: 300.0,
                    height: 150.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image(image: AssetImage('assets/images/graph.png'),
                          height: 100,
                          width: 100,),
                        Text("Remaining Balance: MYR"+ money.toString()),
                        Text("Budget Remaining: MYR" + (totalBudget).toString()),
                        SizedBox(height:5)
                      ],
                    )
                  ),
                  SizedBox(height:5),
                  Text("Transactions"),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),

                          border: Border.all(
                              color: Colors.grey.withOpacity(0.0)
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      margin: const EdgeInsets.all(10.0),
                      width: 300.0,
                      height: 150.0,
                      child: SingleChildScrollView(
                          child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("John Smith "),
                              Text("-MYR 200")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Emma Johnson "),
                              Text("-MYR 150")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Michael Brown "),
                              Text("-MYR 100")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Sarah Davis "),
                              Text("-MYR 50")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("David Miller "),
                              Text("-MYR 25")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("James Garcia "),
                              Text("-MYR 20")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Emily Rodriguez "),
                              Text("-MYR 15")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Matthew Wilson "),
                              Text("-MYR 10")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Elizabeth Martinez "),
                              Text("-MYR 5")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Joseph Anderson "),
                              Text("-MYR 2")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Nicole Taylor "),
                              Text("-MYR 1")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Anthony Perez "),
                              Text("-MYR 0.5")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Mary White "),
                              Text("-MYR 0.2")
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Kevin Lee "),
                              Text("-MYR 0.1")
                            ],
                          ),
                            ],
                      ))
                  ),
                  SizedBox(height:10),
                  ElevatedButton(
                    child: Text('Transfer', style: TextStyle(fontSize: 10.0),),
                    onPressed: () {
                      _displayTextInputDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan.withOpacity(0.4),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
                  ),

                ]
            )

          ),
          // const Text("HomePage"),
        ],
      ),
    );
  }

  void updateMoneySpent(double spent){
      money -= spent;
      totalBudget -= spent;
      if(totalBudget <= 0){
        //ai.prompt();
      }
  }
}
