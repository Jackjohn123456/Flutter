import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

List<String> words = [
  "Hi Jack It Worked Successfully",
  "ok Tested",
  "Failed Error as Expected",
  "Unexpected Succcess 404",
  "The Column and Row widgets are very important widgets for building UI in the Flutter app. While you develop your app and add multiple widgets inside the Column and Row, you may find that there is no space added between the widgets. But you may want to add some space between the children to make your app design look better. So in this tutorial, we’ll see the top 4 ways to add space between widgets in Flutter with Column and Row example."
];
String display = words[Random().nextInt(words.length)], ans = '';
List<String> seperated = display.split(' ');
int correct = 0,
    wrong = 0,
    speed = 0,
    temp = 0,
    flag = 2,
    index = 0,
    si = 0,
    counter = 0,
    prevtemp = 0,
    maxlen = seperated[1].length;
double accuracy = 0;
final myController = TextEditingController();
void cleartext() {
  myController.clear();
}

//Color Scheme Function
List<InlineSpan>? selector(int flagy, String a, int i) {
  List<InlineSpan> inny = [];
  int ei = 0, k = si;
  while (display[k] != " " && k + 1 <= display.length) {
    if (k + 1 == display.length) {
      print("Ei Founded Finallly ${k} ");
      ei = k + 1;
      break;
    } else if (display[k + 1] == " ") {
      ei = k + 1;
      break;
    } else {
      k++;
    }
  }
  maxlen = ei - si;
  if (flag == 3) {
    for (int j = 0; j < a.length; j++) {
      if (j == si) {
        inny.add(TextSpan(
            text: "${a[j]}",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 25,
                fontWeight: FontWeight.bold)));
      } else {
        inny.add(TextSpan(
            text: "${a[j]}",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)));
      }
    }
    ;
    return inny;
  }
  //----------------------------------------------------------
  if (si <= i && i < ei) {
    print(si);
    print(ei);
    //Color scheme for True string
    if (flagy == 1) {
      for (int l = 0; l < a.length; l++) {
        if (l >= si && l <= ei && l <= i) {
          inny.add(TextSpan(
              text: "${a[l]}",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)));
        } else {
          inny.add(TextSpan(
              text: "${a[l]}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)));
        }
      }
      return inny;
    }
    //Color scheme for False String
    if (flagy == 0) {
      for (int l = 0; l < a.length; l++) {
        if (l >= si && l <= ei && l <= i) {
          inny.add(TextSpan(
              text: "${a[l]}",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)));
        } else {
          inny.add(TextSpan(
              text: "${a[l]}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)));
        }
      }
      return inny;
    }
    //Color scheme for next string
    if (flagy == 2 && i == 0) {
      for (int l = 0; l < a.length; l++) {
        if (l == 0)
          inny.add(TextSpan(
              text: "${a[l]}",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)));
        else
          inny.add(TextSpan(
              text: "${a[l]}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)));
      }
      return inny;
    }
    // End of Color Scheme //End of If
  }
  //------------------------------------------------------
  si = ei + 1;
}

class Sentence extends StatefulWidget {
  Sentence({super.key});
  @override
  State<Sentence> createState() => SentenceState();
}

class SentenceState extends State<Sentence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 20,
          title: Text("Word Practice"),
          backgroundColor: Color.fromARGB(255, 246, 112, 49),
        ),
        body: Column(children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Correct"),
                      Text("Wrong"),
                      Text("Accuracy"),
                      Text("Speed")
                    ]),
              ),
            ),
          ),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(correct.toString()),
                  Text(wrong.toString()),
                  Text("${accuracy.toString()}%"),
                  Text(speed.toString())
                ]),
          ),
          Expanded(
              flex: 10,
              child: Column(children: [
                Expanded(
                    child: RichText(
                        text: TextSpan(
                            children: selector(flag, display, index)))),
                Expanded(
                    child: TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(maxlen + 1)
                  ],
                  controller: myController,
                  onChanged: (values) => {
                    temp = values.length,
                    counter = values.length + prevtemp,
                    print("Counter value :${counter}"),
                    print("temp value :${temp}"),
                    if (display[counter - 1] == values[temp - 1] &&
                        display[counter - 1] != ' ')
                      {
                        setState(() => {flag = 1, index = counter - 1})
                      }
                    else if (display[counter - 1] != values[temp - 1] &&
                        display[counter - 1] != ' ')
                      {
                        setState(() => {flag = 0, index = counter - 1})
                      },
                    // if(counter-prevtemp==(eI-si)+1){
                    //   print("c-prev == ${counter-prevtemp}"),
                    //   print("si-eI===${si-eI}"),
                    //     if(values.trim()==seperated[sep_count]){
                    //       setState(() => {
                    //       correct++,
                    //       sep_count++,
                    //       accuracy = double.parse((correct / (correct + wrong) * 100).toStringAsFixed(3)),},)
                    //     }
                    //     else{
                    //       setState(() => {
                    //       wrong++,
                    //       sep_count++,
                    //       accuracy = double.parse((correct / (correct + wrong) * 100).toStringAsFixed(3)),},)
                    //     }
                    // },
                    if (counter == display.length)
                      {
                        setState(
                          () => {
                            flag = 2,
                            index = 0,
                            si = 0,
                            prevtemp = 0,
                            counter = 0,
                            cleartext(),
                            display = words[Random().nextInt(words.length)],
                            print("${counter}")
                          },
                        )
                      }
                    else if (values[temp - 1] == " " &&
                        values[temp - 1] == display[counter - 1])
                      {
                        setState(() => {
                              if (counter < display.length)
                                {
                                  si = counter,
                                  flag = 3,
                                  cleartext(),
                                  prevtemp = prevtemp + values.length,
                                  print("prevtemp ${prevtemp}")
                                }
                            })
                      },
                  },
                ))
              ]))
        ]));
  }
}
