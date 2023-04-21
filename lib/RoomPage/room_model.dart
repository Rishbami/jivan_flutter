import 'package:flutter/cupertino.dart';
import 'room_task_model.dart';
import 'package:flutter/material.dart';

class RoomModel extends ChangeNotifier{
  List<RoomTaskModel> roomTaskList = []; // todo this list also needs to be saved with every user

  List<DropdownMenuItem> availableRooms = [];
  // todo add new text entering the function into a dropDownMenuItem then add to this list

  addTaskInList({title}){
    var newItem = DropdownMenuItem(
      child: Text(title),
      value: title,
    );
    availableRooms.add(newItem);

    RoomTaskModel roomTaskModel = RoomTaskModel(title: title);
    roomTaskList.add(roomTaskModel);

    notifyListeners();
  }
}