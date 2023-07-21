import 'package:MEWA/models/phase_readings.dart';
import 'package:flutter/material.dart';
import 'package:MEWA/data/data.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
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
  String _currentMonth = '';

  @override
  void initState() {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    String month = date.toString().substring(0, 7);

    _phases = combinedPhasesMonthAvg;
    _phasesDataSource = PhasesDataSource(phases: _phases);
    _currentMonth = month;
    getCombinedPhasesMonthAvg(_currentMonth);
    super.initState();
  }

  Future<void> exportDataGridToExcel() async {
    final Workbook workbook = _key.currentState!.exportToExcelWorkbook();
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    await helper.saveAndLaunchFile(
        bytes, 'podsumowanie miesiąca $_currentMonth.xlsx');
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) async {
    String selectedMonth = args.value.toString().split(' ')[0].substring(0, 7);
    await getCombinedPhasesMonthAvg(selectedMonth);
    setState(() {
      _phases = combinedPhasesMonthAvg;
      _phasesDataSource = PhasesDataSource(phases: _phases);
      _currentMonth = selectedMonth;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_currentMonth);
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
            //padding: EdgeInsets.only(top: 10, bottom: 10),
            child: MaterialButton(
                color: const Color.fromARGB(255, 16, 124, 65),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Eksportuj do Excela',
                        style: TextStyle(color: Colors.white)),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.output,
                      size: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
                onPressed: exportDataGridToExcel),
          ),
          Container(
            height: 250,
            //margin: EdgeInsets.only(top: 40, bottom: 40),
            margin: EdgeInsets.all(25),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: SfDateRangePicker(
              onSelectionChanged: _onSelectionChanged,
              view: DateRangePickerView.year,
              allowViewNavigation: false,
            ),
          )
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
              DataGridCell<String>(
                  columnName: 'voltageAvg',
                  value: e.voltage.toStringAsFixed(2)),
              DataGridCell<String>(
                  columnName: 'currentAvg',
                  value: e.current.toStringAsFixed(2)),
              DataGridCell<String>(
                  columnName: 'powerActiveAvg',
                  value: (e.powerActive / 1000).toStringAsFixed(2)),
              DataGridCell<String>(
                  columnName: 'powerReactiveAvg',
                  value: (e.powerReactive / 1000).toStringAsFixed(2)),
              DataGridCell<String>(
                  columnName: 'powerApparentAvg',
                  value: (e.powerApparent / 1000).toStringAsFixed(2)),
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
