import 'package:app/components/neu_icon_button.dart';
import 'package:app/components/neu_textfield.dart';
import 'package:app/controllers/dashboard_controller/all_records_controller.dart';
import 'package:app/models/response_models/history_response_model.dart';
import 'package:app/screens/dashboard_screen/dashboard_screen.dart';
import 'package:app/screens/dashboard_screen/widgets/history_record.dart';
import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllRecordsScreen extends StatelessWidget {
  final List<HistoryRecord> records;
  final ImageType imageType;

  const AllRecordsScreen(
      {Key key, @required this.records, @required this.imageType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: Get.theme.iconTheme,
          leading: NeuIconButton(
              child: Icon(Icons.arrow_back_rounded,
                  color: AppColors.greyTextColor, size: 20),
              radius: 50,
              onTap: () {
                Get.back();
              }),
        ),
        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            gradient: AppColors.blackBackgroundGradient,
          ),
          child: GetBuilder<AllRecordsController>(
              init: AllRecordsController(records),
              builder: (controller) {
                return SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Text(
                        'All Records',
                        style: Get.textTheme.headline2,
                      ),
                      SizedBox(height: 10),
                      NeuTextField(
                        hint: 'Search using ID',
                        validator: (value) => null,
                        onChanged: (value) {
                          controller.filter(value);
                        },
                        isNumber: true,
                      ),
                      SizedBox(height: 10),
                      for (var i = 0;
                          i < controller.filteredRecords.length;
                          i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Hero(
                            tag: controller.filteredRecords[i].id.toString(),
                            child: HistoryRecordWidget(
                              record: controller.filteredRecords[i],
                              imageType: imageType,
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
