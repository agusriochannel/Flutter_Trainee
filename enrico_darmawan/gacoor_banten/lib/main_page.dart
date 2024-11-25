import 'package:flutter/material.dart';
import 'package:gacoor_banten/second_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
      body: Center(
          child: ElevatedButton(
        child: const Text("Go to Second page"),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const SecondPage();
          }));
        },
      )),
    );
  }
}
