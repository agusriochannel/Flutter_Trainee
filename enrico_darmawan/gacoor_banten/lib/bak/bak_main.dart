import 'package:flutter/material.dart';
import 'package:gacoor_banten/bak/application_color.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ApplicationColor>(
        create: (context) => ApplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            title: Consumer<ApplicationColor>(
              builder: (context, applicationColor, _) => Text(
                "Provider State Management - Gacoor",
                style: TextStyle(color: applicationColor.color),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  margin: const EdgeInsets.all(5),
                  width: 100,
                  height: 100,
                  color: Colors.lightBlue,
                  duration: const Duration(milliseconds: 500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(5),
                        child: const Text("AB")),
                    Switch(
                      value: true,
                      onChanged: (newValue) {},
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: const Text("LB"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
