import 'package:flutter/material.dart';
import 'package:prueba_01/main.dart';

class Historial extends StatelessWidget {
  const Historial({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "",
      home:Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
      ),
      body: Cuerpo(context),
    );
  }
}
Widget Cuerpo(context) {
  return Center(
    child: Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage('https://st3.depositphotos.com/3776273/31936/i/600/depositphotos_319362956-stock-photo-man-pointing-showing-copy-space.jpg'), // Replace with the actual image URL
          ),
          const SizedBox(height: 20),
          const Text(
            'Número de Cuenta: 1234567890',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          const Text(
            'Valor Total de la Cuenta: \$1000.00',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            'Retiro: \$30',
            style: TextStyle(fontSize: 16, color: Colors.red),
          ),
          const Text(
            'Tipo: Impuestos',
            style: TextStyle(fontSize: 16, color: Colors.blue),
          ),
          const Text(
            'Saldo: \$450',
            style: TextStyle(fontSize: 16, color: Colors.green),
          ),
        ],
      ),
    ),
  );
}