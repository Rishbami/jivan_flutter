import 'package:flutter/material.dart';

dynamic deviceTileThumbIcon = MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
    // Thumb icon when the switch is selected.
    if (states.contains(MaterialState.selected)) {
      return const Icon(Icons.check);
    }
    return const Icon(Icons.close);
  },
);

const primaryColour = Color(0xff507b75);