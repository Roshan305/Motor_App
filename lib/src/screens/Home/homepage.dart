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
