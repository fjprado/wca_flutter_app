import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wca_flutter_app/app/core/rest/custom_dio.dart';
import 'package:wca_flutter_app/app/core/ui/components/button.dart';
import 'package:wca_flutter_app/app/core/ui/styles/button_styles.dart';
import 'package:wca_flutter_app/app/core/ui/styles/colors_app.dart';
import 'package:wca_flutter_app/app/core/ui/styles/text_styles.dart';
import 'package:wca_flutter_app/app/pages/home/presenter/home_presenter.dart';
import 'package:wca_flutter_app/app/pages/home/widgets/status_tile.dart';
import 'package:wca_flutter_app/app/pages/home/widgets/sticker_percent.dart';

class HomePage extends StatelessWidget {

  final HomePresenter presenter;

  const HomePage({super.key, required this.presenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.colors.primary,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: LayoutBuilder(
          builder: (_, constrains) {
            return ConstrainedBox(
              constraints: BoxConstraints(minHeight: constrains.maxHeight),
              child: Center(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 35),
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/ball.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const StickerPercent(percent: 25),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('stickers', style: context.textStyles.titleWhite),
                    const SizedBox(
                      height: 20,
                    ),
                    StatusTile(
                        icon: Image.asset('assets/images/all_icon.png'),
                        label: 'All',
                        value: 80),
                    const SizedBox(
                      height: 20,
                    ),
                    StatusTile(
                        icon: Image.asset('assets/images/missing_icon.png'),
                        label: 'Missing',
                        value: 100),
                    const SizedBox(
                      height: 20,
                    ),
                    StatusTile(
                        icon: Image.asset('assets/images/repeated_icon.png'),
                        label: 'Repeated',
                        value: 40),
                    const SizedBox(
                      height: 20,
                    ),
                    Button(
                        onPressed: () {},
                        outline: true,
                        width: MediaQuery.of(context).size.width * .9,
                        style: context.buttonStyles.yellowOutlinedButton,
                        labelStyle: context
                            .textStyles.textSecondaryFontExtraBold
                            .copyWith(color: context.colors.yellow),
                        label: 'My stickers')
                  ],
                )),
              ),
            );
          },
        ),          
      ),
    );
  }
}
