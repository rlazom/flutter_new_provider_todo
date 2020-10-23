import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/todo.dart';

class TodoListItemToggleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build Toggle Item Button');

    return Consumer<Todo>(
      builder: (context, todo, child) {
        print('rebuilding Consumer Todo List Item Toggle Item Button');

        return new RaisedButton(
          shape: CircleBorder(),
          onPressed: (){
            todo.toggle();
          },
          color: todo.done ? Colors.green : Colors.red,
          child: new Icon(Icons.power_settings_new, color: Colors.white70,),
        );
      },
    );
  }
}
