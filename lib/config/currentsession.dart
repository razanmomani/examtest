import 'package:exam_test/view/regester/model.dart';

class CurrentSession {
  static final CurrentSession _shared = CurrentSession._private();

  factory CurrentSession() => _shared;

  CurrentSession._private();

   UserModel ?user;


}
