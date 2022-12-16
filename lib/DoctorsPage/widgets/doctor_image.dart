import 'package:flutter/material.dart';
import 'package:medicalpat/DoctorsPage/doctor_information_data.dart';
import 'package:medicalpat/DoctorsPage/widgets/widgets.dart';
import 'package:medicalpat/constants/constants.dart';

class DoctorImage extends StatelessWidget {
  final DoctorInformationModel doctorInformationModel;

  const DoctorImage({
    Key? key,
    required this.doctorInformationModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 375.h,
      child: Stack(
        children: [
          Hero(
            tag: "doctor-hero-${doctorInformationModel.id}",
            child: Container(
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    doctorInformationModel.image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: const SizedBox(height: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: CustomAppBar(
              backButton: true,
              profile: false,
              icon: Icons.arrow_back_ios_new_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
