import 'package:flutter/material.dart';
import 'package:mewa/data/data.dart';
import 'package:mewa/models/chart_data.dart';
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
      scrollDirection: Axis.horizontal,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(20, 30, 20, 40),
        child: Center(
            child: Container(
              width: 1200,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
      
                series: <LineSeries<ChartData, String>>[
                  LineSeries<ChartData, String>(
                    dataSource: _chartData,
                    xValueMapper: (ChartData data, _) {
                      return data.timestamp.split('T')[1].split('.')[0];
                    },
                    yValueMapper: (ChartData data, _) => data.value
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




