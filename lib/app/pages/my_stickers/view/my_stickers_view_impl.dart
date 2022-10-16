import 'package:flutter/widgets.dart';
import 'package:wca_flutter_app/app/core/ui/helpers/messages.dart';
import 'package:wca_flutter_app/app/models/group_stickers.dart';
import 'package:wca_flutter_app/app/pages/my_stickers/my_stickers_page.dart';

import '../../../core/ui/helpers/loader.dart';
import './my_stickers_view.dart';

abstract class MyStickersViewImpl extends State<MyStickersPage>
    with Messages<MyStickersPage>, Loader<MyStickersPage>
    implements MyStickersView {
  var album = <GroupStickers>[];
  var statusFilter = 'all';
  var countries = <String, String>{};

  @override
  void initState() {
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showLoader();
      widget.presenter.getMyAlbum();
    });
    super.initState();
  }

  @override
  void error(String message) => showError(message);

  @override
  void loadedPage(List<GroupStickers> album) {
    hideLoader();
    setState(() {
      this.album = album;
      countries = {
        for (var c in album) c.countryCode: c.countryName,
      };
    });
  }

  @override
  void updateStatusFilter(status) {
    setState(() {
      statusFilter = status;
    });
  }

  @override
  void updateAlbum(List<GroupStickers> album) {
    hideLoader();
    setState(() {
      this.album = album;
    });
  }
}
