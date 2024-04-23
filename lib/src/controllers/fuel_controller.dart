import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:motor_app/src/widgets/snackbar.dart';

class MyController extends GetxController {
  var isLoading = false.obs;
  var isSubmitting = false.obs;
  var fuelDetails = <Map<String, dynamic>>[].obs;
  User? user;
  var totalAmount = 0.0.obs;

  void refreshFuelDetailsList(User user) async {
    var snapshot = await FirebaseFirestore.instance
        .collection('fuel_details')
        .where('user', isEqualTo: user.email)
        .get();

    // Clear existing fuelDetails
    fuelDetails.clear();

    // Reset totalAmount
    totalAmount.value = 0;
    // Iterate through each document
    snapshot.docs.forEach((doc) {
      // Get the data of the document
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      // Add the data to fuelDetails
      fuelDetails.add(data);

      // Extract the amount from the document data and add it to the totalAmount
      if (data.containsKey('amount') && data['amount'] is num) {
        totalAmount.value += data['amount'];
        print('total amount: $totalAmount');
      }
    });

    fuelDetails.assignAll(snapshot.docs.map((doc) => doc.data()).toList());
  }

  void createTransaction(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController textControllerAmount,
    TextEditingController textControllerItem,
    User user,
  ) async {
    var result = showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              title: const Text('NEW TRANSACTION'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Form(
                            key: formKey,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Amount?',
                              ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Enter an amount';
                                }
                                return null;
                              },
                              controller: textControllerAmount,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'For what?',
                            ),
                            controller: textControllerItem,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                MaterialButton(
                  color: Colors.grey[600],
                  child: const Text('Cancel',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                MaterialButton(
                  color: Colors.grey[600],
                  onPressed: isLoading.value
                      ? null
                      : () => _submitTransaction(context, formKey,
                          textControllerAmount, textControllerItem, user),
                  child: isSubmitting.value
                      ? const SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text('Enter',
                          style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
    );
    if (result != null && result == true) {
      textControllerAmount.clear();
      textControllerItem.clear();
    }
  }

  void _submitTransaction(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController textControllerAmount,
    TextEditingController textControllerItem,
    User user,
  ) async {
    if (isLoading.value || isSubmitting.value) return;

    if (formKey.currentState!.validate()) {
      isSubmitting(true);
      double amount = double.parse(textControllerAmount.text);
      String reason = textControllerItem.text;
      String documentId =
          FirebaseFirestore.instance.collection('fuel_details').doc().id;

      final now = DateTime.now();
      final formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(now);

      Map<String, dynamic> data = {
        'amount': amount,
        'reason': reason,
        'dateTime': formattedDate,
        'user': user!.email,
      };

      isLoading(true);

      FirebaseFirestore.instance
          .collection('fuel_details')
          .doc(documentId)
          .set(data)
          .then((value) {
        Navigator.of(context).pop();
        showSnackBar(
            context, 'Success', 'Fuel Detail saved successfully', true);
        refreshFuelDetailsList(user);
      }).catchError((error) {
        showSnackBar(context, 'Failure', 'Fuel Detail save Failed', false);
      }).whenComplete(() {
        isLoading(false);
        isSubmitting(false);
        textControllerAmount.clear();
        textControllerItem.clear();
      });
    }
  }
}
