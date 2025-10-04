import 'package:flutter/material.dart';

class VinegarCalculator extends StatefulWidget {
  @override
  _VinegarCalculatorState createState() => _VinegarCalculatorState();
}

class _VinegarCalculatorState extends State<VinegarCalculator> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _initialConcentrationController = TextEditingController();
  final TextEditingController _desiredConcentrationController = TextEditingController();
  final TextEditingController _finalVolumeController = TextEditingController();

  double? vinegarVolume;
  double? waterVolume;

  void calculate() {
    final double c1 = double.tryParse(_initialConcentrationController.text) ?? 0;
    final double c2 = double.tryParse(_desiredConcentrationController.text) ?? 0;
    final double v2 = double.tryParse(_finalVolumeController.text) ?? 0;

    if (c1 <= 0 || c2 <= 0 || v2 <= 0 || c2 >= c1) {
      setState(() {
        vinegarVolume = null;
        waterVolume = null;
      });
      return;
    }

    final v1 = (c2 * v2) / c1;
    final water = v2 - v1;

    setState(() {
      vinegarVolume = v1;
      waterVolume = water;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Калькулятор уксуса'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _initialConcentrationController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Начальная концентрация (%)',
                ),
              ),
              TextFormField(
                controller: _desiredConcentrationController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Желаемая концентрация (%)',
                ),
              ),
              TextFormField(
                controller: _finalVolumeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Итоговый объём (мл)',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculate,
                child: Text('Рассчитать'),
              ),
              SizedBox(height: 20),
              if (vinegarVolume != null && waterVolume != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Нужно уксуса: ${vinegarVolume!.toStringAsFixed(2)} мл'),
                    Text('Добавить воды: ${waterVolume!.toStringAsFixed(2)} мл'),
                  ],
                ),
              if (vinegarVolume == null && waterVolume == null)
                Text(
                  'Проверьте входные данные',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
