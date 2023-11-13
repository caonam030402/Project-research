import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_research/components/button.dart';
import 'package:project_research/components/tool_bar.dart';
import 'package:project_research/configs/app_icons.dart';
import 'package:project_research/styles/app_colors.dart';
import 'package:project_research/styles/app_styles.dart';
import 'package:project_research/styles/app_text.dart';

class calculationResultPage extends StatelessWidget {
  final name;
  final dateOfBirth;
  final weight;
  final height;
  const calculationResultPage(
      {super.key,
      required this.name,
      required this.dateOfBirth,
      required this.weight,
      required this.height});

  @override
  Widget build(BuildContext context) {
    Infomation result =
        calculateBMI(double.parse(weight), double.parse(height));
    return Scaffold(
      appBar: const ToolBar(title: 'Result'),
      body: Padding(
        padding: const EdgeInsets.all(AppStyles.PaddingBothSidesPage),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcom',
                      style: AppText.small.copyWith(
                          fontWeight: FontWeight.w400, color: AppColors.gray_2),
                    ),
                    Text(
                      name,
                      style: AppText.heading4.copyWith(
                          fontWeight: FontWeight.w700, color: AppColors.black),
                    )
                  ],
                ),
                SvgPicture.asset(AppIcons.ic_notification)
              ],
            ),
            SizedBox(
              height: 50,
            ),
            SvgPicture.asset(
              result.icon,
              height: 50,
              color: Color(int.parse(result.color)),
            ),
            SizedBox(
              height: 17,
            ),
            // SvgPicture.asset(AppIcons.im_happy),
            Text(
              'BMI Score',
              style: AppText.large,
            ),
            Text(
              "${result.bmi}",
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w800,
                  color: Color(int.parse(result.color))),
            ),
            Text(
              result.level,
              style: AppText.large.copyWith(
                  color: Color(int.parse(result.color)),
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(int.parse(result.color)).withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: Color(int.parse(result.color)), width: 1)),
              padding: EdgeInsets.all(15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lời khuyên:',
                      style: AppText.medium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Color(int.parse(result.color))),
                    ),
                    Text("${result.advice}")
                  ]),
            ),
            Spacer(),
            Button(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: 'Comback',
            )
          ],
        ),
      ),
    );
  }
}

calculateBMI(double weight, double height) {
  final BMI = double.parse((weight / (height * height)).toStringAsFixed(1));

  Infomation info = Infomation(0, '', '', '', '');

  if (BMI < 18.5) {
    info = new Infomation(
        BMI,
        'Gầy',
        'Bạn đang quá gầy bạn phải cần ăn nhiều hơn',
        '0xffFF0000',
        AppIcons.ic_sad);
  } else if (BMI >= 18.5 && BMI < 24.9) {
    info = new Infomation(BMI, 'Bình thường',
        'Cân nặng của bạn ở mức bình thường', '0xff00FF00', AppIcons.ic_happy);
  } else if (BMI >= 25 && BMI < 29.9) {
    info = new Infomation(
        BMI,
        'Thừa cân',
        'Bạn đang vượt quá mức bình thường, bạn cần giảm cân',
        '0xffFF9900',
        AppIcons.ic_sad);
  } else if (BMI >= 30) {
    info = new Infomation(BMI, 'Béo phì', 'Bạn cần giảm cân đột ngột',
        '0xffFF0000', AppIcons.ic_sad);
  }

  return info;
}

class Infomation {
  late double bmi;
  late String level;
  late String advice;
  late String color;
  late String icon;

  Infomation(
      double bmi, String level, String advice, String color, String icon) {
    this.bmi = bmi;
    this.level = level;
    this.advice = advice;
    this.color = color;
    this.icon = icon;
  }
}
