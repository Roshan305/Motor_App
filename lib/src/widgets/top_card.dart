import 'package:flutter/material.dart';
import 'package:motor_app/src/widgets/bar_chart.dart';

class TopNeuCard extends StatelessWidget {
  final double totalAmount;

  const TopNeuCard({
    required this.totalAmount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[300],
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          offset: const Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0),
                    ]),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Total Spent',
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 16)),
                      Text(
                        'Rs. ${totalAmount.toStringAsFixed(1)}',
                        style: TextStyle(color: Colors.grey[800], fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[300],
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          offset: const Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0),
                    ]),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('This Month',
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 16)),
                      Text(
                        '\$ 150',
                        style: TextStyle(color: Colors.grey[800], fontSize: 40),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[300],
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          offset: const Offset(4.0, 4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0),
                      const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4.0, -4.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0),
                    ]),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Saved',
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 16)),
                      Text(
                        '\$ 100',
                        style: TextStyle(color: Colors.grey[800], fontSize: 40),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20), // Add spacing between the two rows
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Align items to center
            children: [
              SizedBox(
                height: 200,
                width: 300,
                child: VerticalBarChartSample(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
