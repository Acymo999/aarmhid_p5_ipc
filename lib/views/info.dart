import 'package:flutter/material.dart';

class info extends StatelessWidget {
  final String name;
  final String phone;
  final DateTime date;
  final String gender;

  const info({
    Key? key,
    required this.name,
    required this.phone,
    required this.date,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: orientation == Orientation.portrait
          ? _buildPortraitLayout()
          : _buildLandscapeLayout(),
    );
  }

  Widget _buildPortraitLayout() {
    return Center(
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            'lib/views/4644948.png',
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.yellow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Datos confirmados!',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  Text('Nombre: $name'),
                  Text('Teléfono: $phone'),
                  Text('Fecha de Nacimiento: ${date.toLocal()}'.split(' ')[0]),
                  Text('Género: $gender'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout() {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Datos confirmados!',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 10),
                Text('Nombre: $name'),
                Text('Teléfono: $phone'),
                Text('Fecha de Nacimiento: ${date.toLocal()}'.split(' ')[0]),
                Text('Género: $gender'),
              ],
            ),
          ),
          Image.asset(
            'lib/views/4644948.png',
            width: 150,
            height: 150,
          ),
        ],
      ),
    );
  }
}
