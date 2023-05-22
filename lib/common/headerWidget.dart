import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key,this.title, this.leading,  this.action})
      : super(key: key);
  final Widget? leading;

  final String? title;
final List <Widget>? action;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          title != null ? title! : '',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        leading: leading,
      actions: action,


    );

        // IconButton(
        //     onPressed: onPressed, icon: const Icon(Icons.arrow_back_ios_new)));
  }
}
