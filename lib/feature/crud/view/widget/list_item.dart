import 'package:api_todo_auth/core/theme/app_colors.dart';
import 'package:api_todo_auth/feature/crud/logic/controller/todoController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../model/todo.dart';
import 'edit_form_dialog.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.data,
    required this.controller,
    required this.date,
  });

  final Todo? data;
  final DateTime date;
  final TodoController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GetBuilder<TodoController>(builder: (controller) {
      return Card(
        margin: EdgeInsets.only(right: 8, left: 8, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        data?.title ?? "",
                        style: theme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        data?.description ?? "",
                        style: theme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        // data!.date.toString(),
                        DateFormat.yMMMMEEEEd().format(date),
                        style: theme.headlineSmall,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                GetStorage().read("k") != data!.userId
                    ? Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.dialog(EditFormDialog(
                                toDoModel: data,
                              ));
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: blueColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await controller.deleteData('${data?.id}');
                              controller.refreshData();
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: blueColor,
                            ),
                          )
                        ],
                      )
                    : Text(""),
              ],
            ),
          ],
        ),
      );
    });
  }
}
