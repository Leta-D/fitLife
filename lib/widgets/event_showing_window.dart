import 'package:fitlife/backend_control/app_state_control.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/theme_dataShip.dart';

Widget eventShowingWindow(
  BuildContext context,
  String imageUrl,
  double width,
  double height,
  List<String> texts,
) {
  final appProvider = Provider.of<AppStateControl>(context);
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10),
    decoration: BoxDecoration(
      color: mainBlackGenerator(1),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: mainGreenGenerator(0.5)),
    ),
    child: Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            imageUrl,
            width: width,
            height: height,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 200,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var text in texts)
                  Text(
                    text,
                    style: TextStyle(
                      color: mainWhiteGenerator(1),
                      fontSize: 35.0 - (texts.indexOf(text) * 10),
                    ),
                  ),
              ],
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            appProvider.change_currentBottomNavIndex(1);
            // appProvider.offset = 0;
            // appProvider.change_specifier_offset(0, value);
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(mainGreenGenerator(0.8)),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),
          ),
          child: Text("GO", style: TextStyle(color: mainBlackGenerator(1))),
        ),
      ],
    ),
  );
}
