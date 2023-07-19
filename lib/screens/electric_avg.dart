import 'package:MEWA/models/electric_avg.dart';
import 'package:flutter/material.dart';
import 'package:MEWA/data/data.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class ElectricAvgScreen extends StatefulWidget {
  ElectricAvgScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _ElectricAvgScreenState createState() => _ElectricAvgScreenState();
}

class _ElectricAvgScreenState extends State<ElectricAvgScreen> {
  List<ElectricAvg> _electricAvgReadings = <ElectricAvg>[];
  late ReadingsDataSource _electricAvgReadingsDataSource;

  @override
  void initState() {
    _electricAvgReadings = electricAvg;
    _electricAvgReadingsDataSource =
        ReadingsDataSource(readings: _electricAvgReadings);
    super.initState();
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

    if (waterReadings.isNotEmpty) {
      content = Column(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: SfDataGridTheme(
                data: SfDataGridThemeData(
                    headerColor: Color.fromARGB(255, 226, 226, 226)),
                child: SfDataGrid(
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
                    return details.rowIndex == 0 ? 70.0 : 49.0;
                  },
                  source: _electricAvgReadingsDataSource,
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
                        columnName: 'currentDemand',
                        label: Container(
                            padding: EdgeInsets.all(6.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Napięcie [V]',
                              softWrap: false,
                            ))),
                    GridColumn(
                        columnName: 'powerActiveDemand',
                        label: Container(
                            padding: EdgeInsets.all(6.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Moc czynna [kW]',
                            ))),
                    GridColumn(
                        columnName: 'powerApparentDemand',
                        label: Container(
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Moc pozorna [kVa]',
                            ))),
                  ],
                )),
          )),
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Zapotrzebowanie'),
        ),
        body: content);
  }
}

class ReadingsDataSource extends DataGridSource {
  ReadingsDataSource({required List<ElectricAvg> readings}) {
    _electricReadings = readings
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'date', value: e.timestamp.split(' ')[0]),
              DataGridCell<String>(
                  columnName: 'time', value: e.timestamp.split(' ')[1]),
              DataGridCell<double>(
                  columnName: 'currentDemand', value: double.parse((e.currentDemand).toStringAsFixed(2))),
              DataGridCell<double>(
                  columnName: 'powerActiveDemand', value: double.parse((e.powerActiveDemand / 1000).toStringAsFixed(2))),
              DataGridCell<double>(
                  columnName: 'powerApparentDemand',
                  value: double.parse((e.powerApparentDemand / 1000).toStringAsFixed(2))),
            ]))
        .toList();
  }

  List<DataGridRow> _electricReadings = [];

  @override
  List<DataGridRow> get rows => _electricReadings;

  void _addMoreRows(int count) {
    int startIndex =
            _electricReadings.isNotEmpty ? _electricReadings.length : 0,
        endIndex = startIndex + count;
    for (int i = startIndex; i < endIndex; i++) {
      _electricReadings.add(DataGridRow(cells: [
        DataGridCell<String>(
            columnName: 'date', value: electricAvg[i].timestamp.split(' ')[0]),
        DataGridCell<String>(
            columnName: 'time', value: electricAvg[i].timestamp.split(' ')[1]),
        DataGridCell<double>(
            columnName: 'currentDemand', value: double.parse((electricAvg[i].currentDemand).toStringAsFixed(2))),
        DataGridCell<double>(
            columnName: 'powerActiveDemand',
            value: double.parse((electricAvg[i].powerActiveDemand / 1000).toStringAsFixed(2))),
        DataGridCell<double>(
            columnName: 'powerApparentDemand',
            value: double.parse((electricAvg[i].powerApparentDemand / 1000).toStringAsFixed(2))),
      ]));
    }
  }

  @override
  Future<void> handleLoadMoreRows() async {
    await getElectricAvg(true);
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
