import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_code/app_theme.dart';

import 'task_item.dart';

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
          Padding(
            padding: EdgeInsets.only(top: screenHight * 0.1),
            child: EasyInfiniteDateTimeLine(
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now(),
              focusDate: DateTime.now().subtract(Duration(days: 365)),
              showTimelineHeader: false,
              dayProps: EasyDayProps(
                height: 79,
                width: 58,
                dayStructure: DayStructure.dayStrDayNum,
                activeDayStyle: DayStyle(
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  dayNumStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                  dayStrStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                ),
                inactiveDayStyle: DayStyle(
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  dayNumStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.black,
                  ),
                  dayStrStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.black,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      Expanded(
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (_, index) => TaskItem(),
        ),
      ),
    ]);
  }
}
