import "package:flutter/material.dart";

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Task"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is to be done?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Task Here",
                    ),
                  ),
                ),
                TextButton(
                  child: Icon(Icons.mic),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 80,
            ),
            Text(
              "Due Date",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: TextField(),
                ),
                TextButton(
                  child: Icon(Icons.calendar_today_outlined),
                  onPressed: () async {
                    var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
