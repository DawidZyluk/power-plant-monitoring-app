import 'package:MEWA/models/phase_readings.dart';
import 'package:flutter/material.dart';
import 'package:MEWA/data/data.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

List<PhaseReadings> combinedPhases = <PhaseReadings>[];

late CombinedPhasesDataSource combinedPhasesDataSource;

class CombinedPhasesDataSource extends DataGridSource {
  CombinedPhasesDataSource({required List<PhaseReadings> combinedPhases}) {
    _combinedPhases = combinedPhases
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'date', value: e.timestamp.split(' ')[0]),
              DataGridCell<String>(
                  columnName: 'time', value: e.timestamp.split(' ')[1]),
              DataGridCell<double>(columnName: 'voltageAvg', value: e.voltage),
              DataGridCell<double>(columnName: 'currentAvg', value: e.current),
              DataGridCell<double>(
                  columnName: 'powerActiveAvg', value: e.powerActive),
              DataGridCell<double>(
                  columnName: 'powerReactveAvg', value: e.powerReactive),
              DataGridCell<double>(
                  columnName: 'powerApparentAvg', value: e.powerApparent),
            ]))
        .toList();
  }

  List<DataGridRow> _combinedPhases = [];

  @override
  List<DataGridRow> get rows => _combinedPhases;

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
  String _currentPhase = 'avg';

  @override
  void initState() {
    super.initState();
    combinedPhases = combinedPhasesAvg;
    combinedPhasesDataSource =
        CombinedPhasesDataSource(combinedPhases: combinedPhases);
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
      content = Column(
        children: [
          Container(
              height: 500,
              decoration: BoxDecoration(color: Colors.white),
              child: SfDataGridTheme(
                data: SfDataGridThemeData(
                  headerColor: Color.fromARGB(255, 226, 226, 226)
                ),
                child: SfDataGrid(
                columnWidthMode: ColumnWidthMode.auto,
                onQueryRowHeight: (details) {
                  // Set the row height as 70.0 to the column header row.
                  return details.rowIndex == 0 ? 50.0 : 49.0;
                },
                source: combinedPhasesDataSource,
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
                          padding: EdgeInsets.all(6.0),
                          alignment: Alignment.center,
                          child: Text(
                            'Godzina',
                            softWrap: false,
                          ))),
                  GridColumn(
                      columnName: 'voltageAvg',
                      label: Container(
                          padding: EdgeInsets.all(6.0),
                          alignment: Alignment.center,
                          child: Text(
                            'Napięcie [V]',
                            softWrap: false,
                          ))),
                  GridColumn(
                      columnName: 'currentAvg',
                      label: Container(
                          padding: EdgeInsets.all(6.0),
                          alignment: Alignment.center,
                          child: Text(
                            'Prąd [A]',
                          ))),
                  GridColumn(
                      columnName: 'powerActiveAvg',
                      label: Container(
                          padding: EdgeInsets.all(6.0),
                          alignment: Alignment.center,
                          child: Text(
                            'Moc czynna [kW]',
                            textAlign: TextAlign.center,
                          ))),
                  GridColumn(
                      columnName: 'powerReactiveAvg',
                      label: Container(
                          padding: EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: Text(
                            'Moc bierna [kVar]',
                          ))),
                  GridColumn(
                      columnName: 'powerApparentAvg',
                      label: Container(
                          padding: EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: Text(
                            'Moc pozorna [kVa]',
                            softWrap: false,
                          ))),
                ],
              )
              )),
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 5),
            child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    _currentPhase = 'avg';
                    combinedPhasesDataSource = CombinedPhasesDataSource(
                        combinedPhases: combinedPhasesAvg);
                  });
                },
                style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(110, 10, 110, 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    side: BorderSide(width: 2, color: Colors.grey[300]!),
                    backgroundColor: _currentPhase == 'avg'
                        ? Colors.grey[300]
                        : Colors.transparent),
                child: Text(
                  "Średnia",
                  style: TextStyle(
                      fontSize: 18,
                      color: _currentPhase == 'avg'
                          ? const Color.fromARGB(255, 41, 41, 41)
                          : Colors.grey[300]),
                )),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _currentPhase = '1';
                        combinedPhasesDataSource =
                            CombinedPhasesDataSource(combinedPhases: phase1);
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        side: BorderSide(width: 2, color: Colors.grey[300]!),
                        backgroundColor: _currentPhase == '1'
                            ? Colors.grey[300]
                            : Colors.transparent),
                    child: Text(
                      "Faza 1",
                      style: TextStyle(
                          fontSize: 18,
                          color: _currentPhase == '1'
                              ? const Color.fromARGB(255, 41, 41, 41)
                              : Colors.grey[300]),
                    )),
                SizedBox(
                  width: 5,
                ),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _currentPhase = '2';
                        combinedPhasesDataSource =
                            CombinedPhasesDataSource(combinedPhases: phase2);
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        side: BorderSide(width: 2, color: Colors.grey[300]!),
                        backgroundColor: _currentPhase == '2'
                            ? Colors.grey[300]
                            : Colors.transparent),
                    child: Text(
                      "Faza 2",
                      style: TextStyle(
                          fontSize: 18,
                          color: _currentPhase == '2'
                              ? const Color.fromARGB(255, 41, 41, 41)
                              : Colors.grey[300]),
                    )),
                SizedBox(
                  width: 5,
                ),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _currentPhase = '3';
                        combinedPhasesDataSource =
                            CombinedPhasesDataSource(combinedPhases: phase3);
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        side: BorderSide(width: 2, color: Colors.grey[300]!),
                        backgroundColor: _currentPhase == '3'
                            ? Colors.grey[300]
                            : Colors.transparent),
                    child: Text(
                      "Faza 3",
                      style: TextStyle(
                          fontSize: 18,
                          color: _currentPhase == '3'
                              ? const Color.fromARGB(255, 41, 41, 41)
                              : Colors.grey[300]),
                    )),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Odczyt faz'),
        ),
        body: content);
  }
}
