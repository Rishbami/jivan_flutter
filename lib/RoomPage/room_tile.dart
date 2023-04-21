import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoomTile extends StatefulWidget {
  final String? text;
  final Function() openMenu;

  RoomTile({
    this.text,
    required this.openMenu,
  });

  @override
  State<RoomTile> createState() => _RoomTileState();
}

class _RoomTileState extends State<RoomTile> {
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.openMenu,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 40),
        decoration: BoxDecoration(
          color: Color(0xff98CBC4),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            widget.text.toString(),
          ),
        ),
      ),
    );
  }
}
