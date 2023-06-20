import 'package:flutter/material.dart';
import 'package:MEWA/data/data.dart';
import 'package:MEWA/models/chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PowerActiveChart extends StatefulWidget {
  const PowerActiveChart({super.key});

  @override
  State<PowerActiveChart> createState() => _PowerActiveChartState();
}

class _PowerActiveChartState extends State<PowerActiveChart> {
  List<ChartData> _chartData = [];

  @override
  void initState() {
    _chartData = getChartData();

    super.initState();
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Wykres mocy czynnej"),),
    body: SingleChildScrollView(
      //scrollDirection: Axis.horizontal,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(20, 30, 20, 40),
        margin: EdgeInsets.fromLTRB(0, 140, 0, 140),
        child: Center(
            child: Container(
              // width: 1200,
              // height: 400,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(minimum: 0, interval: 0.5, title: AxisTitle(text: "kW"), name: "Moc czynna"),
                tooltipBehavior: TooltipBehavior(enable: true, header: "Moc czynna"),
                series: <LineSeries<ChartData, String>>[
                  LineSeries<ChartData, String>(
                    dataSource: _chartData,
                    xValueMapper: (ChartData data, _) {
                      final timeReading = DateTime.parse(data.timestamp);
                      final ourTimeZone = DateTime(timeReading.year, timeReading.month, timeReading.day, timeReading.hour+2, timeReading.minute).toIso8601String();

                      final timestamp = ourTimeZone.split('T');
                      final time = timestamp[1].split('.')[0].substring(0, 5);
                      return time;
                    },
                    yValueMapper: (ChartData data, _) => data.value / 1000
                  )
                ]
              )
            )
          ),
      ),
    )
  );
}
}




