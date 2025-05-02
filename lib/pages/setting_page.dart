import 'package:fitlife/backend_control/app_dataB_control.dart';
import 'package:fitlife/pages/welcoming/take_user_info.dart';
import 'package:fitlife/theme/theme_dataShip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  String bmiText(double bmi) {
    if (bmi < 18.5) {
      return "*Focuse on gaining weight!";
    } else if (bmi > 24.9)
      return "*Focuse on losing some weight!";
    else
      return "*Focuse on maintainig your body!";
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          width: screenSize.width - 20,
          height: screenSize.height / 3,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: secondGreenGenerator(0.7), width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Flex(
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => TakeRegistry()),
                    );
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(
                      color: mainGreenGenerator(1),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: screenSize.width / 4,
                    height: screenSize.height / 9,
                    margin: EdgeInsets.only(right: 15, bottom: 15),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: mainWhiteGenerator(1),
                        width: 1,
                      ),
                    ),
                    child: Icon(CupertinoIcons.person_2_square_stack),
                  ),
                  Flex(
                    direction: Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userProfileInfo["userName"],
                        style: TextStyle(
                          color: mainGreenGenerator(1),
                          fontSize: 25,
                          shadows: [
                            Shadow(
                              color: mainBlackGenerator(1),
                              offset: Offset(3, 5),
                              blurRadius: 5,
                            ),
                            Shadow(
                              color: mainBlackGenerator(0.7),
                              offset: Offset(2, 3),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                      ),
                      for (var item in userProfileInfo.keys.toList().getRange(
                        1,
                        4,
                      ))
                        Text(
                          "$item = ${userProfileInfo[item]}",
                          style: TextStyle(
                            color: mainWhiteGenerator(1),
                            fontSize: 16,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BMI = ${userProfileInfo["weight"] / (userProfileInfo["height"] * userProfileInfo["height"]) * 10000}"
                        .substring(0, 10),
                    style: TextStyle(
                      color: mainGreenGenerator(1),
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    bmiText(
                      userProfileInfo["weight"] /
                          (userProfileInfo["height"] ^ 2) *
                          10000,
                    ),
                    style: TextStyle(color: mainGreyGenerator(1), fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
