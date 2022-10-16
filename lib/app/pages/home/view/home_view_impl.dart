import 'package:flutter/widgets.dart';
import 'package:wca_flutter_app/app/core/ui/helpers/loader.dart';
import 'package:wca_flutter_app/app/core/ui/helpers/messages.dart';
import 'package:wca_flutter_app/app/models/user_model.dart';
import 'package:wca_flutter_app/app/pages/home/home_page.dart';

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
    // TODO: implement logoutSuccess
  }

  @override
  void updateUser(UserModel user) {
    hideLoader();
    this.user = user;
  }
}
