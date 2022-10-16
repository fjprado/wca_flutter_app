import 'package:flutter/widgets.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../register_page.dart';
import './register_view.dart';

abstract class RegisterViewImpl extends State<RegisterPage>
    with Messages<RegisterPage>, Loader<RegisterPage>
    implements RegisterView {
  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void registerError([String? message]) {
    hideLoader();
    showError(message ?? 'Error while creating account');
  }

  @override
  void registerSuccess() {
    hideLoader();
    showSuccess('Account successful created');
    Navigator.of(context).pop();
  }
}
