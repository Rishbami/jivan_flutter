import 'package:flutter/material.dart';
import 'package:jivan/RoomPage/devices_in_room_menu.dart';
import 'rooms_addition_menu_page.dart';
import 'package:provider/provider.dart';
import 'room_model.dart';
import 'room_tile.dart';

class RoomFragment extends StatefulWidget {
  const RoomFragment({Key? key}) : super(key: key);

  @override
  State<RoomFragment> createState() => _RoomFragmentState();
}

class _RoomFragmentState extends State<RoomFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Consumer<RoomModel>(
          builder: (context, room, child) {
            return ListView.builder(
              itemCount: room.roomTaskList.length,
              itemBuilder: (context, index) {
                return RoomTile(
                  text: room.roomTaskList[index].title,
                  openMenu: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DevicesInRoomMenu(text: room.roomTaskList[index].title,)));
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff747C92),
        child: Icon(Icons.add),
        onPressed: () {
          //todo when fab is clicked, menu page opens up. This meanu page is what calls the provider
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RoomsAdditionMenu()),
          );
        },
      ),
    );
  }
}
