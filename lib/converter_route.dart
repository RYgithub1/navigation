import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:task_04_navigation/unit.dart';



/// [ConverterRoute]
class ConverterRoute extends StatelessWidget {

  final Color color; // 変数定義、宣言は final TYPE 変数
  final List<Unit> units;  /// Units for this [Category].

  // color and units to not be null.
  const ConverterRoute({
    @required this.color,
    @required this.units,
  // }) : assert(units != null);  // 途中は;でなく,でクローズ
  })  : assert(color != null),
        assert(units != null);


  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++
  @override
  Widget build(BuildContext context) {
    // Here is just a placeholder for a list of mock units
    final unitWidgets = units.map((Unit unit) {
      return Container(
        color: color,  // Set the color for this Container

        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      );
    }).toList();



    return ListView(
      children: unitWidgets,
    );
  }
}
