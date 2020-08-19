//import 'dart:async';
//
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';
//import 'package:snapfake/blocs/registration/registration_event.dart';
//import 'package:snapfake/screens/home/home_screen.dart';
//
//class RegistrationBloc {
//  final _auth = FirebaseAuth.instance;
//  AuthResult _newUser;
//  String email;
//  String password;
//
//  final _registrationStateController = StreamController<String>();
//
//  StreamSink<String> get _inRegistration => _registrationStateController.sink;
//
//  Stream<String> get registration => _registrationStateController.stream;
//
//  final _registrationEventController = StreamController<RegistrationEvent>();
//
//  Sink<RegistrationEvent> get registrationEventSink =>
//      _registrationEventController.sink;
//
//  RegistrationBloc() {
//    _registrationEventController.stream.listen(_mapEventToState);
//  }
//
//  void _mapEventToState(RegistrationEvent registrationEvent) async {
//    if (registrationEvent is RegistrationEvent) {
//      try {
//        _newUser = await _auth.createUserWithEmailAndPassword(
//            email: email, password: password);
//      } catch (e) {
//        print(e);
//      }
//    } else {
//      print("Invalid event. Error.");
//    }
//
//    _inRegistration.add(_newUser);
//  }
//}
