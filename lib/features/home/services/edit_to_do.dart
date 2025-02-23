import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

showEditToDo(BuildContext context) {
  showModalBottomSheet(
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
                      'sad',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          IconsaxPlusBold.close_circle,
                          size: 28,
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  spacing: 12,
                  children: [
                    Icon(IconsaxPlusBold.calendar_2),
                    Text(
                      'Date Information',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                )
              ],
            ),
          )),
        );
      });
}
