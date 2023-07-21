import 'package:MEWA/models/phase_readings.dart';
import 'package:flutter/material.dart';
import 'package:MEWA/data/data.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Row;
import 'package:MEWA/utils/save_file.dart' as helper;

class MonthDataGrid extends StatefulWidget {
  MonthDataGrid({Key? key}) : super(key: key);
  @override
  _MonthDataGridState createState() => _MonthDataGridState();
}

class _MonthDataGridState extends State<MonthDataGrid> {
  List<PhaseReadings> _phases = <PhaseReadings>[];
  late PhasesDataSource _phasesDataSource;
  final GlobalKey<SfDataGridState> _key = GlobalKey<SfDataGridState>();

  @override
  void initState() {
    _phases = combinedPhasesMonthAvg;
    _phasesDataSource = PhasesDataSource(phases: _phases);
    super.initState();
  }

  Future<void> exportDataGridToExcel() async {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    String month = date.toString().substring(0,7);
    final Workbook workbook = _key.currentState!.exportToExcelWorkbook();
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    await helper.saveAndLaunchFile(bytes, 'podsumowanie_miesiaca_$month.xlsx');
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
          Expanded(
              child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: SfDataGridTheme(
                data: SfDataGridThemeData(
                    headerColor: Color.fromARGB(255, 226, 226, 226)),
                child: SfDataGrid(
                  key: _key,
                  columnWidthMode: ColumnWidthMode.auto,
                  onQueryRowHeight: (details) {
                    // Set the row height as 70.0 to the column header row.
                    return details.rowIndex == 0 ? 50.0 : 49.0;
                  },
                  source: _phasesDataSource,
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
                )),
          )),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: MaterialButton(
                color: Colors.blue,
                child: const Center(
                    child: Text('Export to Excel',
                        style: TextStyle(color: Colors.white))),
                onPressed: exportDataGridToExcel),
          ),
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Podsumowanie'),
        ),
        body: content);
  }
}

class PhasesDataSource extends DataGridSource {
  PhasesDataSource({required List<PhaseReadings> phases}) {
    _combinedPhases = phases
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
                  columnName: 'powerReactiveAvg', value: e.powerReactive),
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
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
