import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int sum = 0;
  int dif = 0;
  int prod = 0;
  double quo = 0;
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  TextEditingController sub1Controller = TextEditingController();
  TextEditingController sub2Controller = TextEditingController();
  TextEditingController mult1Controller = TextEditingController();
  TextEditingController mult2Controller = TextEditingController();
  TextEditingController div1Controller = TextEditingController();
  TextEditingController div2Controller = TextEditingController();

  void calculateSum() {
    setState(() {
      int firstAddNum = int.tryParse(add1Controller.text) ?? 0;
      int secondAddNum = int.tryParse(add2Controller.text) ?? 0;
      sum = firstAddNum + secondAddNum;
    });
  }

  void calculateDif() {
    setState(() {
      int firstSubNum = int.tryParse(sub1Controller.text) ?? 0;
      int secondSubNum = int.tryParse(sub2Controller.text) ?? 0;
      dif = firstSubNum - secondSubNum;
    });
  }

  void calculateProd() {
    setState(() {
      int firstMultNum = int.tryParse(mult1Controller.text) ?? 0;
      int secondMultNum = int.tryParse(mult2Controller.text) ?? 0;
      prod = firstMultNum * secondMultNum;
    });
  }

  void calculateQuo() {
    setState(() {
      double firstDivNum = double.tryParse(div1Controller.text) ?? 0;
      double secondDivNum = double.tryParse(div2Controller.text) ?? 0;
      quo = firstDivNum / secondDivNum;
    });
  }
  void clearInputs() {
    setState(() {
       sum = 0;
       dif = 0;
       prod = 0;
       quo = 0;
       add1Controller.clear();
       add2Controller.clear();
       sub1Controller.clear();
       sub2Controller.clear();
       mult1Controller.clear();
       mult2Controller.clear();
       div1Controller.clear();
       div2Controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Add Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller, // Use the controller
                  decoration: InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" + "),
              Expanded(
                child: TextField(
                  controller: add2Controller, // Use the controller
                  decoration: InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              IconButton(
                icon: const Text("=", style: TextStyle(fontSize: 24)),
                onPressed: calculateSum,
              ),
              Text(' $sum'), // Display the result next to the button
            ],
          ),
          // Additional operation rows can be added here

          //Subtraction
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: sub1Controller, // Use the controller
                  decoration: InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" - "),
              Expanded(
                child: TextField(
                  controller: sub2Controller, // Use the controller
                  decoration: InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              IconButton(
                icon: const Text("=", style: TextStyle(fontSize: 24)),
                onPressed: calculateDif,
              ),
              Text(' $dif'), 
            ],
          ),

          //Multiplication
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: mult1Controller, // Use the controller
                  decoration: InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" x "),
              Expanded(
                child: TextField(
                  controller: mult2Controller, // Use the controller
                  decoration: InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              IconButton(
                icon: const Text("=", style: TextStyle(fontSize: 24)),
                onPressed: calculateProd,
              ),
              Text(' $prod'), 
            ],
          ),

          //Division
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: div1Controller, // Use the controller
                  decoration: InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" / "),
              Expanded(
                child: TextField(
                  controller: div2Controller, // Use the controller
                  decoration: InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              IconButton(
                icon: const Text("=", style: TextStyle(fontSize: 24)),
                onPressed: calculateQuo,
              ),
              Text(' $quo'), 
            ],
          ),
          TextButton(
            onPressed: clearInputs,
            child: const Text("Clear Inputs"),
          ),
        ],
      ),
    );
  }
}