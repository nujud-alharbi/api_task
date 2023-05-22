import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/headerWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.dialog(FormDialog());
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          HeaderWidget(
            title: "Home",
            action: [
              InkWell(
                onTap: (){},
                child: IconButton(onPressed: (){},icon: Icon(Icons.add_circle),),
              ),

              Container(
                width: Get.width * 0.95,
                height: Get.height,
                padding: const EdgeInsets.all(8),
                child: GetBuilder<TodoController>(builder: (controller) {
                  return FutureBuilder(
                      future: controller.getAllData(),
                      builder: (context, snapshot) {
                        print('snapshot.data?.length ${snapshot.data?.length}');
                        if (snapshot.hasData) {
                          if (snapshot.connectionState == ConnectionState.done &&
                              snapshot.data!.isNotEmpty) {
                            return ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                var data = snapshot.data?[index];
                                var date = DateFormat('yyyy-MM-dd hh:mm:ss')
                                    .parse(data!.date);
                                return ListItem(
                                  data: data, controller: controller, date: date,);
                              },
                            );
                          } else {
                            return const Center(
                              child: Text("THERE IS NO ITEMS"),
                            );
                          }
                        } else {
                          return const Center(
                            child: Text("THERE IS NO ITEMS"),
                          );
                        }
                      });
                }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
