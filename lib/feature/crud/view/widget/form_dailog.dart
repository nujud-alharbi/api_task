import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controller/todoController.dart';
import '../../model/todo.dart';

class FormDialog extends StatelessWidget {
  FormDialog({Key? key}) : super(key: key);
  final controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return AlertDialog(
      title: Text(
        'Add item',
        style: theme.bodyMedium,
      ),
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            TextField(
              controller: controller.titleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              controller: controller.descriptionController,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child:  Text(
            'Save',
            style: theme.headlineLarge,
          ),
          onPressed: () async {
            Get.back();
            //add func
            var data = Todo(
              title: controller.titleController.text,
              description: controller.descriptionController.text,
              date: DateTime.now().toString(),
            );

            await controller.postData(data);

            controller.refreshData();
            controller.clearController();
          },
        ),
      ],
    );
  }
}
