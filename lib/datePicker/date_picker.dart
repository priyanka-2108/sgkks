import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sgkks/utils/custom_color.dart';

import '../controller/date_picker_controller.dart';

DatePickerController datePickerData = Get.put(DatePickerController());

class DatePicker {
  static DateTime selectedDate = DateTime.now();
  static Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: CustomColor.linearPrimaryColor,
              ),
            ),
            child: child!,
          );
        });
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;

      datePickerData.inputDate.value =
          DateFormat('dd-MM-yyyy').format(selectedDate);

      print("inputDate-->${datePickerData.inputDate.value}");
    }
  }
}
