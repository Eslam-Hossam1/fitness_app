import 'package:flutter/material.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ShowToast {
  const ShowToast._();

  static void showToastErrorTop({
    required BuildContext context,
    required String message,
    int? seconds,
  }) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: seconds ?? 3,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: AppTextStyles.regular16(context).fontSize,
  );

  static void showToastSuccessTop({
    required BuildContext context,
    required String message,
    int? seconds,
  }) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: seconds ?? 3,
    backgroundColor: const Color(0xFF0D7FF2),
    textColor: Colors.white,
    fontSize: AppTextStyles.regular16(context).fontSize,
  );
}
