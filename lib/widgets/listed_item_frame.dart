import 'package:fitlife/backend_control/app_dataB_control.dart';
import 'package:fitlife/backend_control/app_state_control.dart';
import 'package:fitlife/theme/theme_dataShip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fitlife/pages/workout_showing_page.dart';
import 'package:provider/provider.dart';

class ListedItemFrame extends StatelessWidget {
  String imgUrl, name, target;
  List steps;
  ListedItemFrame(this.imgUrl, this.name, this.target, this.steps, {super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    final appProvider = Provider.of<AppStateControl>(context);
    return SingleChildScrollView(
      scrollDirection:
          (screenSize.width < 344) ? Axis.horizontal : Axis.vertical,
      child: Container(
        height: 95,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.only(left: 7, right: 7),
        decoration: BoxDecoration(
          color: mainBlackGenerator(0.6),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: mainGreenGenerator(0.5)),
        ),
        // color: mainBlackGenerator(0.7),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: screenSize.width / 4,
                  child: ClipRect(child: Image.asset(imgUrl)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          color: mainWhiteGenerator(1),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        target,
                        style: TextStyle(
                          color: mainWhiteGenerator(0.6),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                appProvider.homeFavoriteState(!appProvider.isFavorite);
                controlfavoriteHome({
                  "imgUrl": imgUrl,
                  "name": name,
                  "target": target,
                  "steps": steps,
                }, appProvider.isFavorite);
              },
              icon:
                  (appProvider.isFavorite)
                      ? Icon(CupertinoIcons.heart_fill)
                      : Icon(CupertinoIcons.heart),
              color: mainGreenGenerator(1),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (_) => WorkoutShowingPage(
                          steps: steps,
                          imgUrl: imgUrl,
                          name: name,
                          isLocal: true,
                        ),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  secondGreenGenerator(1),
                ),
              ),
              child: Icon(
                CupertinoIcons.arrow_right,
                color: mainBlackGenerator(1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
