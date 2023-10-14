import 'package:flutter/material.dart';
import 'package:restaurant/utils/Dimensions.dart';
import 'package:restaurant/utils/colors.dart';
import 'package:restaurant/view/widget/text_app.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hidenText = true;
  double textHeight = Dimensions.screenHeight / 5.3;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? TextUtils(
              text: firstHalf,
              fontSize: Dimensions.font15,
              color: AppColors.textColor,
            )
          : Column(
              children: [
                TextUtils(
                  text:
                      hidenText ? ("$firstHalf+...") : (firstHalf + secondHalf),
                  fontSize: Dimensions.font15,
                  color: AppColors.paraColor,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hidenText = !hidenText;
                    });
                  },
                  child: Row(
                    children: [
                      hidenText
                          ? TextUtils(
                              text: "Show More",
                              fontSize: Dimensions.font15,
                              color: AppColors.mainColor,
                            )
                          : TextUtils(
                              text: "Less More",
                              fontSize: Dimensions.font15,
                              color: AppColors.mainColor,
                            ),
                      Icon(
                        hidenText
                            ? Icons.arrow_drop_down_outlined
                            : Icons.arrow_drop_up_outlined,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
