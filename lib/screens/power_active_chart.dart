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
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _zoomPanBehavior =
        ZoomPanBehavior(enablePinching: true, enablePanning: true);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(Color.fromARGB(131, 227, 242, 253));
    color.add(Color.fromARGB(144, 144, 202, 249));
    color.add(Color.fromARGB(84, 97, 180, 248));

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors = LinearGradient(
        colors: color,
        stops: stops,
        transform: GradientRotation((270 * (3.14 / 180))));

    return Scaffold(
      appBar: AppBar(
        title: Text("Wykres mocy czynnej"),
      ),
      body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            //borderRadius: BorderRadius.circular(12)
          ),
          height: 500,
          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
          // margin: EdgeInsets.fromLTRB(10, 100, 10, 120),
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(
                labelStyle: TextStyle(color: Colors.grey[600]),
                majorGridLines: MajorGridLines(width: 0),
              ),
              primaryYAxis: NumericAxis(
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  rangePadding: ChartRangePadding.additional,
                  //labelFormat: '{value} kW',
                  //minimum: 0,
                  //interval: 1,
                  title: AxisTitle(
                      text: "kW",
                      textStyle: TextStyle(color: Colors.grey[600])),
                  name: "Moc czynna"),
              tooltipBehavior:
                  TooltipBehavior(enable: true, header: "Moc czynna"),
              zoomPanBehavior: _zoomPanBehavior,
              series: <LineSeries<ChartData, String>>[
                LineSeries<ChartData, String>(
                  //borderColor: Colors.blue[600],
                  //borderWidth: 1,
                  //color: Colors.blue[600],
                  dataSource: _chartData,
                  //gradient: gradientColors,
                  xValueMapper: (ChartData data, _) {
                    final timeReading = DateTime.parse(data.timestamp);
                    final ourTimeZone = DateTime(
                            timeReading.year,
                            timeReading.month,
                            timeReading.day,
                            timeReading.hour + 2,
                            timeReading.minute)
                        .toIso8601String();

                    final timestamp = ourTimeZone.split('T');
                    final time = timestamp[1].split('.')[0].substring(0, 5);
                    return time;
                  },
                  yValueMapper: (ChartData data, _) => data.value / 1000,
                )
              ])),
    );
  }
}
