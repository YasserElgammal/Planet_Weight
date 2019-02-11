import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int radioValue =0;
  double _finalResult =0.0;
  TextEditingController _textController = TextEditingController();

  void handleRadioValueChanged (int value){
    setState(() {
      radioValue = value;
      switch (radioValue){
        case 0: 
        _finalResult = calculateWeight(_textController.text,0.06 );
        break;
        case 1:
        _finalResult = calculateWeight(_textController.text,0.38 );
        break;
        case 2:
        _finalResult = calculateWeight(_textController.text, 0.91);
        break;
         default:
          print("Nothing selected!");
              }
            });
        
          }
          @override
          Widget build(BuildContext context) {
            return Scaffold(
              backgroundColor: Colors.amber,
              appBar: AppBar(
                  title: Text("Weight on other Planet", textAlign: TextAlign.center)),
              body: Container(
                  margin: EdgeInsets.all(8.0),
                  alignment: Alignment.topCenter,
                  child: ListView(
                    children: <Widget>[
                      Image.asset(
                        "images/105planet.png",
                        width: 150.0,
                        height: 150.0,
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            TextField(
                                controller: _textController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: "Your Weight on Earth",
                                    hintText: "In Pounds",
                                    icon: Icon(Icons.accessibility))),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                              
                                Radio<int>(
                                    activeColor: Colors.brown,
                                    value: 0,
                                    groupValue: radioValue,
                                    onChanged: handleRadioValueChanged),
                                  Text("Plutto"),
        
                                Radio<int>(
                                    activeColor: Colors.brown,
                                    value: 1,
                                    groupValue: radioValue,
                                    onChanged: handleRadioValueChanged),
                                 Text("Mars"),
                                Radio<int>(
                                    activeColor: Colors.brown,
                                    value: 2,
                                    groupValue: radioValue,
                                    onChanged: handleRadioValueChanged),
                                   Text("Venus"),
        
                              ],
                            ),
                            Text("Your weight is: $_finalResult Pounds")
                          ],
                        ),
                      ),
                    ],
                  )),
            );
          }
        
 double calculateWeight(String weight, double multiplier) {
    if(int.parse(weight).toString().isNotEmpty &&  int.parse(weight) > 0){
      return int.parse(weight) * multiplier;
    } else {
      print("Wrong!");
      return int.parse("180") * 0.38; // give a default weight! Be creative!
    }

  }
}
