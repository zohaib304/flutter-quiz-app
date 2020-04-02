import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function myresetHandler;
  Result(this.resultScore, this.myresetHandler);

  String get resultPhrase {
    var resultText = "You did it";
    if (resultScore <= 8) {
      resultText = "You are awesome! $resultScore";
    } else if (resultScore <= 12) {
      resultText = "You are Likeable! $resultScore";
    } else if (resultScore <= 16) {
      resultText = "You are Pretty! $resultScore";
    } else {
      resultText = "You are so Handsome! $resultScore";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text("Restart Quiz"),
            onPressed: myresetHandler,
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
