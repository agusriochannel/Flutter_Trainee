import 'package:flutter/material.dart';
import 'package:gacoor_banten/constants.dart';
//import 'package:gacoor_banten/main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Gacoor Solusindo",
                  style:
                      textTextStyle.copyWith(fontSize: 30, fontWeight: bold)),
              const SizedBox(height: 11),
              Text(
                "Blablabla testtesttest ini cuma buat demo saja",
                style: secondaryTextStyle.copyWith(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 64),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Email",
                    style:
                        textTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: const TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "limahlandpalmer@gmail.com",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 17)))),
                  const SizedBox(height: 15),
                  Text(
                    "Password",
                    style:
                        textTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                  ),
                  const SizedBox(height: 10),
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: whiteColor,
                      ),
                      child: const TextField(
                          decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "limahlandpalmer@gmail.com",
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                        suffixIcon: Icon(Icons.visibility_off),
                      ))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
