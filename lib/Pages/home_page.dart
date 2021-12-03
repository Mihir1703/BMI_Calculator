import 'package:body_mass_index/brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/icons_content.dart';
import '../Components/reusable_card.dart';
import '../Components/icons_add_remove.dart';
import 'result_page.dart';
import '../brain.dart';

enum Gender { male, female, none }

const Color primaryColor = Color(0xFF1D1E33);
const Color nonActiveColor = Color(0xFF111328);
const Color activeSlider = Color(0xFFEB1555);
const Color inactiveSlider = Color(0xFF8D8E98);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late Gender selected = Gender.none;
  double height = 100;
  double weight = 18;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("BMI Calculator"),
        ),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    selected == Gender.male
                        ? selected = Gender.none
                        : selected = Gender.male;
                  });
                },
                color: selected == Gender.male ? nonActiveColor : primaryColor,
                child: const IconsContent(
                  text: "Male",
                  icon: FontAwesomeIcons.mars,
                ),
              )),
              Expanded(
                  child: ReusableCard(
                onPress: () {
                  setState(() {
                    selected == Gender.female
                        ? selected = Gender.none
                        : selected = Gender.female;
                  });
                },
                color:
                    selected == Gender.female ? nonActiveColor : primaryColor,
                child: const IconsContent(
                  text: "Female",
                  icon: FontAwesomeIcons.venus,
                ),
              )),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Height",
                          style: textStyle(),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toInt().toString(),
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Text(
                              "cm",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: activeSlider,
                            activeTrackColor: Colors.white,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 10, disabledThumbRadius: 8),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            onChanged: (double d) {
                              setState(() {
                                height = d;
                              });
                            },
                            min: 40,
                            max: 220,
                            inactiveColor: inactiveSlider,
                          ),
                        )
                      ],
                    ),
                  ),
                  color: primaryColor,
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                color: primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Weight",
                      style: textStyle(),
                    ),
                    Text(
                      weight.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        remove(() {
                          setState(() {
                            weight <= 1 ? true : weight--;
                          });
                        }),
                        add(() {
                          setState(() {
                            weight >= 120 ? true : weight++;
                          });
                        })
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: ReusableCard(
                color: primaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Age",
                      style: textStyle(),
                    ),
                    Text(
                      age.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        remove(() {
                          setState(() {
                            age <= 10 ? true : age--;
                          });
                        }),
                        add(() {
                          setState(() {
                            age >= 100 ? true : age++;
                          });
                        })
                      ],
                    )
                  ],
                ),
              )),
            ],
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
                CalculateBMI ans = CalculateBMI(weight: weight, height: height);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result(
                              bmiResult: ans.getBMI(),
                              resultText: ans.getShortDescription(),
                              description: ans.getDescription(),
                            )));
              },
              child: const Center(
                child: Text(
                  "Calculate",
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
