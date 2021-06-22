import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:formz/formz.dart';
import 'package:form_validate/models/validations/models.dart';
import 'bloc.dart';



class MyFormBloc extends Bloc<MyFormEvent, MyFormState> {
  MyFormBloc() : super(MyFormInitial());

  @override
  void onTransition(Transition<MyFormEvent, MyFormState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<MyFormState> mapEventToState(
    MyFormEvent event,
  ) async* {
    // TODO: implement mapEventToState
     if (event is EmailChanged) {
      final email = Email.dirty(event.email);
      yield state.copyWith(
        email: email.valid ? email : Email.pure(event.email),
        status: Formz.validate([email, state.password, state.number]),
      );
    } else if (event is PasswordChanged) {
      final password = Password.dirty(event.password);
      yield state.copyWith(
        password: password.valid ? password : Password.pure(event.password),
        status: Formz.validate([state.email, password, state.number]),
      );
    }
    else if (event is NumberChanged) {
      final number = Number.dirty(event.number);
      yield state.copyWith(
        number: number.valid ? number : Number.pure(event.number),
        status: Formz.validate([state.email, state.password, number]),
      );
    }
     else if (event is EmailUnfocused) {
      final email = Email.dirty(state.email.value);
      yield state.copyWith(
        email: email,
        status: Formz.validate([email, state.password, state.number]),
      );
    } else if (event is PasswordUnfocused) {
      final password = Password.dirty(state.password.value);
      yield state.copyWith(
        password: password,
        status: Formz.validate([state.email, password, state.number]),
      );
    }
    else if (event is NumberUnfocused) {
      final number = Number.dirty(state.number.value);
      yield state.copyWith(
        number: number,
        status: Formz.validate([state.email, state.password, number]),
      );
    }
     else if (event is FormSubmitted) {
      final email = Email.dirty(state.email.value);
      final password = Password.dirty(state.password.value);
      final number = Number.dirty(state.number.value);
      yield state.copyWith(
        email: email,
        password: password,
        number: number,
        status: Formz.validate([email, password, number]),
      );
      if (state.status.isValidated) {
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        await Future<void>.delayed(const Duration(seconds: 1));
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      }
    }
  }
}
