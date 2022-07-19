import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _currentColor = Colors.blue;
  double _currentLightness = 1.0;
  final _controller = CircleColorPickerController(
    initialColor: Colors.blue,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: _currentColor,
          title: const Text('Circle color picker sample'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 48),
            Center(child: CircleColorPicker(
                size: Size(180, 180),
                strokeWidth: 12,
                controller: _controller,
                onChanged: (color) {
                  setState(() {});
                },
                onEnded: (color) {
                  var c = HSLColor.fromAHSL(1.0, color.hue, 1.0, 0.5);
                  setState(() {
                    _currentColor = c.toColor();
                    _currentLightness = color.lightness;
                  });
                },
                bound: (lightness) {
                  if (lightness > 0.99) return 0.99;
                  if (lightness < 0.01) return 0.01;
                  return lightness;
                },
                lightnessMinIcon: Icon(Icons.lightbulb_outline_rounded, size: 20,),
                lightnessMaxIcon: Icon(Icons.lightbulb_sharp, size: 20,),
                centerWidget: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(180),
                  child: Icon(Icons.offline_bolt_rounded, size: 50,),
                )
            ),
            ),
            Text(_currentLightness.toString())
          ],
        ),
      ),
    );
  }
}
