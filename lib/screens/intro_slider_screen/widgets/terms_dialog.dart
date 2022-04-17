import 'package:app/routing/routes.dart';
import 'package:app/theme/colors.dart';
import 'package:app/utilities/shared_prefs.dart';
import 'package:app/utilities/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsDialog extends StatefulWidget {
  @override
  _TermsDialogState createState() => _TermsDialogState();
}

class _TermsDialogState extends State<TermsDialog> {
  bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    context.theme;
    return StatefulBuilder(
      builder: (context, myState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Material(
            color: Get.theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                Expanded(
                                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Terms of Service', style: Get.textTheme.headline5),
                            IconButton(
                                icon: Icon(Icons.close,
                                    size: 20, color: Get.theme.accentColor),
                                onPressed: () {
                                  Get.back();
                                })
                          ],
                        ),
                        Text(
                            '''•	By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to Manentia Advisory.

•	Manentia Advisory is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.

•	The Manentia Advisory app stores and processes personal data that you have provided to us, in order to provide our Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the Manentia Advisory app won’t work properly or at all.

•	The app does use third party services that declare their own Terms and Conditions.

•	Link to Terms and Conditions of third party service providers used by the app Google Play Services

•	You should be aware that there are certain things that Manentia Advisory will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but Manentia Advisory cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.

•	If you’re using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.

•	Along the same lines, Manentia Advisory cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, Manentia Advisory cannot accept responsibility.

•	With respect to Manentia Advisory’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavour to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. Manentia Advisory accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.

•	At some point, we may wish to update the app. The app is currently available on Android – the requirements for system(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. Manentia Advisory does not promise that it will always update the app so that it is relevant to you and/or works with the Android version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.

•	Software generated interpretation report meant only for the information of the referring licensed radiologist practitioners, licensed radiologist students and doctor.

•	Also, this interpretation is not a conclusive diagnosis and should be correlated with patient history and relevant clinical findings as well as This interpretation is to be used with other relevant clinical examination and should be compared with reports with prior radiographs.

•	The interpretation of the report is dependent on the quality of the images captured as well as the procedure involved in capturing such images. Partial reproduction of this interpretation report is not valid and should not be resorted to.

•	We restrict total dependency on our report, any future mishap with regards to Manentia Advisory produced graphs permits us to take ZERO RESPONSIBILITY of the event.

•	Verification steps shall be taken after the virtual screening, after the case is forwarded to the Doctors, we take NO RESPONSIBILITY in the failure or any inconvenience caused to the patient.

•	In any Unfortunate situation, Manentia Advisory holds NO ACCOUNATIBILTY over PATIENT’S DEATH.

•	The FINAL DECISION and ANALYSIS OF THE GRAPHS solely depends on the Doctors and there shall be no involvement of Manentia Advisory thereafter.

•	Manentia Advisory Inc. and its sub-product will not be responsible in any form any caused to life due to malpractice of this software.
'''),
                      ],
                    ),
                  ),
                ),
                CheckboxListTile(
                  title: Text('I agree to the Terms of Service', style: Get.textTheme.bodyText1),
                  value: termsAccepted, onChanged: (value){
                  myState((){
                    termsAccepted = value;
                  });
                }),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.orangeColor,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10)
                  ),
                  onPressed: (){
                  if(termsAccepted){
                    SharedPrefs().firstLaunchDone = true;
              Get.offAllNamed(Routes.loginScreen);
                  }
                  else {
                    Toast.showToast(false, 'Please accept the Terms of Service');
                  }
                }, child: Text('Submit', style: Get.textTheme.bodyText1.copyWith(color: AppColors.whiteColor)),),
              ],
            ),
          ),
        );
      }
    );
  }
}
