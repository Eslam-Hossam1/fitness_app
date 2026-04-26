import 'package:fitness_app/features/plans/data/repos/plans_repo.dart';
import 'package:fitness_app/features/plans/presentation/view_models/plans_cubit.dart';
import 'package:fitness_app/features/plans/presentation/widgets/plans_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlansView extends StatelessWidget {
  const PlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlansCubit(PlansRepo())..getPlans(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Icon(Icons.bolt, color: Colors.blue, size: 30.sp),
              SizedBox(width: 4),
              Text(
                'IRONPULSE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_outlined),
              onPressed: () {},
            ),
          ],
        ),
        body: PlansViewBody(),
      ),
    );
  }
}
