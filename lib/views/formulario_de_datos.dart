import 'package:flutter/material.dart';
import 'dart:developer' as dev;
import 'package:aarmhid_p5_ipc/views/info.dart';

class formulario_de_datos extends StatefulWidget {
  const formulario_de_datos({super.key});

  @override
  State<formulario_de_datos> createState() => _FormularioDeDatosState();
}

class _FormularioDeDatosState extends State<formulario_de_datos> {
  final _formKey = GlobalKey<FormState>();

  DateTime? date;
  String? name;
  String? phone;
  String? gender;

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tus datos'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nombre: $name'),
              Divider(),
              Text('Teléfono: $phone'),
              Divider(),
              Text('Fecha de Nacimiento: ${date ?? 'No date selected'}'),
              Divider(),
              Text('Género: $gender'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => info(
                      name: name!,
                      phone: phone!,
                      date: date!,
                      gender: gender!,
                    ),
                  ),
                );
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Formulario de Datos'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                label: Text('Nombre'),
                              ),
                              validator: (value) {
                                if (value?.isEmpty ?? true)
                                  return 'Faltan datos';
                                return null;
                              },
                              onSaved: (value) => name = value,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                label: Text('Teléfono'),
                              ),
                              validator: (value) {
                                if (value?.isEmpty ?? true)
                                  return 'Faltan datos';
                                return null;
                              },
                              onSaved: (value) => phone = value,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () async {
                                        date = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1999),
                                          lastDate: DateTime(2099),
                                        );

                                        if (date != null) {
                                          setState(() {});
                                        }
                                      },
                                      icon: const Icon(Icons.calendar_month,
                                          color: Colors.white),
                                      label: const Text(''),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.orange),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(1)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(" ${date ?? 'Faltan datos'}"),
                                  ],
                                ),
                                Text('Género:'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: RadioListTile<String>(
                                        title: const Text('O'),
                                        value: 'Otro',
                                        groupValue: gender,
                                        onChanged: (value) {
                                          setState(() {
                                            gender = value;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: RadioListTile<String>(
                                        title: const Text('F'),
                                        value: 'F',
                                        groupValue: gender,
                                        onChanged: (value) {
                                          setState(() {
                                            gender = value;
                                          });
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: RadioListTile<String>(
                                        title: const Text('M'),
                                        value: 'M',
                                        groupValue: gender,
                                        onChanged: (value) {
                                          setState(() {
                                            gender = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 45),
                    width: double.infinity,
                    child: Card(
                      color: Color.fromARGB(255, 109, 179, 255),
                      child: TextButton(
                        onPressed: () {
                          final formState = _formKey.currentState;
                          if (formState?.validate() ?? false) {
                            formState!.save();
                            _showConfirmationDialog();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Forma valida'),
                              ),
                            );
                            dev.log('$name - $phone - $date - $gender');
                          }
                        },
                        child: Text(
                          'Confirmar datos',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
