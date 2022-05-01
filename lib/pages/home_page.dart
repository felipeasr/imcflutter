import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados para o calculo";

  void _resetFields() {
    setState(() {
      weightController.text = "";
      heightController.text = "";
      _infoText = "Informe seus dados para o calculo";
    });
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(weightController.text); //peso
      double height = double.parse(heightController.text) / 100; //altura em cm
      double imc = weight / (height * height); //calculo do imc
      if (imc < 18.6) {
        _infoText =
            "Seu IMC é (${imc.toStringAsPrecision(4)}), isso quer dizer que está baixo do peso.";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText =
            "Seu IMC é (${imc.toStringAsPrecision(4)}), isso quer dizer que está no peso ideal.";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText =
            "Seu IMC é (${imc.toStringAsPrecision(4)}), isso quer dizer que está acima do peso.";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText =
            "Seu IMC é (${imc.toStringAsPrecision(4)}), isso quer dizer que está com obesidade grau 1.";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText =
            "Seu IMC é (${imc.toStringAsPrecision(4)}), isso quer dizer que está com obesidade grau 2.";
      } else if (imc >= 40.0) {
        _infoText =
            "Seu IMC é (${imc.toStringAsPrecision(4)}), isso quer dizer que está com obesidade grau 3.";
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Calculadora de IMG"),
      ),
      backgroundColor: Colors.green[400],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Icon(
                Icons.fitness_center_outlined,
                size: 120.0,
                color: Colors.white,
              ),
              TextFormField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                  icon: Icon(
                    Icons.boy_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: heightController,
                decoration: const InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                  icon: Icon(Icons.height_sharp, color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _calculate();
                },

                child: const Text(
                  "Calcular",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                // buttonStyle: TextStyle(color:  Colors.lightBlue[900]),
              ),
              ElevatedButton(
                onPressed: () {
                  _resetFields();
                },
                child: const Text(
                  "Limpar os dados",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                // buttonStyle: TextStyle(color:  Colors.lightBlue[900]),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(_infoText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 20.0)),
            ],
          ),
        ),
      ),
    );
  }
}
