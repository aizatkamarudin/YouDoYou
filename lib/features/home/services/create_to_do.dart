import 'package:adoptive_calendar/adoptive_calendar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:todo/constants/color.dart';
import 'package:todo/features/home/services/create_item.dart';

Future showCreateToDo(BuildContext context, todo) async {
  final title = TextEditingController();
  final notes = TextEditingController();
  DateTime? pickedDate;

  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (builder) {
        return Container(
          width: double.infinity,
          color: Colors.transparent, //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New To Do',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    IconButton(
                        onPressed: () => Navigator.pop(context, false),
                        icon: Icon(
                          IconsaxPlusBold.close_circle,
                          size: 28,
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Title',
                  style: TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    controller: title,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      filled: true,
                      fillColor: grey,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0 * 1.5, vertical: 16.0),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                    onSaved: (phone) {
                      // Save it
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Due Date',
                  style: TextStyle(fontSize: 16),
                ),
                AdoptiveCalendar(
                  disablePastDates: true,
                  datePickerOnly: true,
                  initialDate: DateTime.now(),
                  onSelection: (value) {
                    pickedDate = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Notes',
                  style: TextStyle(fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SizedBox(
                    height: 100,
                    child: TextField(
                      controller: notes,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Notes',
                        fillColor: grey,
                        filled: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(orange),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ))),
                    onPressed: () {
                      createItem({'title': title.text, 'description': notes.text, 'isDone': false, 'date': DateTime.now(), 'dateEnd': pickedDate}, todo);
                      Navigator.pop(context, true);
                    },
                    child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Center(
                            child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        )))),
              ],
            ),
          )),
        );
      }).whenComplete(() => false);
}
