import 'package:app/api/api.dart';
import 'package:app/controllers/menu_controller/menu_controller.dart';
import 'package:app/models/response_models/history_response_model.dart';
import 'package:app/utilities/connectivity_helper.dart';
import 'package:app/utilities/toast.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  bool loading = true; //Handling loading state
  HistoryResponseModel data; //Data got from the Dashboard API
  int currentTabIndex = 0;
  List<String> tabs = ['X Ray', 'CT Scan', 'iCare'];

  @override
  void onReady() {
    super.onReady();
    getDashboardData();
  }

  getDashboardData() async {
    bool isConnected = await ConnectivityHelper.checkConnection();
    if (!isConnected) {
      Get.find<MenuController>().changeScreen(0);
      loading = false;
      update();
      return;
    }
    loading = true;
    update();
    var response = await API.dashboardAPI.getDashboardData();
    if (response != null) {
      data = response;
      final menuController = Get.find<MenuController>();
      menuController.title = 'Welcome, ' + data.name;
      menuController.update();

      loading = false;
      update();
    } else {
      Toast.showToast(false, 'Error fetching data');
    }
  }

  changeTabIndex(int index) {
    currentTabIndex = index;
    update();
  }
}
