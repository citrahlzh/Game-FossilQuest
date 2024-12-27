import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SizedBox.expand(
          child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xFFD4A373),
                image: DecorationImage(
                    image: AssetImage('../../assets/images/background.png'),
                    fit: BoxFit.cover,
                    opacity: 1.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 400,
                      child: Image(
                        image: AssetImage('../../assets/images/title.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SizedBox(
                      height: 175,
                      width: 370,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xFFB15707),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                              color: Color(0xFFFFFFFF),
                              width: 5,
                              style: BorderStyle.solid),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(50),
                            child: Image(
                              image: AssetImage(
                                  '../../assets/images/play_button.png'),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        )));
  }
}
