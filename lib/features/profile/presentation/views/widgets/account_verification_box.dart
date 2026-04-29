import 'package:fitness_app/core/theme/app_colors.dart';
import 'package:fitness_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AccountVerificationBox extends StatelessWidget {
  const AccountVerificationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.darkOutline),
        color: AppColors.darkFormColor,
      ),
      height: MediaQuery.of(context).size.height * .1,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              Icons.verified_user,
              size: 30,
              color: Colors.blueAccent,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  'Account Verification',
                  style: AppTextStyles.medium14(context),
                ),
              ),
              Flexible(
                child: Text(
                  'Your identity was verified on Oct 2023',
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regular12(
                    context,
                  ).copyWith(color: AppColors.darkSecondaryTextColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
