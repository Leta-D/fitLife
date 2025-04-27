import 'package:flutter/cupertino.dart';
import 'package:fitlife/theme/theme_dataShip.dart';
import 'package:flutter/material.dart';

class WorkoutShowingPage extends StatelessWidget {
  const WorkoutShowingPage({
    super.key,
    required this.steps,
    required this.imgUrl,
    required this.name,
    required this.isLocal,
  });
  final String imgUrl, name;
  final bool isLocal;
  final List<dynamic> steps;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: screenSize.height,
        decoration: BoxDecoration(gradient: backgroundGradient),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: screenSize.height / 16.64),
                  Container(
                    alignment: Alignment.center,
                    width: screenSize.width / 1.3,
                    height: screenSize.width / 1.3,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 20),
                    child:
                        (isLocal)
                            ? Image.asset(imgUrl, fit: BoxFit.fill)
                            : Image.network(imgUrl, fit: BoxFit.fill),
                  ),
                  for (var step in steps)
                    Flex(
                      direction: Axis.vertical,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.circle_grid_hex_fill,
                              color: mainGreenGenerator(1),
                            ),
                            SizedBox(
                              width: screenSize.width / 1.18,
                              child: Text(
                                step,
                                softWrap: true,
                                style: TextStyle(
                                  color: mainWhiteGenerator(1),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 30,
                          width: 2,
                          margin: EdgeInsets.only(left: 12),
                          color: mainGreenGenerator(1),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: mainGreenGenerator(0.1)),
              // height: screenSize.height / 18.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.canPop(context)
                          ? Navigator.pop(context)
                          : Navigator.pushReplacementNamed(context, "mainPage");
                    },
                    icon: Icon(
                      CupertinoIcons.back,
                      color: mainWhiteGenerator(1),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    width: screenSize.width - screenSize.width / 8.23,
                    child: Text(
                      name,
                      softWrap: true,
                      style: TextStyle(
                        color: mainWhiteGenerator(1),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
