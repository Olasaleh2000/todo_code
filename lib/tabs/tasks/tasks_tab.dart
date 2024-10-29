import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_code/app_theme.dart';

class TaskTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.sizeOf(context).height;

    return Column(children: [
      Stack(
        children: [
          Container(
            height: screenHight * 0.15,
            width: double.infinity,
            color: AppTheme.primary,
          ),
          PositionedDirectional(
              child: SafeArea(
                  child: Text(' todo list',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppTheme.white)))),
          EasyInfiniteDateTimeLine(
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now(),
            focusDate: DateTime.now(),
          )
        ],
      )
    ]);
  }
}
