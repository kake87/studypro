import 'package:flutter/material.dart';
import 'package:my_app/widgets/text_style_template.dart';

class DetailScreen extends StatelessWidget {
  final String items;
  final dynamic coursePrice;
  final dynamic teacherWage;

  const DetailScreen({
    required this.items,
    required this.coursePrice,
    required this.teacherWage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Detail info",
      )),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Курс: $items",
            style: modifiedTextStyle(fontSize: 24.0, color: Colors.blueAccent),
          ),
          const Divider(
            indent: 50.0,
            endIndent: 50.0,
            color: Colors.blueGrey,
            thickness: 0.5,
          ),
          Text(
            "Стоимость: $coursePrice",
            style: modifiedTextStyle(fontSize: 14.0, color: Colors.red),
          ),
          Text(
            "Ставка преподавателя: $teacherWage",
            style: modifiedTextStyle(fontSize: 14.0, color: Colors.red),
          ),
        ],
      )),
    );
  }
}
