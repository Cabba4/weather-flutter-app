import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  List? todoData;

  @override
  void initState() {
    // we do this at the first load of this forecast screen
    super.initState();
    fetchTodoList();
  }

  void fetchTodoList() async {
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      setState(() {
        todoData = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(Object context) {
    return Scaffold(
        appBar: AppBar(
            title:
                Text("Weather Forecast screen (list view to be implemented")),
        body: todoData != null
            ? ListView.separated(
                itemCount: todoData!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 50,
                      color:
                          Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(1.0),
                      child: Center(child: Text(todoData![index]["title"])));
                },
                separatorBuilder: (BuildContext context, index) =>
                    const Divider(),
              )
            : const Text("Waiting for data"));
  }
}
