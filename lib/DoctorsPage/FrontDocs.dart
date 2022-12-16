import 'package:flutter/material.dart';
import 'package:medicalpat/DoctorsPage/doctor_information_data.dart';
import 'package:medicalpat/DoctorsPage/widgets/doctors_information.dart';
import 'package:medicalpat/DoctorsPage/widgets/textbox.dart';
import 'package:medicalpat/constants/constants.dart';

class Doctors extends StatefulWidget {
  const Doctors({Key? key}) : super(key: key);

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  final List<DoctorInformationModel> doctorInformations = doctorInformation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
                    // Text(
                    //   "Make Appoinment",
                    //   style: TextStyle(color: Colors.black, fontSize: 30),
                    // ),
                    Text(
                      AppText.findDoctor,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Container(
                      width: 40,
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                const CustomTextBox(),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      AppText.topDoctors,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Text(
                      AppText.viewAll,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: AppColors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                DoctorInformation(doctorInformations: doctorInformations),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
