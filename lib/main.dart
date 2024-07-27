import 'package:flutter/material.dart';
import 'dictionary.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        // tabBarTheme: TabBarTheme(labelColor: Colors.black)
      ),
      home: SearchPage(),
    );
  }
}

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     double ScreenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: ScreenWidth * 0.2,
//         centerTitle: true,
//         elevation: 0.0,
//         backgroundColor: Colors.transparent,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(25),
//                   bottomRight: Radius.circular(25)),
//               gradient: LinearGradient(
//                   colors: [Colors.cyanAccent, Colors.cyan],
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter)),
//         ),
//         title: const Text(
//           "Image",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//       drawer: Drawer(
//         child: Container(
//           color: Colors.deepPurple[100],
//           // decoration: const BoxDecoration(
//           //     gradient: LinearGradient(
//           //         begin: Alignment.topCenter,
//           //         end: Alignment.bottomCenter,
//           //         colors: [Colors.white, Colors.cyanAccent])),
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               const DrawerHeader(
//                 child: Text("Menu"),
//               ),
//               ListTile(
//                 title: const Text("Home"),
//                 leading: const Icon(Icons.home),
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//               ),
//               const ListTile(
//                 title: Text("Rate app"),
//                 leading: Icon(Icons.star),
//               ),
//               const ListTile(
//                 title: Text("Share"),
//                 leading: Icon(Icons.share),
//               ),
//               const ListTile(
//                 title: Text("About"),
//                 leading: Icon(Icons.info),
//               ),
//             ],
//           ),
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: Container(
//           decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [Colors.white, Colors.cyanAccent, Colors.cyan])),
//           child: Align(
//             alignment: Alignment.center,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   width: 160,
//                   height: 160,
//                   padding: EdgeInsets.all(20.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(ScreenWidth * 0.05),
//                     color: Colors.red,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.8),
//                         offset: Offset(ScreenWidth * 0.02, ScreenWidth * 0.02),
//                         blurRadius: ScreenWidth * 0.06,
//                         spreadRadius: ScreenWidth * 0.005,
//                       ),
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.1),
//                         offset:
//                             Offset(-ScreenWidth * 0.02, -ScreenWidth * 0.02),
//                         blurRadius: ScreenWidth * 0.06,
//                         spreadRadius: ScreenWidth * 0.005,
//                       ),
//                     ],
//                   ),
//                   child: IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.android,
//                         size: 85,
//                       )),
//                 ),
//                 Container(
//                   width: 160,
//                   height: 160,
//                   padding: EdgeInsets.all(20.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(ScreenWidth * 0.05),
//                     color: Colors.blue,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.8),
//                         offset: Offset(ScreenWidth * 0.02, ScreenWidth * 0.02),
//                         blurRadius: ScreenWidth * 0.06,
//                         spreadRadius: ScreenWidth * 0.005,
//                       ),
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.1),
//                         offset:
//                             Offset(-ScreenWidth * 0.02, -ScreenWidth * 0.02),
//                         blurRadius: ScreenWidth * 0.06,
//                         spreadRadius: ScreenWidth * 0.005,
//                       ),
//                     ],
//                   ),
//                   child: IconButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (conext) => SearchPage()));
//                       },
//                       icon: Icon(
//                         Icons.search,
//                         size: 85,
//                       )),
//                 ),
//               ],
//             ),
//           )),
//     );
//   }
// }

// class TranslatorApp extends StatefulWidget {
//   const TranslatorApp({super.key});

//   @override
//   State<TranslatorApp> createState() => _TranslatorAppState();
// }

// class _TranslatorAppState extends State<TranslatorApp> {
//   translate() async {
//     GoogleTranslator translator = new GoogleTranslator();
//     try {
//       // if (formkey.currentState!.validate()) {
//       var translation =
//           await translator.translate(controller.text, from: 'auto', to: to);
//       // translator.baseUrl = "translate.google.cn";
//       setState(() {
//         data = translation.text.toString();
//         isloading = false;
//       });
//       if (from == '_ _' || to == '_ _') {
//         setState(() {
//           data = "Fail to translate";
//         });
//       }
//     } catch (error) {
//       print('Error translating: $error');
//       isloading = false;
//       SnackBar mysnackbar = SnackBar(
//         content: Text('Translation Error: $error'),
//         backgroundColor: Colors.red,
//         duration: const Duration(seconds: 5),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(mysnackbar);
//       setState(() {});
//     }
//   }

//   void playTranslatedText() async {
//     if (data.isNotEmpty) {
//       await play(to, data);
//     }
//     isspeaking = false;
//   }

//   Future play(String code, String text) async {
//     await flutterTts.setLanguage(code);
//     await flutterTts.setPitch(1);
//     await flutterTts.setVolume(1);
//     await flutterTts.setSpeechRate(0.6);
//     await flutterTts.speak(text);
//     flutterTts.setCompletionHandler(() {
//       setState(() {
//         isspeaking = false;
//       });
//     });
//     setState(() {
//       isspeaking = true;
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     controller.dispose();
//   }

//   @override
//   void initState() {
//     make();
//     super.initState();
//   }

