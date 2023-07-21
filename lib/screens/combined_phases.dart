import 'package:MEWA/models/phase_readings.dart';
import 'package:flutter/material.dart';
import 'package:MEWA/data/data.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import 'package:syncfusion_flutter_datagrid_export/export.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column, Row;
import 'package:MEWA/utils/save_file.dart' as helper;

class CombinedPhasesScreen extends StatefulWidget {
  CombinedPhasesScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _CombinedPhasesScreenState createState() => _CombinedPhasesScreenState();
}

String _currentPhase = 'avg';

class _CombinedPhasesScreenState extends State<CombinedPhasesScreen> {
  List<PhaseReadings> _phases = <PhaseReadings>[];
  late PhasesDataSource _phasesDataSource;
  final GlobalKey<SfDataGridState> _key = GlobalKey<SfDataGridState>();

  @override
  void initState() {
    _phases = combinedPhasesAvg;
    _phasesDataSource = PhasesDataSource(phases: _phases);
    super.initState();
  }

  Future<void> exportDataGridToExcel() async {
    final Workbook workbook = _key.currentState!.exportToExcelWorkbook();
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();
    var fileName;
    if(_currentPhase == 'avg') fileName = 'srednia_faz.xlsx';
    if(_currentPhase == '1') fileName = 'faza_1.xlsx';
    if(_currentPhase == '2') fileName = 'faza_2.xlsx';
    if(_currentPhase == '3') fileName = 'faza_3.xlsx';

    await helper.saveAndLaunchFile(bytes, fileName);
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
          MaterialButton(
              color: Colors.blue,
              child: const Center(
                  child: Text('Export to Excel',
                      style: TextStyle(color: Colors.white))),
              onPressed: exportDataGridToExcel),
          Container(
              height: 550,
              decoration: BoxDecoration(color: Colors.white),
              child: SfDataGridTheme(
                  data: SfDataGridThemeData(
                      headerColor: Color.fromARGB(255, 226, 226, 226)),
                  child: SfDataGrid(
                    key: _key,
                    loadMoreViewBuilder: (context, loadMoreRows) {
                      Future<String> loadRows() async {
                        await loadMoreRows();
                        return Future<String>.value('Completed');
                      }

                      return FutureBuilder<String>(
                          initialData: 'loading',
                          future: loadRows(),
                          builder: (context, snapShot) {
                            if (snapShot.data == 'loading') {
                              return Container(
                                  height: 60.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: BorderDirectional(
                                          top: BorderSide(
                                              width: 1.0,
                                              color: Color.fromRGBO(
                                                  0, 0, 0, 0.26)))),
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation(
                                          Colors.deepPurple)));
                            } else {
                              return SizedBox.fromSize(size: Size.zero);
                            }
                          });
                    },
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
                  ))),
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 5),
            child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    _currentPhase = 'avg';
                    _phasesDataSource =
                        PhasesDataSource(phases: combinedPhasesAvg);
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
                        _phasesDataSource = PhasesDataSource(phases: phase1);
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
                        _phasesDataSource = PhasesDataSource(phases: phase2);
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
                        _phasesDataSource = PhasesDataSource(phases: phase3);
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

  void _addMoreRows(int count) {
    int startIndex = _combinedPhases.isNotEmpty ? _combinedPhases.length : 0,
        endIndex = startIndex + count;
    for (int i = startIndex; i < endIndex; i++) {
      _combinedPhases.add(DataGridRow(cells: [
        DataGridCell<String>(
            columnName: 'date',
            value: combinedPhasesAvg[i].timestamp.split(' ')[0]),
        DataGridCell<String>(
            columnName: 'time',
            value: combinedPhasesAvg[i].timestamp.split(' ')[1]),
        DataGridCell<double>(
            columnName: 'voltageAvg', value: combinedPhasesAvg[i].voltage),
        DataGridCell<double>(
            columnName: 'currentAvg', value: combinedPhasesAvg[i].current),
        DataGridCell<double>(
            columnName: 'powerActiveAvg',
            value: combinedPhasesAvg[i].powerActive),
        DataGridCell<double>(
            columnName: 'powerReactiveAvg',
            value: combinedPhasesAvg[i].powerReactive),
        DataGridCell<double>(
            columnName: 'powerApparentAvg',
            value: combinedPhasesAvg[i].powerApparent),
      ]));
    }
  }

  @override
  Future<void> handleLoadMoreRows() async {
    await getPhases(true);
    _addMoreRows(20);
    notifyListeners();
  }

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
