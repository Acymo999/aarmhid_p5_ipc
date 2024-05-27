import 'package:aarmhid_p5_ipc/views/formulario_de_datos.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Práctica 5'),
        ),
        body: formulario_de_datos(),
      ),
    ),
  );
}