//   make() async {
//     isAvaliable = await speech.initialize();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenwidth = MediaQuery.of(context).size.width;
//     double screenheight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white54,
//       body: Stack(
//         children: [
//           Image.asset(
//             'assets/3.jpg',
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: screenwidth * 0.072,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Container(
//                           padding: EdgeInsets.all(screenwidth * 0.048),
//                           margin: EdgeInsets.all(screenwidth * 0.005),
//                           height: screenheight * 0.15,
//                           width: screenwidth * 0.45,
//                           decoration: BoxDecoration(
//                               color: Colors.blueGrey.withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(10),
//                               border: Border.all(color: Colors.black)),
//                           child: Form(
//                             key: formkey,
//                             child: TextFormField(
//                               controller: controller,
//                               maxLines: null,
//                               minLines: null,
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return 'Please enter some text';
//                                 }
//                                 return null;
//                               },
//                               textInputAction: TextInputAction.done,
//                               decoration: const InputDecoration(
//                                   enabledBorder: InputBorder.none,
//                                   border: InputBorder.none,
//                                   errorBorder: InputBorder.none,
//                                   errorStyle: TextStyle(color: Colors.white)),
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: screenwidth * 0.04),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Flexible(
//                       child: Container(
//                         margin:
//                             EdgeInsets.symmetric(vertical: screenheight * 0.02),
//                         height: screenwidth * 0.12,
//                         width: screenheight * 0.5,
//                         decoration: BoxDecoration(
//                             gradient: const LinearGradient(
//                                 colors: <Color>[Colors.white60, Colors.grey]),
//                             borderRadius: BorderRadius.circular(10)),
//                         child: SingleChildScrollView(
//                           child: DropdownButton(
//                             value: selectedvalueFrom,
//                             focusColor: Colors.transparent,
//                             items: languages.map((lang) {
//                               int index = languages.indexOf(lang);
//                               to = languagescode[index];
//                               return DropdownMenuItem(
//                                 value: lang,
//                                 child: Text(
//                                   lang,
//                                   style: const TextStyle(color: Colors.black),
//                                 ),
//                                 onTap: () {
//                                   setState(() {});
//                                 },
//                               );
//                             }).toList(),
//                             onChanged: (value) {
//                               selectedvalueFrom = value!;
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Flexible(
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Container(
//                           padding: EdgeInsets.all(screenwidth * 0.048),
//                           margin: EdgeInsets.all(screenwidth * 0.005),
//                           height: screenwidth * 0.36, //150
//                           width: screenwidth * 0.9,
//                           decoration: BoxDecoration(
//                               color: const Color.fromARGB(255, 196, 17, 17)
//                                   .withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(10),
//                               border: Border.all(color: Colors.black)),
//                           child: Center(
//                             child: Text(
//                               data,
//                               style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         margin:
//                             EdgeInsets.symmetric(vertical: screenheight * 0.02),
//                         height: screenwidth * 0.12,
//                         width: screenwidth,
//                         decoration: BoxDecoration(
//                             gradient: const LinearGradient(colors: <Color>[
//                               Colors.white12,
//                               Colors.lightGreen,
//                             ]),
//                             borderRadius: BorderRadius.circular(10)),
//                         child: SingleChildScrollView(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               DropdownButton(
//                                 value: selectedvalueTo,
//                                 focusColor: Colors.transparent,
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold),
//                                 items: languages.map((lang) {
//                                   int index = languages.indexOf(lang);
//                                   to = languagescode[index];
//                                   return DropdownMenuItem(
//                                     value: lang,
//                                     child: Text(
//                                       lang,
//                                       style:
//                                           const TextStyle(color: Colors.black),
//                                     ),
//                                     onTap: () {
//                                       setState(() {
//                                         to = languagescode[index];
//                                         // print(lang);
//                                         // print(to);
//                                       });
//                                     },
//                                   );
//                                 }).toList(),
//                                 onChanged: (value) {
//                                   selectedvalueTo = value!;
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     AvatarGlow(
//                       animate: isspeaking,
//                       glowColor: Colors.lightGreen,
//                       child: IconButton(
//                           onPressed: () async {
//                             setState(() {
//                               isspeaking = false;
//                             });
//                             playTranslatedText();
//                             // setState(() {
//                             //   isspeaking = true;
//                             // });
//                           },
//                           color: Colors.greenAccent,
//                           icon: const Icon(Icons.volume_up)),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   width: screenwidth * 0.8,
//                   height: screenwidth * 0.13,
//                   child: ElevatedButton(
//                       onPressed: () async {
//                         await translate();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.indigo.shade900,
//                         side:
//                             BorderSide(width: 5, color: Colors.indigo.shade900),
//                         elevation: 3,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30)),
//                         padding: const EdgeInsets.all(15),
//                       ),
//                       child: isloading
//                           ? const SizedBox.square(
//                               dimension: 20,
//                               child: CircularProgressIndicator(
//                                 color: Colors.white,
//                               ),
//                             )
//                           : const Text(
//                               'Translate',
//                               style: TextStyle(color: Colors.white),
//                             )),
//                 ),
//                 SizedBox(
//                   height: screenwidth * 0.072,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: Padding(
//         padding: EdgeInsets.only(bottom: screenheight * 0.005),
//         child: AvatarGlow(
//           animate: isListening,
//           glowColor: Colors.green,
//           child: GestureDetector(
//             onTapDown: (details) {
//               setState(() {
//                 isListening = true;
//               });
//               if (isAvaliable) {
//                 speech.listen(
//                   onResult: (result) {
//                     setState(() {
//                       controller.text = result.recognizedWords;
//                     });
//                   },
//                 );
//               }
//             },
//             onTapUp: (details) {
//               setState(() {
//                 isListening = false;
//               });
//               speech.stop();
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.cyanAccent, shape: BoxShape.circle),
//               child: Padding(
//                 padding: EdgeInsets.all(screenheight * 0.03),
//                 child: Icon(
//                   isListening ? Icons.mic : Icons.mic_none,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
