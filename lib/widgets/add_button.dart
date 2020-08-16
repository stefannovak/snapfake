import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final Function onTap;

  AddButton({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 4.0,
        width: 4.0,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(2.0),
          ),
        ),
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
