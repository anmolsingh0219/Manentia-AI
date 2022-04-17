import 'package:app/utilities/date_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorDetailsWidget extends StatelessWidget {
  final String doctorName;
  final String hospitalName;
  final DateTime time;

  const DoctorDetailsWidget(
      {Key key,
      @required this.doctorName,
      @required this.hospitalName,
      @required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Consulted by: $doctorName',
              style: Get.textTheme.bodyText1,
            ),
            Text(
              'Hospital Name: $hospitalName',
              style: Get.textTheme.bodyText1,
            ),
            Text(
              'Report Generated On: ${time.day} ${DateHelper.months[time.month - 1]} ${time.year}',
              style: Get.textTheme.bodyText1,
            ),
          ],
        ),
      ],
    );
  }
}
