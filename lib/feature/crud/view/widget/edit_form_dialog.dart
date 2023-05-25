
import 'package:api_todo_auth/feature/crud/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/todoController.dart';


class EditFormDialog extends StatelessWidget {
  EditFormDialog({Key? key, required this.toDoModel}) : super(key: key);
  final Todo? toDoModel;
  final controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    controller.titleController.text = toDoModel!.title;
    controller.descriptionController.text = toDoModel!.description;
    final theme = Theme.of(context).textTheme;
    return AlertDialog(
      title:  Text('Edit item',
        style: theme.bodyMedium,),
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            TextField(
              controller: controller.titleController,
            ),
            SizedBox(height: 50,),
            TextField(
              controller: controller.descriptionController,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child:  Text('Save',  style: theme.headlineLarge,),
          onPressed: () async {
            Get.back();
            //add func
            print(controller.titleController.text);
            var data = Todo(
              id: toDoModel?.id,
              title: controller.titleController.text,
              description: controller.descriptionController.text,
              date: DateTime.now().toString(),
            );
            var respone = await controller.updateData(data);
            print(respone);
            controller.refreshData();
            controller.clearController();
          },
        ),
      ],
    );
  }
}
