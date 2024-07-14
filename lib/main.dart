import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // URLs de las aplicaciones seleccionadas
  final List<String> appUrls = [
    "https://flutter.github.io/samples/gallery.html",
    "https://flutter.github.io/samples/material_3.html",
    "https://flutter.github.io/samples/flutter_maps_firestore.html",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecciona una aplicación'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _launchURL(appUrls[0]);
              },
              child: Text('App 1'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _launchURL(appUrls[1]);
              },
              child: Text('App 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _launchURL(appUrls[2]);
              },
              child: Text('App 3'),
            ),
          ],
        ),
      ),
    );
  }

  // Método para abrir la URL en un navegador externo
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir la URL: $url';
    }
  }
}
