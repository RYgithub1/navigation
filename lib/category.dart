import 'package:flutter/material.dart';
import 'package:meta/meta.dart';  // @required is defined in the meta.dart package

import 'package:task_04_navigation/converter_route.dart';
import 'package:task_04_navigation/unit.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);



/// [Category] widget : Tapping [InkWell]
class Category extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;

  /// Creates a [Category] -> assert statement.
  const Category({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        assert(units != null),
        super(key: key);


  /// Navigates to the [ConverterRoute].
  void _navigateToConverter(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ConverterRoute(
        // units: [],  // リストの初期化をする必要ない、そのまま渡す
        units: units,
        color: color,  // 引数の数同じに。colorもConverterRoute()クラスに渡す
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: color,
          splashColor: color,
          // call _navigateToConverter()
          onTap: () {
            print('I was tapped!');
            // _navigateToConverter();  // 要context
            _navigateToConverter(context);  // ここ：要context。現在の文脈、状況を次画面に渡すため
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    iconLocation,
                    size: 60.0,
                  ),
                ),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
