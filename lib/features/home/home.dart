import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:todo/constants/color.dart';
import 'package:todo/features/home/services/create_to_do.dart';
import 'package:todo/features/home/services/edit_to_do.dart';
import 'package:todo/features/home/widgets/card_to_do.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  List<Map<String, dynamic>> todoList = [];
  final todo = Hive.box('todo');

  void refreshItem() {
    final data = todo.keys.map(
      (key) {
        final item = todo.get(key);
        return ({
          'key': key,
          'title': item['title'],
          'description': item['description'],
          'isDone': item['isDone'],
          'date': item['date'],
          'dateEnd': item['dateEnd']
        });
      },
    ).toList();
    setState(() => todoList = data.reversed.toList());
  }

  void initState() {
    refreshItem();
    super.initState();
  }

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
                  // createItem({'title': 'Title 1', 'description': 'Description 1'})
                  GestureDetector(
                    onTap: () async {
                      bool? data = await showCreateToDo(context, todo);
                      if (data!) refreshItem();
                    },
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: orange),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Icon(IconsaxPlusLinear.add),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              if (todoList.isNotEmpty)
                Flexible(
                  fit: FlexFit.loose,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 14,
                      children: [
                        ...List.generate(todoList.length, (index) {
                          return GestureDetector(
                              onTap: () async {
                                bool? data = await showEditToDo(context, todoList[index], todoList[index]['key'], todo);
                                if (data!) refreshItem();
                              },
                              child: CardToDo(
                                title: todoList[index]['title'],
                              ));
                        })
                      ],
                    ),
                  ),
                ),

              // ListView.builder(itemBuilder: (_, index) {
              //   final currentItem = todoList[index];
              //   return Card(
              //     color: Colors.black,
              //     margin: EdgeInsets.all(3),
              //     elevation: 3,
              //     child: ListTile(
              //       title: currentItem['title'],
              //     ),
              //   );
              // })
              // Column(
              //   children: [
              //     ...List.generate(todoList.length, (index) {
              //       final currentItem = todoList[index];
              //       return GestureDetector(
              //           onTap: () => showEditToDo(context),
              //           child: CardToDo(
              //             title: currentItem['title'],
              //           ));
              //     })
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
