import 'package:fitlife/backend_control/app_dataB_control.dart';
import 'package:fitlife/network_control/network_api_access.dart';
import 'package:fitlife/theme/theme_dataShip.dart';
import 'package:fitlife/widgets/listed_discover_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Text(
          "From Discovery",
          style: TextStyle(color: mainWhiteGenerator(1), fontSize: 25),
        ),
        FutureBuilder(
          future: fetchDataWithId(favoriteDescovery),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                if (favoriteDescovery.isEmpty) {
                  return Center(
                    child: Text(
                      "Favorite from Discovery is empty!",
                      style: TextStyle(
                        color: secondGreenGenerator(1),
                        fontSize: 20,
                      ),
                    ),
                  );
                }
                return SizedBox(
                  height: screenSize.height / 1.5,
                  child: ListView(
                    children: [
                      for (var exerciseObject in snapshot.data!)
                        ListedDiscoverFrame(exerciseObject: exerciseObject),
                    ],
                  ),
                );
              } else {
                return Text(
                  "Connection problem error",
                  style: TextStyle(color: Colors.red, fontSize: 25),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: mainGreenGenerator(1),
                  ),
                ),
              );
            } else {
              return Text(
                "Connection problem",
                style: TextStyle(color: Colors.red, fontSize: 25),
              );
            }
          },
        ),
      ],
    );
  }
}
