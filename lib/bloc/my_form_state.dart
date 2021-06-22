import 'package:equatable/equatable.dart';
import 'package:form_validate/models/validations/models.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

class MyFormState extends Equatable{
  final Email email;
  final Password password;
  final Number number;
  final FormzStatus status;


  const MyFormState({
     this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.number = const Number.pure(),
    this.status = FormzStatus.pure,
    });
   
   MyFormState copyWith({
    Email? email,
    Password? password,
    Number? number,
    FormzStatus? status,
  }) {
    return MyFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      number: number ?? this.number,
      status: status ?? this.status,
    );
  }

  @override
  // TODO: implement props
List<Object> get props => [email, password,number, status];}

class MyFormInitial extends MyFormState {}
