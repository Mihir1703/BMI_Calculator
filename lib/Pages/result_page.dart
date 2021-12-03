import 'package:body_mass_index/Components/icons_content.dart';
import 'package:body_mass_index/Components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:flutter_svg/svg.dart';

class Result extends StatelessWidget {
  Result({required this.bmiResult,required this.resultText,required this.description});
  final String bmiResult;
  final String resultText;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
              child: Text(
            "Your Results",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
          )),
          Expanded(flex: 3, child: SvgPicture.asset('images/health.svg')),
          Expanded(
              flex: 4,
              child: ReusableCard(
                color: primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: TextStyle(fontSize: 25, color: const Color(0xFF24D876)),
                    ),
                    Text(
                      bmiResult,
                      style: const TextStyle(
                        fontSize: 45,
                      ),
                    ),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              )),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFCC0E0E),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            height: 60,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Center(
                child: Text(
                  "Calculate Again",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
