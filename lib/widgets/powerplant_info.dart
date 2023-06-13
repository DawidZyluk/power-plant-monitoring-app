import 'package:flutter/material.dart';
import 'package:MEWA/widgets/display_bool.dart';

class PowerplantInfo extends StatefulWidget {
  final String? timestamp;
  final bool? voltage;
  final bool? diverter;
  final double? powerActiveAvg;

  const PowerplantInfo({super.key, this.timestamp, this.voltage, this.diverter, this.powerActiveAvg});

  @override
  State<PowerplantInfo> createState() => _PowerplantInfoState();
}

class _PowerplantInfoState extends State<PowerplantInfo> {
  @override
  Widget build(BuildContext context) {
    
    //var date;
    var time;
    if(widget.timestamp!.isNotEmpty){
    final timeReading = DateTime.parse(widget.timestamp!);
    final ourTimeZone = DateTime(timeReading.year, timeReading.month, timeReading.day, timeReading.hour+2, timeReading.minute).toIso8601String();

    final timestamp = ourTimeZone.split('T');
    time = timestamp[1].split('.')[0];
    } 
    
    Widget content = SizedBox(height: 50,child: Text("Brak aktualnych danych"),);

    if(widget.timestamp!.isNotEmpty) {
      content = Column(
              children: [
                const SizedBox(
                height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                DisplayBool(title: "Napięcie", value: widget.voltage,),
                const SizedBox(
                  height: 7,
                ),
                DisplayBool(title: "Odchylacz", value: widget.diverter,),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  "średnia Moc czynnna: ${widget.powerActiveAvg!.toStringAsFixed(1)} kW",
                  style: TextStyle(fontSize: 16),
                ), // suma mocy z 3 faz
              ],
             );
    }

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Color.fromARGB(100, 10, 10, 10),
      child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: const Color.fromARGB(100, 241, 241, 241),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Column(
                children: [
                  Text(
                "Status elektrowni",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5,),
              Text(
                '${time ?? ""}',
                style: TextStyle(fontSize: 16,),
              ),
                ],
              ),
              content
              
            ],
          )),
    );
  }
}
