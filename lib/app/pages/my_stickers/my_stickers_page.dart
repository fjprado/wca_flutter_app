import 'package:flutter/material.dart';
import 'package:wca_flutter_app/app/pages/my_stickers/widgets/sticker_group.dart';

import 'widgets/sticker_group_filter.dart';
import 'widgets/sticker_status_filter.dart';

class MyStickersPage extends StatelessWidget {
  const MyStickersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Stickers'),
      ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: const [
                  StickerStatusFilter(
                    filterSelected: '',
                  ),
                  StickerGroupFilter(),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return StickerGroup();
              }, childCount: 2),
            )
          ],
        )
    );
  }
}
