import 'package:wca_flutter_app/app/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getMe();
}
