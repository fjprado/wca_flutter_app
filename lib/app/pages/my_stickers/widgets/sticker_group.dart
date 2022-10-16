import 'package:flutter/material.dart';
import 'package:wca_flutter_app/app/core/ui/styles/colors_app.dart';
import 'package:wca_flutter_app/app/core/ui/styles/text_styles.dart';
import 'package:wca_flutter_app/app/models/group_stickers.dart';
import 'package:wca_flutter_app/app/models/user_sticker_model.dart';

class StickerGroup extends StatelessWidget {
  final GroupStickers group;
  final String statusFilter;
  const StickerGroup(
      {super.key, required this.group, required this.statusFilter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 64,
            child: OverflowBox(
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: ClipRect(
                child: Align(
                  alignment: const Alignment(1, -0.1),
                  widthFactor: 1,
                  heightFactor: 0.1,
                  child: Image.network(
                    group.flag,
                    cacheWidth: (MediaQuery.of(context).size.width * 3).toInt(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              group.countryName,
              style: context.textStyles.titleBlack.copyWith(fontSize: 26),
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final stickerNumber = '${group.stickersStart + index}';
              final stickerList = group.stickers
                  .where((sticker) => sticker.stickerNumber == stickerNumber);
              final sticker = stickerList.isNotEmpty ? stickerList.first : null;
              final stickerWidget = _Sticker(
                stickerNumber: stickerNumber,
                sticker: sticker,
                countryName: group.countryName,
                countryCode: group.countryCode,
              );
              
              switch (statusFilter) {
                case 'all':
                  return stickerWidget;
                case 'missing':
                  if (sticker == null) {
                    return stickerWidget;
                  }
                  break;
                case 'repeated':
                  if (sticker != null && sticker.duplicate > 0) {
                    return stickerWidget;
                  }
                  break;
              }
              return const SizedBox.shrink();              
            },
          ),
        ],
      ),
    );
  }
}

class _Sticker extends StatelessWidget {
  final String stickerNumber;
  final UserStickerModel? sticker;
  final String countryName;
  final String countryCode;

  const _Sticker({
    super.key,
    required this.stickerNumber,
    required this.sticker,
    required this.countryName,
    required this.countryCode,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: sticker != null ? context.colors.primary : context.colors.grey,
        child: Column(children: [
          Visibility(
            visible: (sticker?.duplicate ?? 0) > 0,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(2),
              child: Text(
                '${sticker?.duplicate ?? ''}',
                style: context.textStyles.textSecondaryFontMedium
                    .copyWith(color: context.colors.yellow),
              ),
            ),
          ),
          Text(
            countryCode,
            style: context.textStyles.textSecondaryFontExtraBold
                .copyWith(color: sticker != null ? Colors.white : Colors.black),
          ),
          Text(
            stickerNumber,
            style: context.textStyles.textSecondaryFontExtraBold
                .copyWith(color: sticker != null ? Colors.white : Colors.black),
          ),
        ]),
      ),
    );
  }
}