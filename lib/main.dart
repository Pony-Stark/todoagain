import 'package:flutter/material.dart';
import 'package:todoagain/screens/new_task_screen.dart';
import 'screens/routing.dart' as routing;
import "screens/home_screen.dart";
import 'sqlite.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SqliteDB.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: routing.homeScreenID,
      routes: {
        routing.newTaskScreenID: (context) => const NewTaskScreen(),
        routing.homeScreenID: (context) => const MyHomePage(),
      },
    );
  }
}
