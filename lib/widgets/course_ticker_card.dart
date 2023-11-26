import 'package:flutter/material.dart';

class CourseTicketCard extends StatelessWidget {
  final String courseName;
  final dynamic coursePrice;
  final String studentName;
  final String teacherName;
  final DateTime startDate;
  final DateTime endDate;
  final dynamic teacherWage;

  const CourseTicketCard({
    required this.courseName,
    required this.coursePrice,
    required this.studentName,
    required this.teacherName,
    required this.startDate,
    required this.endDate,
    required this.teacherWage,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.white, // Замените на ваш цвет
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Colors.white, // Замените на ваш цвет
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.00, 0.00),

                          // Course name from DB
                          child: Text(
                            "$courseName",
                            textScaleFactor: 1.5,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 0.3,
                        color: Colors.blue,
                        indent: 20.0,
                        endIndent: 20.0,
                      ),
                      const Text(
                        'Название курса',
                        style: TextStyle(
                          color: Colors.black54, // Замените на ваш цвет текста
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalDivider(
                  thickness: 0.5,
                  color: Color(0xCC414141),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Ученик',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    'Преподаватель',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    'Стоимость',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Казиев Канат',
                                    style: TextStyle(
                                      color: Colors
                                          .blue, // Замените на ваш цвет текста
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    '$studentName',
                                    style: TextStyle(
                                      color: Colors
                                          .blue, // Замените на ваш цвет текста
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "$coursePrice",
                                    style: TextStyle(
                                      color: Colors
                                          .red, // Замените на ваш цвет текста
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.3,
                          color: Color(0xCC414141),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Начало',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xCC000000),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Окончание',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '$startDate',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Text(
                                      '$endDate',
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
