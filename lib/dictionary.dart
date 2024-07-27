import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:translater/setting.dart';
import 'package:translater/variables.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translater/expansionpanel.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Map<String, dynamic>? _wordData = {};
  FlutterTts flutterTts = FlutterTts();
  List<String> SynonymsText = [];
  List<String> AntonymsText = [];
  Future<void> fetchData(String query) async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(
        Uri.parse('https://api.dictionaryapi.dev/api/v2/entries/en/$query'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _wordData = data[0];
        isLoading = false;
      });
    } else {
      setState(() {
        _wordData = 'Error:${response.statusCode}' as Map<String, dynamic>?;
        isLoading = false;
      });
    }
  }

  Future<void> play(String text) async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(pitch);
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    // await flutterTts.speak(text);
    flutterTts.setCompletionHandler(() {
      setState(() {
        isspeaking = false;
      });
    });
    flutterTts.setCancelHandler(() {
      setState(() {
        isspeaking = false;
      });
    });
    flutterTts.setPauseHandler(() {
      setState(() {
        isspeaking = false;
      });
    });
    if (!isspeaking) {
      setState(() {
        isspeaking = true;
      });
      await flutterTts.speak(text);
    } else {
      setState(() {
        isspeaking = false;
      });
      await flutterTts.stop();
    }
  }

  String _extractedFRomWordData(Map<String, dynamic> wordData) {
    String text = '';
    text += wordData['word'] + '\n';
    if (wordData.containsKey('phonetic')) {
      text += 'Phonetic:${wordData['phonetic']}\n';
    }
    if (wordData.containsKey('origin')) {
      text += 'Origin:${wordData['origin']}\n';
    }
    for (var meaning in wordData['meanings']) {
      text += 'Part ofSpeech:${meaning['partOfSpeech']}\n';
      for (var definition in meaning['definitions']) {
        text += 'Definition:${definition['definition']}\n';
        if (definition['example'] != null) {
          text += 'Example:${definition['example']}\n';
        }
        if (definition['synonyms'] != null &&
            (definition['synonyms'] as List).isNotEmpty) {
          text += 'Synonyms:${definition['synonyms']}\n';
        }
        if (definition['antonyms'] != null &&
            (definition['antonyms'] as List).isNotEmpty) {
          text += 'Antonyms:${definition['antonyms']}\n';
        }
      }
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        backgroundColor: Color.fromARGB(255, 203, 182, 241),
        title: Text(
          "WordPedia",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(45),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 12.0, bottom: 11.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: Colors.white,
                  ),
                  child: TextField(
                    onSubmitted: (value) {
                      fetchData(value);
                    },
                    controller: textEditingController,
                    decoration: InputDecoration(
                        hintText: "Search...",
                        contentPadding: EdgeInsets.only(left: 24.0),
                        border: InputBorder.none),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (textEditingController.text.isNotEmpty) {
                    fetchData(textEditingController.text);
                  }
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple[100]),
              child: CircleAvatar(),
            ),
            ListTile(
              title: Text('Setting'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
              },
            ),
            ListTile(
              title: Text('Share'),
              leading: Icon(Icons.share),
            ),
            ListTile(
              title: Text('Rate the App'),
              leading: Icon(Icons.star),
            )
          ],
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  if (_wordData!.isNotEmpty) ...[
                    Text(
                      'Word: ${_wordData?['word']}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            String text = _extractedFRomWordData(_wordData!);
                            await play(text);
                          },
                          icon: isspeaking
                              ? Icon(Icons.pause)
                              : Icon(Icons.volume_up),
                        ),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: languagesMap.length,
                                  itemBuilder: (BuildContext context, index) {
                                    final String langusgeCode =
                                        languagesMap.keys.elementAt(index);
                                    final String languagesName =
                                        languagesMap.values.elementAt(index);
                                    return ListTile(
                                      title: Text(languagesName),
                                      onTap: () {
                                        setState(() {
                                          code = langusgeCode;
                                        });
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.language),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    if (_wordData!.containsKey('phonetic'))
                      Text(
                        'Phonetic:${_wordData?['phonetic']}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    SizedBox(
                      height: 5,
                    ),
                    if (_wordData!.containsKey('origin'))
                      MyWidget(
                        keyString: 'Origin',
                        value: _wordData?['origin'],
                        code: code,
                      ),
                    for (var meaning in _wordData!['meanings'])
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyWidget(
                            keyString: 'Part Of Speech',
                            value: meaning?['partOfSpeech'],
                            code: code,
                          ),
                          for (var definition in meaning['definitions'])
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyWidget(
                                  keyString: 'Definition',
                                  value: definition?['definition'],
                                  code: code,
                                ),
                                if (definition['example'] != null)
                                  MyWidget(
                                    keyString: 'Example',
                                    value: definition['example'],
                                    code: code,
                                  ),
                                if (definition['synonyms'] != null &&
                                    (definition['synonyms'] as List).isNotEmpty)
                                  //synonymsText = List<String>.from(definition['synonyms']);
                                  MyWidget(
                                      keyString: 'Synonyms',
                                      value: definition['synonyms'],
                                      code: code),
                                if (definition['antonyms'] != null &&
                                    (definition['antonyms'] as List).isNotEmpty)
                                  MyWidget(
                                      keyString: 'Antonyms',
                                      value: definition['antonyms'],
                                      code: code),
                              ],
                            )
                        ],
                      )
                  ]
                ]),
              ),
            ),
    );
  }
}
