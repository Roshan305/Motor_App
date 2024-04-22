import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class VerticalBarChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(),
            plotAreaBorderWidth: 0,
            plotAreaBackgroundColor: Colors.transparent,
            series: <BarSeries<SalesData, String>>[
              BarSeries<SalesData, String>(
                isTrackVisible: false,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                dataSource: <SalesData>[
                  SalesData('2010', 5),
                  SalesData('2011', 25),
                  SalesData('2012', 100),
                  SalesData('2013', 75),
                ],
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SalesData {
  final String year;
  final int sales;

  SalesData(this.year, this.sales);
}
