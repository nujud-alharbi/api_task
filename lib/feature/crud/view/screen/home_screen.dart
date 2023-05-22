import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common/headerWidget.dart';
import '../../../../core/routes/route.dart';
import '../../logic/controller/todoController.dart';
import '../widget/form_dailog.dart';
import '../widget/list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(FormDialog());
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
                child: IconButton(onPressed: (){
                  Get.toNamed(Routes.profileScreen);

                },icon: Icon(Icons.add_circle),),
              )]),

              Expanded(
                child: Container(

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
              ),
            ],
          // )

      ),
    );
  }
}
