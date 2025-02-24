import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:todo/constants/color.dart';
import 'package:todo/features/home/services/edit_to_do.dart';
import 'package:todo/features/home/widgets/card_to_do.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
      print(todoList.length);
    }

    Future<void> createItem(Map<String, dynamic> newItem) async {
      await todo.add(newItem);
      refreshItem();
    }

    void initState() {
      super.initState();
      refreshItem();
    }

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
                  GestureDetector(
                    onTap: () => createItem({'title': 'Title 1', 'description': 'Description 1'}),
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
              CardToDo(
                title: 'sss',
              ),
              if (todoList.isNotEmpty)
                Column(
                  children: [
                    GestureDetector(
                        onTap: () => showEditToDo(context),
                        child: CardToDo(
                          title: todoList[1]['title'],
                        )),
                  ],
                )
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
