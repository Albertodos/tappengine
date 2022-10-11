import 'package:flutter/material.dart';
import 'package:tappengine/widgets/views/cards/info/info.dart';
import 'package:tappengine/widgets/views/reusebles/reusables.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../model/objects/pull_data.dart';
import '../../../../../widgets/structural/list_Structural.dart';
import '../../../../../widgets/views/cards/analytics/analytics.dart';
import '../../../../dependencies/datepicker/datepicker.dart';
import '../../../../widgets/views/events/events.dart';

class MyEventsVC extends StatefulWidget {
  const MyEventsVC({super.key});

  @override
  State<MyEventsVC> createState() => _MyEventsVCState();
}

class _MyEventsVCState extends State<MyEventsVC> {
  @override
  Widget build(BuildContext context) {
    var pulldata1 = PullData(
        data: [const EventsCards().cards02(context), const EventsCards().cards02(context), const EventsCards().cards02(context)],
        more: "View All",
        title: "Events",
        position: Axis.vertical);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.purpura.withAlpha(25),
                  spreadRadius: 4,
                  blurRadius: 8,
                  offset: const Offset(2, 4), // changes position of shadow
                ),
              ],
            ),
            alignment: Alignment.center,
            child: DatePickerService().buildCalender(context),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        ListStrutural(
          data: pulldata1,
          colorTitle: AppColors.black,
          height: null,
        ),
      ],
    );
  }
}
