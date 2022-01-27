import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  DateTime? date = null;
  TextEditingController dateController = TextEditingController();
  List<String> options = [
    "No Repeat",
    "Once a Day",
    "Once a Day(Mon-Fri)",
    "Once a Week"
  ];
  String repetitionFrequency = "No Repeat";

  List<DropdownMenuItem<String>> dropdownItemCreator(List<String> itemValues) {
    List<DropdownMenuItem<String>> dropdownMenuItems = [];
    for (var i = 0; i < itemValues.length; i++) {
      dropdownMenuItems.add(
        DropdownMenuItem<String>(
          value: itemValues[i],
          child: Text(itemValues[i]),
        ),
      );
    }
    return dropdownMenuItems;
  }

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
            //Task details
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
                CustomIconButton(iconData: Icons.mic, onPressed: () {}),
              ],
            ),
            SizedBox(
              height: 80,
            ),

            //Date Time Input
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
                  child: TextField(
                    readOnly: true,
                    controller: dateController,
                  ),
                ),
                CustomIconButton(
                  iconData: Icons.calendar_today_outlined,
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: date == null ? DateTime.now() : date!,
                        firstDate: DateTime.now(),
                        //TODO::lastDate should be 50/100/x number of years from now
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      date = pickedDate;
                      setState(() {});
                      var dateString =
                          DateFormat('EEEE, d MMM, yyyy').format(pickedDate);
                      dateController.text = dateString;
                    }
                  },
                ),
                Visibility(
                  visible: date == null ? false : true,
                  child: CustomIconButton(
                    iconData: Icons.cancel_rounded,
                    onPressed: () {
                      date = null;
                      setState(() {});
                      dateController.text = "";
                    },
                  ),
                ),
              ],
            ),
            //Time Input
            Row(
              children: [
                Flexible(
                  child: TextField(
                    readOnly: true,
                    controller: dateController,
                  ),
                ),
                CustomIconButton(
                  iconData: Icons.calendar_today_outlined,
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: date == null ? DateTime.now() : date!,
                        firstDate: DateTime.now(),
                        //TODO::lastDate should be 50/100/x number of years from now
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      date = pickedDate;
                      setState(() {});
                      var dateString =
                          DateFormat('EEEE, d MMM, yyyy').format(pickedDate);
                      dateController.text = dateString;
                    }
                  },
                ),
                Visibility(
                  visible: date == null ? false : true,
                  child: CustomIconButton(
                    iconData: Icons.cancel_rounded,
                    onPressed: () {
                      date = null;
                      setState(() {});
                      dateController.text = "";
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Text(
              "Repeat",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            DropdownButton<String>(
              items: dropdownItemCreator(options),
              value: repetitionFrequency,
              onChanged: (String? chosenValue) {
                if (repetitionFrequency == "Other")
                  repetitionFrequency = chosenValue ?? repetitionFrequency;

                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.iconData,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final IconData iconData;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
      ),
      child: Icon(iconData),
      onPressed: onPressed,
    );
  }
}
