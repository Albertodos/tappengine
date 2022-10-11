// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../constants/app_colors.dart';

class DatePickerService {
  Widget buildCalender(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 350,
      child: SfDateRangePicker(
        enablePastDates: false,
        enableMultiView: false,
        todayHighlightColor: AppColors.purpura.withAlpha(60),
        selectionColor: AppColors.purpura,
        rangeSelectionColor: AppColors.purpura.withAlpha(60),
        startRangeSelectionColor: AppColors.purpura,
        endRangeSelectionColor: AppColors.purpura,
        showActionButtons: false,
        viewSpacing: 20,
        headerStyle: const DateRangePickerHeaderStyle(
          textAlign: TextAlign.center,
        ),
        selectionMode: DateRangePickerSelectionMode.range,
        monthViewSettings: const DateRangePickerMonthViewSettings(dayFormat: 'E'),
        onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
          if (args.value is PickerDateRange) {
            // sliderC.rangeStartDate.value =
            //     "${args.value.startDate.day.toString()}/${args.value.startDate.month.toString()}/${args.value.startDate.year.toString()}";
            // if (args.value.endDate != null) {
            //   sliderC.rangeEndDate.value =
            //       "${args.value.endDate.day.toString()}/${args.value.endDate.month.toString()}/${args.value.endDate.year.toString()}";
            // }
          }
          // else if (args.value is DateTime) {
          //   final DateTime selectedDate = args.value;
          //   print(selectedDate);
          // } else if (args.value is List<DateTime>) {
          //   final List<DateTime> selectedDates = args.value;
          // } else {
          //   final List<PickerDateRange> selectedRanges = args.value;
          // }
        },
      ),
    );
  }
}
