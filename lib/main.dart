import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final _gasolinaValorController = TextEditingController();
  final _alcoolValorController = TextEditingController();
  var _resultado = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Center(
          child: Text("Gasolina x Alcool"),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox.square(dimension: 30.0),
              const Text("Gasolina x Alcool"),
              const SizedBox.square(dimension: 10.0),
              Image.asset("assets/pump.png"),
              const SizedBox.square(dimension: 10.0),
              TextField(
                controller: _gasolinaValorController,
                decoration:
                    const InputDecoration(hintText: "Valor da gasolina"),
              ),
              const SizedBox.square(dimension: 10.0),
              TextField(
                controller: _alcoolValorController,
                decoration: const InputDecoration(hintText: "Valor do alcool"),
              ),
              const SizedBox.square(dimension: 10.0),
              TextButton(
                  child: const Text("Calcular"),
                  onPressed: () {
                    setState(() {
                      _resultado = "";
                      final calculado =
                          double.parse(_alcoolValorController.text.replaceAll(RegExp(r','), '.')) /
                              double.parse(_gasolinaValorController.text.replaceAll(RegExp(r','), '.'));
                      _resultado = calculado < 0.70
                          ? "abastecer com álcool"
                          : "abastecer com gasolina";
                    });
                  }),
              const SizedBox.square(dimension: 10.0),
              Text(_resultado),
              const SizedBox.square(dimension: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
