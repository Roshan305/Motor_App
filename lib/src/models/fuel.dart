import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:lottie/lottie.dart';
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
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _getFuelDetails(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData) {
          return const Center(
              child: SizedBox(
            height: 50.0,
            child:
                LoadingIndicator(indicatorType: Indicator.ballClipRotatePulse),
          ));
        }

        final fuelDetails = snapshot.data!;

        if (fuelDetails.isEmpty) {
          return Center(
            child: SizedBox(
              height: 400,
              width: 300,
              child: Lottie.asset(
                'assets/images/animation.json',
              ),
            ),
          );
        }

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListView.builder(
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
                        Text('Amount: ${fuelDetail['amount']}'),
                        Text(
                            'Date: ${fuelDetail['dateTime'].toString().substring(0, 10)}'),
                      ],
                    ),
                    subtitle: Text('Reason: ${fuelDetail['reason']}'),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
