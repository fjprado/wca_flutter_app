import 'package:flutter/material.dart';
import 'package:wca_flutter_app/app/core/ui/components/rounded_button.dart';
import 'package:wca_flutter_app/app/core/ui/styles/button_styles.dart';
import 'package:wca_flutter_app/app/core/ui/styles/text_styles.dart';
import 'package:wca_flutter_app/app/pages/sticker_detail/presenter/sticker_detail_presenter.dart';

import '../../core/ui/components/button.dart';
import 'view/sticker_detail_view_impl.dart';

class StickerDetailPage extends StatefulWidget {
  final StickerDetailPresenter presenter;
  const StickerDetailPage({super.key, required this.presenter});

  @override
  State<StickerDetailPage> createState() => _StickerDetailPageState();
}

class _StickerDetailPageState extends StickerDetailViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sticker Detail'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(hasSticker
                  ? 'assets/images/sticker.png'
                  : 'assets/images/sticker_pb.png'),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('$countryCode $stickerNumber',
                        style: context.textStyles.textPrimaryFontBold
                            .copyWith(fontSize: 22)),
                  ),
                  const Spacer(),
                  RoundedButton(
                      icon: Icons.remove,
                      onPressed: widget.presenter.decreaseAmount),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text('$amount',
                        style: context.textStyles.textSecondaryFontMedium),
                  ),
                  RoundedButton(
                      icon: Icons.add,
                      onPressed: widget.presenter.increaseAmount),
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(left: 15, bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(countryName,
                      style: context.textStyles.textPrimaryFontRegular)),
              Button.primary(
                onPressed: widget.presenter.saveSticker,
                label: hasSticker ? 'Update Sticker' : 'Add sticker',
                width: MediaQuery.of(context).size.width * .9,
              ),
              Button(
                onPressed: widget.presenter.deleteSticker,
                outline: true,
                style: context.buttonStyles.primaryOutlinedButton,
                labelStyle:
                    context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
                label: 'Remove sticker',
                width: MediaQuery.of(context).size.width * .9,
              )
            ],
          ),
        ),
      ),
    );
  }
}
