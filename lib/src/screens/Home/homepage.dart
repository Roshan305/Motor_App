import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:motor_app/src/models/fuel.dart';
import 'package:motor_app/src/widgets/plus_button.dart';
import 'package:motor_app/src/widgets/snackbar.dart';
import 'package:motor_app/src/widgets/top_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required User user})
      : user = user,
        super(key: key);

  final User user;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user;
  bool _isSubmitting = false;
  final _textcontrollerAMOUNT = TextEditingController();
  final _textcontrollerITEM = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  void _newTransaction() {
    showDialog(
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
                              key: _formKey,
                              child: TextFormField(
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
                                controller: _textcontrollerAMOUNT,
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
                              controller: _textcontrollerITEM,
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
                      Navigator.of(context).pop();
                    },
                  ),
                  MaterialButton(
                    color: Colors.grey[600],
                    child: const Text('Enter',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        String amount = _textcontrollerAMOUNT.text;
                        String reason = _textcontrollerITEM.text;
                        String documentId = FirebaseFirestore.instance
                            .collection('fuel_details')
                            .doc()
                            .id;

                        final now = DateTime.now();
                        final formattedDate =
                            DateFormat('yyyy-MM-dd HH:mm').format(now);

                        Map<String, dynamic> data = {
                          'amount': amount,
                          'reason': reason,
                          'dateTime': formattedDate,
                          'user': user!.email,
                        };

                        FirebaseFirestore.instance
                            .collection('fuel_details')
                            .doc(documentId)
                            .set(data)
                            .then((value) {
                          showSnackBar(context, 'Success',
                              'Fuel Detail saved successfully', true);
                          Navigator.of(context).pop();
                        }).catchError((error) {
                          showSnackBar(context, 'Failure',
                              'Fuel Detail save Failed', false);
                          Navigator.of(context).pop();
                        }).whenComplete(() {
                          setState(() {
                            _isSubmitting = false;
                          });
                        });
                      }
                    },
                  )
                ],
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TopNeuCard(
              balance: const Text('200').toString(),
              income: const Text('100').toString(),
              expense: const Text('300').toString(),
            ),
            Expanded(
              child: FuelDetailsList(user: user!),
            ),
            PlusButton(
              function: _newTransaction,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textcontrollerAMOUNT.dispose();
    _textcontrollerITEM.dispose();
    super.dispose();
  }
}
