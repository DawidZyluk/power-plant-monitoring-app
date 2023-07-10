import 'package:MEWA/models/combined_phases.dart';
import 'package:flutter/material.dart';
import 'package:MEWA/data/data.dart';
import 'package:MEWA/models/phase_readings.dart';
import 'package:MEWA/widgets/phase_reading.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

List<CombinedPhase> employees = <CombinedPhase>[];

late EmployeeDataSource employeeDataSource;

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<CombinedPhase> employees}) {
    _employees = employees
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'date', value: e.timestamp.split(' ')[0]),
              DataGridCell<String>(
                  columnName: 'time', value: e.timestamp.split(' ')[1]),
              DataGridCell<double>(
                  columnName: 'voltageAvg', value: e.voltageAvg),
              DataGridCell<double>(
                  columnName: 'currentAvg', value: e.currentAvg),
              DataGridCell<double>(
                  columnName: 'powerActiveAvg', value: e.powerActiveAvg),
              DataGridCell<double>(
                  columnName: 'powerReactveAvg', value: e.powerReactiveAvg),
              DataGridCell<double>(
                  columnName: 'powerApparentAvg', value: e.powerApparentAvg),
            ]))
        .toList();
  }

  List<DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16.0),
        child: Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
}

class CombinedPhasesScreen extends StatefulWidget {
  const CombinedPhasesScreen({super.key, required this.title});

  final String title;

  @override
  State<CombinedPhasesScreen> createState() => _CombinedPhasesScreenState();
}

class _CombinedPhasesScreenState extends State<CombinedPhasesScreen> {
  void _selectPhase(BuildContext context, PhaseReadings readings) {
    Widget screen = PhaseReading(reading: readings);

    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => screen));
  }

  @override
  void initState() {
    super.initState();
    employees = combinedPhases;
    employeeDataSource = EmployeeDataSource(employees: employees);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Brak odczytów",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Coś poszło nie tak",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );

    if (phase1.isNotEmpty && phase2.isNotEmpty && phase3.isNotEmpty) {
      content = Container(
          decoration: BoxDecoration(color: Colors.white),
          child: SfDataGrid(
            onQueryRowHeight: (details) {
              // Set the row height as 70.0 to the column header row.
              return details.rowIndex == 0 ? 70.0 : 49.0;
            },
            source: employeeDataSource,
            columns: <GridColumn>[
              GridColumn(
                  columnName: 'date',
                  label: Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Data',
                      ))),
              GridColumn(
                  columnName: 'time',
                  label: Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Godzina',
                      ))),
              GridColumn(
                  columnName: 'voltageAvg',
                  label: Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Napięcie',
                      ))),
              GridColumn(
                  columnName: 'currentAvg',
                  label: Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Prąd',
                      ))),
              GridColumn(
                  columnName: 'powerActiveAvg',
                  label: Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Moc czynna',
                      ))),
              GridColumn(
                  columnName: 'powerReactiveAvg',
                  label: Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Moc bierna',
                      ))),
              GridColumn(
                  columnName: 'powerApparentAvg',
                  label: Container(
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Moc pozorna',
                      ))),
            ],
          ));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Odczyt faz'),
        ),
        body: content);
  }
}
