import 'package:flutter/material.dart';
import 'package:flutter_item_project/Model/ItemModel.dart';
import 'package:flutter_item_project/Views/MyHomePage.dart';

class MyHomePageState extends State<MyHomePage> {
  final _items = <ItemModel>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) => CheckboxListTile(
            title: Text(_items[index].nome),
            key: Key(_items[index].nome),
            value: _items[index].check,
            onChanged: (value) => setState(() {
                  _items[index].check = !_items[index].check;
                })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String inputText = "";
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Enter your input'),
                content: TextField(
                  onChanged: (value) {
                    inputText = value;
                  },
                  decoration: const InputDecoration(hintText: "Type something"),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _items.add(ItemModel(nome: inputText, check: false));
                      });
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: const Text('Submit'),
                  ),
                ],
              );
            },
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
