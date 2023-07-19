import 'package:MEWA/models/water_readings.dart';
import 'package:flutter/material.dart';
import 'package:MEWA/data/data.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class WaterReadingsScreen extends StatefulWidget {
  WaterReadingsScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _WaterReadingsScreenState createState() => _WaterReadingsScreenState();
}

class _WaterReadingsScreenState extends State<WaterReadingsScreen> {
  List<WaterReadings> _waterReadings = <WaterReadings>[];
  late ReadingsDataSource _waterReadingsDataSource;

  @override
  void initState() {
    _waterReadings = waterReadings;
    _waterReadingsDataSource = ReadingsDataSource(readings: _waterReadings);
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
                  source: _waterReadingsDataSource,
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
                        columnName: 'pressureStatus',
                        label: Container(
                            padding: EdgeInsets.all(6.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Ciśnienie',
                              softWrap: false,
                            ))),
                    GridColumn(
                        columnName: 'diverterStatus',
                        label: Container(
                            padding: EdgeInsets.all(6.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Odchylacz',
                            ))),
                    GridColumn(
                        columnName: 'oilStatus',
                        label: Container(
                            padding: EdgeInsets.all(6.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Olej',
                              textAlign: TextAlign.center,
                            ))),
                    GridColumn(
                        columnName: 'waterStatus',
                        label: Container(
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Woda',
                            ))),
                    GridColumn(
                        columnName: 'waterLevel',
                        label: Container(
                            padding: EdgeInsets.all(6.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Poziom wody',
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ))),
                    GridColumn(
                        columnName: 'diverterPosition',
                        label: Container(
                            padding: EdgeInsets.all(6.0),
                            alignment: Alignment.center,
                            child: Text(
                              'Pozycja odchylacza',
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ))),
                  ],
                )),
          )),
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Odczyt Wody'),
        ),
        body: content);
  }
}

class ReadingsDataSource extends DataGridSource {
  ReadingsDataSource({required List<WaterReadings> readings}) {
    _waterReadings = readings
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'date', value: e.timestamp.split(' ')[0]),
              DataGridCell<String>(
                  columnName: 'time', value: e.timestamp.split(' ')[1]),
              DataGridCell<bool>(
                  columnName: 'pressureStatus', value: e.pressureStatus),
              DataGridCell<bool>(
                  columnName: 'diverterStatus', value: e.diverterStatus),
              DataGridCell<bool>(columnName: 'oilStatus', value: e.oilStatus),
              DataGridCell<bool>(
                  columnName: 'waterStatus', value: e.waterStatus),
              DataGridCell<int>(columnName: 'waterLevel', value: e.waterLevel),
              DataGridCell<int>(columnName: 'diverterPosition', value: e.diverterPosition),
            ]))
        .toList();
  }

  List<DataGridRow> _waterReadings = [];

  @override
  List<DataGridRow> get rows => _waterReadings;

  void _addMoreRows(int count) {
    int startIndex = _waterReadings.isNotEmpty ? _waterReadings.length : 0,
        endIndex = startIndex + count;
    for (int i = startIndex; i < endIndex; i++) {
      _waterReadings.add(DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'date', value: waterReadings[i].timestamp.split(' ')[0]),
              DataGridCell<String>(
                  columnName: 'time', value: waterReadings[i].timestamp.split(' ')[1]),
              DataGridCell<bool>(
                  columnName: 'pressureStatus', value: waterReadings[i].pressureStatus),
              DataGridCell<bool>(
                  columnName: 'diverterStatus', value: waterReadings[i].diverterStatus),
              DataGridCell<bool>(columnName: 'oilStatus', value: waterReadings[i].oilStatus),
              DataGridCell<bool>(
                  columnName: 'waterStatus', value: waterReadings[i].waterStatus),
              DataGridCell<int>(columnName: 'waterLevel', value: waterReadings[i].waterLevel),
              DataGridCell<int>(columnName: 'diverterPosition', value: waterReadings[i].diverterPosition),
            ]));
    }
  }

  @override
  Future<void> handleLoadMoreRows() async {
    await getWaterReadings(true);
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
