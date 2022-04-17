import 'package:app/theme/app_textstyles.dart';
import 'package:app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpDeskDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.theme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: AppColors.blackBackgroundGradient,
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Help Desk', style: Get.textTheme.headline5),
                    IconButton(
                        icon: Icon(Icons.close,
                            size: 20, color: Get.theme.accentColor),
                        onPressed: () {
                          Get.back();
                        })
                  ],
                ),
                Text(
                    '''For seamless Radiodiagnosis Procedure and Accurate Results, Manentia AI has been developed with Ai-Technology to aid Doctors for Rapid and Speedy detection of Lung diseases and other related Ailments. The app helps you to manage patients feasibly and provides easy access over the medial history and their Record.
This software gives an edge to the doctors to take prompt action and save lives through Radiography. Manentia AI filters the Complex data into Highlighted Images and Readable Analysis for the Screening. 

What does the Manentia AI offers
•	Accurate Results: Our advanced technology and Ai based software provide speed and precise results for a seamless diagnostic experience. 
•	Fast-track Diagnosis: Our self-built state of art imparts hands-on report generation, which helps paramedics and radiologists to fasten the analytical procedure. 
•	Cloud-based Storage: We unconfined you from carrying and storing vital prescriptions and reports by providing cloud storage that surfed Anytime and Anywhere. 
•	Comprehensive Screening: With our ultra-modern provision, we guarantee timely and prompt results for more than 13 lung diseases. 
•	Easy to Analyze: Aling with detailed results, it also enhances and marks the infected areas within the reports for an effortless understanding of the record. 

Features:

Rayscan 
An Ai-based virtual scanner developed to detect Respiratory and Lung diseases using X-ray and CT-Scan Images for Precise and Easy Analysis. It uses high deep learning algorithms to detect and mark the infected areas in Radio Images.

RatinoScan
Armed with a team of Tech-savvy engineers, we have curated an online Scanning software that detects the symptoms of Diabetes Retinopathy at an early stage with the help of Fundus images derived from the scanning tests. It focuses on Micro aneurysms, Hemorrhages, Exudates and generates various screening images from a single result imaging.''',
                    style: TextStyles.grey14),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
