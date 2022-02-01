import 'package:flutter/material.dart';
import 'package:todoagain/screens/new_task_screen.dart';
import 'screens/routing.dart' as routing;
import "screens/home_screen.dart";
import 'sqlite.dart';
import "package:todoagain/task.dart";

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
      /*routes: {
        routing.newTaskScreenID: (context) => NewTaskScreen(),
        routing.homeScreenID: (context) => const MyHomePage(),
      },*/
      onGenerateRoute: (settings) {
        var pageName = settings.name;
        var args = settings.arguments;
        if (pageName == routing.newTaskScreenID) {
          if (args is Task) {
            print(args);
            return MaterialPageRoute(
                builder: (context) => NewTaskScreen(task: args));
          }
          return MaterialPageRoute(builder: (context) => NewTaskScreen());
        }
        if (pageName == routing.homeScreenID)
          return MaterialPageRoute(builder: (context) => MyHomePage());
      },
    );
  }
}
