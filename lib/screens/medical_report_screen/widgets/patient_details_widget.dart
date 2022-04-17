import 'package:app/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientDetailsWidget extends StatelessWidget {
  final String name;
  final String age;
  final String weight;
  final String gender;
  final String bloodGroup;

  const PatientDetailsWidget(
      {Key key,
      @required this.name,
      @required this.age,
      @required this.weight,
      @required this.gender,
      @required this.bloodGroup})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Patient Details', style: TextStyles.grey18),
        SizedBox(height: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $name',
              style: Get.textTheme.bodyText1,
            ),
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Age: $age',
                    style: Get.textTheme.bodyText1,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Weight: $weight',
                    style: Get.textTheme.bodyText1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Gender: $gender',
                    style: Get.textTheme.bodyText1,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Blood Group: $bloodGroup',
                    style: Get.textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
