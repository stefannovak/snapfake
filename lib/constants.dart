import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kTitleStyle = TextStyle(
  fontSize: 46.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  letterSpacing: 2.0,
);

const kMessageTextFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    hintText: 'Send a Chat',
    border: OutlineInputBorder(
      borderSide: BorderSide(width: 0, style: BorderStyle.none),
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    filled: true);
