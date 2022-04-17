
import 'package:app/api/api.dart';
import 'package:app/models/response_models/guest_response_model.dart';
import 'package:app/routing/routes.dart';
import 'package:app/utilities/log.dart';
import 'package:app/utilities/shared_prefs.dart';
import 'package:app/utilities/toast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController extends GetxController {
  bool loading = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ],
  );

  GuestResponseModel guestResponseModel;

  Future<void> handleSignIn() async {
    loading = true;
    update();
    try {
      GoogleSignInAccount account = await _googleSignIn.signIn();
      Log.print(account.displayName, 'GOOGLE SIGN IN');
      if (account.id != null) {
        GuestResponseModel response = await API.authAPI.storeGuestUser(account);
        if (response != null) {
          
      SharedPrefs().authToken = response.token;
      SharedPrefs().doctorID = int.parse(response.doctorId);
      SharedPrefs().apiEndPoint = response.apiEndPoint;
      API.dio.options.baseUrl = response.apiEndPoint;
          // SharedPrefs().guestUserName =
          //     (account.displayName == '' || account.displayName == null)
          //         ? 'Guest User'
          //         : account.displayName;
          // guestResponseModel = response;
          // SharedPrefs().guestResponseModel = jsonEncode(response.toJson());
          Get.offAllNamed(Routes.baseScreen);
        } else {
          Toast.showToast(false, 'Something went wrong');
        }
      }
      loading = false;
      update();
    } catch (error) {
      Log.print(error.toString(), 'GOOGLE SIGN IN ERROR');
      Toast.showToast(false, 'Something went wrong');
      loading = false;
      update();
    }
  }

  isSignedIn(){
    return _googleSignIn.isSignedIn();
  }

  logOut(){
    _googleSignIn.signOut();
  }
}
