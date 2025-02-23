import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:todo/constants/color.dart';
import 'package:todo/features/home/services/edit_to_do.dart';
import 'package:todo/features/home/widgets/card_to_do.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Need To Do',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                  //IconButton(onPressed: () => print('test'), icon: Icon(IconsaxPlusLinear.add))
                  Row(
                    spacing: 16,
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: orange),
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Icon(IconsaxPlusLinear.add),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  GestureDetector(onTap: () => showEditToDo(context), child: CardToDo()),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
