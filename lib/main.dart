import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'RobotoSlab',
      ),
      home: Scaffold(
        backgroundColor: Color(0xFFF7F6F2),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 82, left: 60, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Мои дела",
                    style: TextStyle(fontSize: 38),
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Выполнено - ",
                        style:
                            TextStyle(fontSize: 20, color: Color(0x99000000)),
                      ),
                      //TODO место для количества выполненных тасок
                      Text(
                        "5",
                        style:
                            TextStyle(fontSize: 20, color: Color(0x99000000)),
                      ),
                      new Spacer(),
                      Container(
                        //TODO место для кнопки раскрытия сделанных тасок
                        child: Icon(
                          Icons.remove_red_eye,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.only(right: 15, left: 10, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFFFFFFF),
              ),
              //
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Icon(
                        Icons.check_box_outline_blank,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Купить что-то",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      new Spacer(),
                      Icon(
                        Icons.info_outline,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
