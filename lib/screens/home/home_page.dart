import 'package:flutter/material.dart';

import 'package:recall_app/screens/home/home_animation.dart';
import 'package:recall_app/components/forward_button.dart';
import 'package:recall_app/components/trapozoid_cut_colored_image.dart';
import 'package:recall_app/utils/constants.dart';
import 'package:recall_app/utils/colors.dart';
import 'package:recall_app/screens/plate_catch/plate_catch_page.dart';

// This class is the configuration for the state.
class HomePage extends StatelessWidget {
  HomePage({@required AnimationController controller}) : homeEnterAnimation = new HomeEnterAnimation(controller);

  //final String title;
final HomeEnterAnimation homeEnterAnimation;

@override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Stack(
      children: <Widget>[
        _trapoziodView(size, textTheme),
        _buttonContainer(size, context),
      ],
    );
  }

  Widget _trapoziodView(Size size, TextTheme textTheme) {
    return Transform(
      transform: Matrix4.translationValues(
          0.0, -homeEnterAnimation.translation.value * size.height, 0.0),
      child: TrapozoidTopBar(
          child: Container(
        height: size.height * 0.7,
        color: Color(getColorHexFromStr('#E8F2F4')),
        child: Stack(
          children: <Widget>[
            _buildBackgroundImage(),
            _buildTextHeader(size, textTheme),
          ],
        ),
      )),
    );
  }

  Widget _buttonContainer(Size size, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.8),
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 100,
            ),
            Transform(
              transform: Matrix4.translationValues(
                  homeEnterAnimation.translation.value * 200, 0.0, 0.0),
              child: ForwardButton(
                onPressed: () {
                  Navigator.of(context)
                 .pushReplacement(MaterialPageRoute(builder: (context) => PlateCatchPage()));
                  //PlateCatchPage();
                  //goTOLoginListener.onGoAheadTap();
                },
                label: BUTTON_GOAHEAD,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: new AssetImage(IMAGE_WELCOME_PATH),
            fit: BoxFit.cover,
          )),
    );
  }

  Widget _buildTextHeader(Size size, TextTheme textTheme) {
    return FadeTransition(
      opacity: homeEnterAnimation.titleLabelOpacity,
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.15, left: 24, right: 24),
        child: Container(
          width: double.infinity,
          child: Text(
            TEXT_WELCOME_LABEL,
            style: textTheme.title.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                wordSpacing: 1.2,
                fontSize: 21),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
