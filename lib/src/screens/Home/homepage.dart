import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motor_app/src/controllers/fuel_controller.dart';
import 'package:motor_app/src/models/fuel.dart';
import 'package:motor_app/src/widgets/top_card.dart';

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
  final MyController myController = Get.put(MyController());
  final _textcontrollerAMOUNT = TextEditingController();
  final _textcontrollerITEM = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    user = widget.user;
    myController.refreshFuelDetailsList(widget.user);
    super.initState();
  }

  // void _newTransaction() {
  //   showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (BuildContext context) {
  //         return StatefulBuilder(
  //           builder: (BuildContext context, setState) {
  //             return AlertDialog(
  //               title: const Text('NEW TRANSACTION'),
  //               content: SingleChildScrollView(
  //                 child: Column(
  //                   children: [
  //                     const SizedBox(
  //                       height: 5,
  //                     ),
  //                     Row(
  //                       children: [
  //                         Expanded(
  //                           child: Form(
  //                             key: _formKey,
  //                             child: TextFormField(
  //                               decoration: const InputDecoration(
  //                                 border: OutlineInputBorder(),
  //                                 hintText: 'Amount?',
  //                               ),
  //                               validator: (text) {
  //                                 if (text == null || text.isEmpty) {
  //                                   return 'Enter an amount';
  //                                 }
  //                                 return null;
  //                               },
  //                               controller: _textcontrollerAMOUNT,
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     const SizedBox(
  //                       height: 5,
  //                     ),
  //                     Row(
  //                       children: [
  //                         Expanded(
  //                           child: TextField(
  //                             decoration: const InputDecoration(
  //                               border: OutlineInputBorder(),
  //                               hintText: 'For what?',
  //                             ),
  //                             controller: _textcontrollerITEM,
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //               actions: <Widget>[
  //                 MaterialButton(
  //                   color: Colors.grey[600],
  //                   child: const Text('Cancel',
  //                       style: TextStyle(color: Colors.white)),
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                 ),
  //                 MaterialButton(
  //                   color: Colors.grey[600],
  //                   onPressed: _isLoading // Disable button while loading
  //                       ? null
  //                       : () {
  //                           if (_formKey.currentState!.validate()) {
  //                             String amount = _textcontrollerAMOUNT.text;
  //                             String reason = _textcontrollerITEM.text;
  //                             String documentId = FirebaseFirestore.instance
  //                                 .collection('fuel_details')
  //                                 .doc()
  //                                 .id;

  //                             final now = DateTime.now();
  //                             final formattedDate =
  //                                 DateFormat('yyyy-MM-dd HH:mm').format(now);

  //                             Map<String, dynamic> data = {
  //                               'amount': amount,
  //                               'reason': reason,
  //                               'dateTime': formattedDate,
  //                               'user': user!.email,
  //                             };

  //                             setState(() {
  //                               _isLoading =
  //                                   true; // Set loading to true before adding data
  //                             });

  //                             FirebaseFirestore.instance
  //                                 .collection('fuel_details')
  //                                 .doc(documentId)
  //                                 .set(data)
  //                                 .then((value) {
  //                               Navigator.of(context).pop();
  //                               showSnackBar(context, 'Success',
  //                                   'Fuel Detail saved successfully', true);
  //                               _refreshFuelDetailsList();
  //                             }).catchError((error) {
  //                               showSnackBar(context, 'Failure',
  //                                   'Fuel Detail save Failed', false);
  //                             }).whenComplete(() {
  //                               setState(() {
  //                                 _isLoading =
  //                                     false; // Set loading to false after completing the operation
  //                                 _isSubmitting = false;
  //                               });
  //                             });
  //                           }
  //                         },
  //                   child:
  //                       _isLoading // Display loading indicator if _isLoading is true
  //                           ? const LoadingIndicator(indicatorType: Indicator.ballClipRotatePulse) // Loading indicator
  //                           : const Text('Enter',
  //                               style: TextStyle(color: Colors.white)),
  //                 )
  //               ],
  //             );
  //           },
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Obx(() => TopNeuCard(
                  totalAmount: myController.totalAmount.value,
                )),
            Expanded(
              child: FuelDetailsList(user: user!),
            ),
            ElevatedButton(
              onPressed: () => myController.createTransaction(context, _formKey,
                  _textcontrollerAMOUNT, _textcontrollerITEM, user!),
              child: const Text('Create Transaction'),
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
