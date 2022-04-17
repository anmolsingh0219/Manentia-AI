import 'package:app/utilities/toast.dart';
import 'package:connectivity/connectivity.dart';

class ConnectivityHelper {
  static Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      // I am connected to a mobile network.
      Toast.showToast(false, 'Looks like you are not connected to internet');
      return false;
    }
    return true;
  }
}