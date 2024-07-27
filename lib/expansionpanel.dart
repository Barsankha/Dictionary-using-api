import 'package:flutter/material.dart';
import 'package:translater/variables.dart';
import 'package:translator/translator.dart';

class MyWidget extends StatefulWidget {
  final String keyString;
  final dynamic value;
  final String code;

  MyWidget({required this.keyString, required this.value, required this.code});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final translator = GoogleTranslator();
  late Future<String> translationFuture;
  bool _isExpanded = true;
  bool _istranslate = false;

  @override
  void initState() {
    super.initState();
    translationFuture = translate(widget.keyString, widget.code);
  }

  Future<String> translate(String text, String code) async {
    try {
      var translation = await translator.translate(text, from: 'en', to: code);
      setState(() {
        _istranslate = true;
      });
      return translation.text.toString();
    } catch (error) {
      setState(() {
        _istranslate = false;
      });
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          dividerColor: Colors.teal,
          elevation: 2,
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return FutureBuilder<String>(
                  future: translationFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                          child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ));
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return ListTile(
                        title: Row(
                          children: [
                            Text(
                              widget.keyString,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text('(${snapshot.data})')
                          ],
                        ),
                      );
                    }
                  },
                );
              },
              canTapOnHeader: true,
              body: FutureBuilder<String>(
                future: translate(widget.value, code),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(strokeWidth: 1));
                  } else if (snapshot.hasError) {
                    return Text('Error:${snapshot.error}');
                  } else {
                    return ListTile(
                      title: Text(widget.value),
                    );
                  }
                },
              ),
              isExpanded: _isExpanded,
            ),
          ],
        ),
      ),
    );
  }
}
