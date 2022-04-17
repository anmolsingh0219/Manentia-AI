import 'package:app/models/response_models/history_response_model.dart';
import 'package:get/get.dart';

class AllRecordsController extends GetxController {
  final List<HistoryRecord> records;
  AllRecordsController(this.records) {
    filteredRecords = records;
    update();
  }

  List<HistoryRecord> filteredRecords = [];

  filter(String id) {
    filteredRecords = records
        .where((record) =>
            record.objId.toString().toLowerCase().contains(id.toLowerCase()))
        .toList();
    update();
  }

  resetFilter() {
    filteredRecords = records;
    update();
  }
}
