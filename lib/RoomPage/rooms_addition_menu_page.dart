import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'room_model.dart';

class RoomsAdditionMenu extends StatefulWidget {
  const RoomsAdditionMenu({Key? key}) : super(key: key);

  @override
  State<RoomsAdditionMenu> createState() => _RoomsAdditionMenuState();
}

class _RoomsAdditionMenuState extends State<RoomsAdditionMenu> {
  String? roomTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create a new room',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter a title',
          ),
          onChanged: (value) {
            roomTitle = value;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Provider.of<RoomModel>(context, listen: false)
              .addTaskInList(title: roomTitle ?? '?',);
          Navigator.pop(context);
        },
        label: Text('Save'),
      ),
    );
  }
}
