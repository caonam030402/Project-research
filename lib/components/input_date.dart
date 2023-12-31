import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:project_research/styles/app_colors.dart';
import 'package:project_research/styles/app_styles.dart';
import 'package:project_research/styles/app_text.dart';

class InputDate extends StatefulWidget {
  final icon;
  final label;
  const InputDate({super.key, this.icon, this.label});

  @override
  State<InputDate> createState() => _InputDateState();
}

class _InputDateState extends State<InputDate> {
  TextEditingController _date = TextEditingController();
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
              width: MediaQuery.of(context).size.width -
                  (AppStyles.PaddingBothSidesPage * 2),
              decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(14)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: SvgPicture.asset(widget.icon),
                  ),
                  Expanded(
                      child: TextField(
                    style: AppText.small,
                    readOnly: true,
                    controller: _date,
                    onTap: () async {
                      DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1960),
                          lastDate: DateTime(2040));
                      if (pickeddate != null) {
                        setState(() {
                          _date.text =
                              DateFormat('yyyy-MM-dd').format(pickeddate);
                        });
                      }
                    },
                    decoration: InputDecoration(
                        hintText: widget.label,
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
