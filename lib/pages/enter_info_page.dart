import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_research/components/button.dart';
import 'package:project_research/components/input_date.dart';
import 'package:project_research/components/input_text.dart';
import 'package:project_research/configs/app_icons.dart';
import 'package:project_research/pages/calculation_result_page.dart';
import 'package:project_research/styles/app_colors.dart';
import 'package:project_research/styles/app_styles.dart';
import 'package:project_research/styles/app_text.dart';

class EnterInfoPage extends StatefulWidget {
  const EnterInfoPage({super.key});

  @override
  State<EnterInfoPage> createState() => _EnterInfoPageState();
}

class _EnterInfoPageState extends State<EnterInfoPage> {
  final TextEditingController _name = new TextEditingController();
  TextEditingController _dateOfBirth = new TextEditingController();
  TextEditingController _weight = new TextEditingController();
  TextEditingController _height = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: SvgPicture.asset(AppIcons.sp_shape_3)),
                      Positioned(
                          right: 0,
                          left: 0,
                          child: SvgPicture.asset(
                              AppIcons.vt_light_weight_training))
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppStyles.PaddingBothSidesPage),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Let’s complete your profile',
                        style: AppText.heading4.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.black)),
                    Text('It will help us to know more about you!',
                        style: AppText.small.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.gray_1)),
                    SizedBox(
                      height: 25,
                    ),
                    InputText(
                        lable: 'Name',
                        icon: AppIcons.ic_two_person,
                        controller: _name),
                    SizedBox(
                      height: 17,
                    ),
                    InputDate(
                      label: 'Date of Birth',
                      icon: AppIcons.ic_calendar,
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Row(
                      children: [
                        InputText(
                          lable: 'Your Weight',
                          icon: AppIcons.ic_weight_scale,
                          keyboardType: TextInputType.number,
                          containerWidth: true,
                          controller: _weight,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: AppColors.secondaryGradiant),
                          child: Center(
                              child: Text('KG',
                                  style: AppText.small.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white,
                                  ))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Row(
                      children: [
                        InputText(
                          lable: 'Your Height',
                          icon: AppIcons.ic_swap,
                          keyboardType: TextInputType.number,
                          containerWidth: true,
                          controller: _height,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              gradient: AppColors.secondaryGradiant),
                          child: Center(
                              child: Text('CM',
                                  style: AppText.small.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.white,
                                  ))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Button(
                        text: 'Next',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => calculationResultPage(
                                        name: _name.text,
                                        height: _height.text,
                                        weight: _weight.text,
                                        dateOfBirth: _dateOfBirth.value,
                                      )));
                        }),
                    SizedBox(
                      height: AppStyles.PaddingBothSidesPage,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
