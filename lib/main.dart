import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'connector.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'widgets/course_ticker_card.dart' show CourseTicketCard;
import 'pages/detail_info.dart' show DetailScreen;

Future main() async {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController teacherRateController = TextEditingController();
  final TextEditingController teacherController = TextEditingController();
  List<Map<String, dynamic>> items = [];
  int SummaryBalance = 0;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final List<Map<String, dynamic>> loadedItems = await dbHelper.getItems();
    setState(() {
      items = loadedItems;
    });
  }

  void addItem() async {
    final Map<String, dynamic> newItem = {'name': 'New Item'};
    await dbHelper.addItem(newItem);
    _loadItems();
  }

  void removeItem(int index) async {
    final int id = items[index]['id'] as int;
    await dbHelper.removeItem(id);
    _loadItems();
  }

  void _sumPrice() async {
    final int sum = await dbHelper.sumPrice();
    setState(() {
      SummaryBalance = sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Course Pro",
          style: GoogleFonts.adventPro(
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final itemName = items[index]['name'] as String;
                final price = items[index]['price'];
                final teacherWage = items[index]['teacher_wage'];

                final priceFormatted = NumberFormat.currency(
                        locale: "ru_RU", symbol: "₸", decimalDigits: 0)
                    .format(price);
                final formattedTeacherWage = (teacherWage != null)
                    ? NumberFormat.currency(
                            locale: "ru_RU", symbol: "₸", decimalDigits: 0)
                        .format(teacherWage)
                    : NumberFormat.currency(
                            locale: "ru_RU", symbol: "₸", decimalDigits: 0)
                        .format(0);

                final studentName =
                    items[index]['student'] as String? ?? 'Not data';
                print(price);

                print(SummaryBalance);

                var listTile = ListTile(
                  title: CourseTicketCard(
                    courseName: itemName,
                    coursePrice: priceFormatted,
                    teacherWage: formattedTeacherWage,
                    studentName: studentName,
                    startDate: DateTime(2023, 12,
                        12), //TODO: Create start and end date normal view
                    endDate: DateTime(2023, 12, 20),
                    teacherName: "Kanat",
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailScreen(
                            items: itemName,
                            coursePrice: priceFormatted,
                            teacherWage: formattedTeacherWage)));
                  },
                );
                return listTile;
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.transparent,
                  height: 15.0,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Название курса',
                  ),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    labelText: 'Стоимость',
                  ),
                ),
                TextField(
                  controller: teacherRateController,
                  decoration:
                      const InputDecoration(labelText: "Ставка преподавателя"),
                ),
                TextField(
                  controller: teacherController,
                  decoration: const InputDecoration(labelText: "Преподаватель"),
                ),
                ElevatedButton(
                  onPressed: () {
                    final String name = nameController.text;
                    final int price = int.tryParse(priceController.text) ?? 0;

                    if (name.isNotEmpty && price > 0) {
                      final Map<String, dynamic> newItem = {
                        'name': name,
                        'price': price
                      };
                      dbHelper.addItem(newItem).then((_) {
                        nameController.clear();
                        priceController.clear();
                        _loadItems();
                      });
                    }
                  },
                  child: const Text('Добавить'),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class OutlinedCardExample extends StatelessWidget {
  final String items;
  final dynamic coursePrice;
  final dynamic teacherWage;
  @override
  final Key? key;

  @override
  const OutlinedCardExample({
    required this.items,
    required this.coursePrice,
    required this.teacherWage,
    this.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Card(
        color: Colors.red,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.all(Radius.circular(45)),
        ),
        child: Container(
            width: screenWidth,
            height: 200,
            child: Row(children: [
              Expanded(
                child: Container(
                    color: Colors.red,
                    child: Text(
                      "Название курса: $items\nСтоимость курса: $coursePrice\nСтавка преподавателя: $teacherWage",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )),
              )
            ])),
      ),
    );
  }
}
