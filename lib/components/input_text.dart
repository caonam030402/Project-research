import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_research/styles/app_colors.dart';
import 'package:project_research/styles/app_styles.dart';
import 'package:project_research/styles/app_text.dart';

List<String> list = <String>['Male', 'Female', 'Other'];

class InputText extends StatelessWidget {
  final TextInputType? keyboardType;
  final icon;
  final lable;
  final TextEditingController controller;
  final bool hiddenValue;
  final bool? containerWidth;
  const InputText({
    super.key,
    required this.lable,
    required this.icon,
    this.keyboardType,
    this.hiddenValue = false,
    this.containerWidth = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              height: 48,
              width: containerWidth == false
                  ? (MediaQuery.of(context).size.width -
                      (AppStyles.PaddingBothSidesPage * 2))
                  : (MediaQuery.of(context).size.width -
                      (AppStyles.PaddingBothSidesPage * 2) -
                      58),
              decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(14)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: SvgPicture.asset(icon),
                  ),
                  Expanded(
                      child: TextField(
                    controller: controller,
                    style: AppText.small,
                    obscureText: hiddenValue,
                    keyboardType: keyboardType,
                    decoration: InputDecoration(
                        hintText: lable,
                        hintStyle: AppText.small.copyWith(
                            height: 2,
                            fontWeight: FontWeight.w400,
                            color: AppColors.gray_2),
                        border: InputBorder.none),
                  )),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
