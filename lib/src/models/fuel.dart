import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lottie/lottie.dart';
import 'package:motor_app/src/controllers/fuel_controller.dart';
import 'package:motor_app/src/widgets/rounded_card.dart';

class FuelDetailsList extends StatefulWidget {
  User user;
  FuelDetailsList({Key? key, required this.user}) : super(key: key);

  @override
  State<FuelDetailsList> createState() => _FuelDetailsListState();
}

class _FuelDetailsListState extends State<FuelDetailsList> {
  late User user;
  final _firestore = FirebaseFirestore.instance;
  final MyController myController = Get.find();

  Future<List<Map<String, dynamic>>> _getFuelDetails() async {
    final querySnapshot = await _firestore
        .collection('fuel_details')
        .where('user', isEqualTo: widget.user.email)
        .get();
    return querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final fuelDetails = myController.fuelDetails;

      if (myController.isLoading.value) {
        return const Center(
          child: LoadingIndicator(
            indicatorType: Indicator.ballClipRotatePulse,
          ),
        );
      } else if (fuelDetails.isEmpty) {
        return Center(
          child: SizedBox(
            height: 400,
            width: 300,
            child: Lottie.asset(
              'assets/images/animation.json',
            ),
          ),
        );
      } else {
        // Show fuel details list when data is loaded
        return ListView.builder(
          itemCount: fuelDetails.length,
          itemBuilder: (context, index) {
            final fuelDetail = fuelDetails[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: RoundedCard(
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.monetization_on,
                            color: Colors.grey,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Rs. ${fuelDetail['amount'].toString()}',
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Colors.grey,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            fuelDetail['dateTime'].toString().substring(0, 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                  subtitle: Text('Quantity: ${fuelDetail['quantity']}'),
                ),
              ),
            );
          },
        );
      }
    });
  }
}
