import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'bloc.dart';

@immutable
abstract class MyFormEvent extends Equatable {
  const MyFormEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends MyFormEvent {
  const EmailChanged({required this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class EmailUnfocused extends MyFormEvent {}

class PasswordChanged extends MyFormEvent {
  const PasswordChanged({required this.password});

  final String password;

  @override
  List<Object> get props => [password];
}

class PasswordUnfocused extends MyFormEvent {}

class NumberChanged extends MyFormEvent {
  const NumberChanged({required this.number});

  final String number;

  @override
  List<Object> get props => [number];
}

class NumberUnfocused extends MyFormEvent {}

class FormSubmitted extends MyFormEvent {}
