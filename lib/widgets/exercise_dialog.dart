import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/exercises.dart';
import '../providers/filters.dart';
import '../providers/events.dart';
import '../providers/routines.dart';

import '../models/exercise.dart';

class ExerciseDialog extends StatefulWidget {
  final String id;
  final bool isInsert;
  final String targetName;
  ExerciseDialog(this.isInsert, this.targetName, {this.id});

  @override
  _ExerciseDialogState createState() => _ExerciseDialogState();
}

class _ExerciseDialogState extends State<ExerciseDialog> {
  final _formKey = GlobalKey<FormState>();
  String selectedTargetName;
  Exercises exercises;
  Exercise exercise;
  Filters filters;
  @override
  void initState() {
    // dialog인데 dispose되는지? // 그냥 sate내 변수(위)에 직접
    selectedTargetName =
        widget.targetName == '전체' ? Target.chest : widget.targetName;
    exercises = Provider.of<Exercises>(context, listen: false);
    filters = Provider.of<Filters>(context, listen: false);
    if (!widget.isInsert) {
      exercise = exercises.getExercise(widget.id);
    }
    super.initState();
  }

  void _onSave(String name) {
    if (widget.isInsert) {
      String id = exercises.addExercise(name, Target(selectedTargetName));
      filters.addFilter(id);
    } else {
      print(widget.id);
      exercises.updateExercise(
          widget.id, Exercise(widget.id, name, Target(selectedTargetName)));
    }
  }

  void _onDelete() {
    // 삭제 확인 dialog추가? 꼭있어야함. 위험하니까. // 밑에 알림바로 알림?
    final eventIds = Provider.of<Events>(context, listen: false)
        .deleteEventsOfExercise(widget.id);
    final routineIds = Provider.of<Routines>(context, listen: false)
        .deleteRoutinesOfExercise(widget.id);
    exercises.deleteExercise(widget.id, eventIds, routineIds);
    filters.deleteFilter(widget.id);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text("운동의 정보"),
      content: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('카테고리'),
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: Target.valuesExceptAll
                    .map(
                      (t) => GestureDetector(
                        // border, clip
                        child: Chip(
                          backgroundColor: selectedTargetName == t
                              ? Colors.amber
                              : Colors.grey[300],
                          label: Text(t),
                        ),
                        onTap: () {
                          setState(() {
                            selectedTargetName = t;
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
            TextFormField(
              initialValue: widget.isInsert ? null : exercise.name,
              decoration: const InputDecoration(
                hintText: '이름을 입력하세요',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return '이름이 입력되지 않았습니다.';
                }
                return null;
              },
              onSaved: _onSave,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('저장'),
                  ),
                  if (!widget.isInsert)
                    ElevatedButton(
                      onPressed: _onDelete,
                      child: Text('삭제'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}