import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_code/firebase_function.dart';
import 'package:todo_code/tabs/tasks/tasks_provider.dart';

import '../../app_theme.dart';
import '../../models/task_modle.dart';

class TaskItem extends StatelessWidget {
  TaskItem(this.task);

  TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
                FirebaseFunctions.deletTaskFromFirestore(task.id).timeout(
                  Duration(microseconds: 100),
                  onTimeout: () {
                    Provider.of<TasksProvidar>(context, listen: false)
                        .getTask();
                  },
                ).catchError((_) {
                  Fluttertoast.showToast(
                    msg: "WRONG",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 5,
                    backgroundColor: AppTheme.red,
                  );
                });
              },
              backgroundColor: AppTheme.red,
              foregroundColor: AppTheme.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: (_) {},
              backgroundColor: AppTheme.primary,
              foregroundColor: AppTheme.white,
              icon: Icons.share,
              label: 'Edit',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
                height: 62,
                width: 4,
                margin: EdgeInsetsDirectional.only(end: 12),
                color: AppTheme.primary,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppTheme.primary),
                  ),
                  SizedBox(height: 4),
                  Text(
                    task.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Spacer(),
              Container(
                height: 34,
                width: 69,
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.check,
                  color: AppTheme.white,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
