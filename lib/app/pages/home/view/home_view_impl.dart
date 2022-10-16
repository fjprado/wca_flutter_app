import 'package:flutter/widgets.dart';

import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../models/user_model.dart';
import '../home_page.dart';
import './home_view.dart';

abstract class HomeViewImpl extends State<HomePage>
    with Messages<HomePage>, Loader<HomePage>
    implements HomeView {
  UserModel? user;

  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.presenter.getUserData();
    });
    super.initState();
  }

  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void logoutSuccess() {
    hideLoader();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/auth/login', (route) => false);
  }

  @override
  void updateUser(UserModel user) {
    hideLoader();
    this.user = user;
  }
}
