import 'dart:developer';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controllerQuery;

  String query = "";

  @override
  void initState() {
    super.initState();
    _controllerQuery = TextEditingController();
    _controllerQuery.addListener(() {
      setState(() {
        query = _controllerQuery.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controllerQuery.clear();
    _controllerQuery.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const Text("Buscador de películas",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown)),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _controllerQuery,
              decoration: const InputDecoration(
                  labelText: "¿Qué película deseas buscar?"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/search',
                      arguments: {'query': query});
                },
                child: const Text("Buscar")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, '/history')},
        tooltip: 'Ver historial',
        child: const Icon(Icons.history),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
