import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/todo.dart';
import '../notifiers/todo_list.dart';
import '../widgets/todo_list_item_wdt.dart';

class TodoListWdt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('building Todo List Wdt');

    return Consumer<TodoList>(
      builder: (context, todoList, child) {
        print('rebuilding Consumer Todo List Wdt');

        if(todoList.list.isEmpty) {
          return new Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              new Icon(Icons.speaker_notes_off, size: 64,),
              new Text('Empty ToDo List')
            ],
          );
        }
        
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: todoList.list.length,
          itemBuilder: (context, index) {
            return ChangeNotifierProvider<Todo>(
                create: (context) => todoList.list[index],
                child: new TodoListItemWdt()
            );
          },
        );
      },
    );
  }
}
