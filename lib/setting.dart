import 'package:flutter/material.dart';
import 'package:translater/variables.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Setting',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        centerTitle: false,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional(-0.9, 1),
              child: Text(
                'Volume',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.left,
              ),
            ),
            Slider(
                value: volume,
                min: 0.0,
                max: 1.0,
                label: 'Volume: $volume',
                onChanged: (value) {
                  setState(() {
                    volume = value;
                  });
                }),
            Align(
              alignment: AlignmentDirectional(-0.9, 0.9),
              child: Text(
                'Pitch',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.left,
              ),
            ),
            Slider(
                value: pitch,
                min: 0.5,
                max: 2.0,
                label: 'Pitch: $pitch',
                onChanged: (value) {
                  setState(() {
                    pitch = value;
                  });
                }),
            Align(
              alignment: AlignmentDirectional(-0.9, 0.9),
              child: Text(
                'Rate',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
                textAlign: TextAlign.left,
              ),
            ),
            Slider(
                value: rate,
                min: 0.0,
                max: 1.0,
                label: 'Rate: $rate',
                onChanged: (value) {
                  setState(() {
                    rate = value;
                  });
                }),
            // Align(
            //   alignment: AlignmentDirectional(-0.9, 0.9),
            //   child: Text(
            //     'Voice',
            //     style: TextStyle(
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //         fontStyle: FontStyle.italic),
            //   ),
            // ),
            // RadioListTile(
            //     value: Colors.blue,
            //     groupValue: _bgColor,
            //     title: Text('Male'),
            //     onChanged: (value) {}),
            // RadioListTile(
            //     value: Colors.blue,
            //     groupValue: _bgColor,
            //     title: Text('Female'),
            //     onChanged: (value) {})
          ],
        ),
      ),
    );
  }
}
