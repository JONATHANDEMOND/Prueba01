import 'package:flutter/material.dart';

void main() {
  runApp(Ejercicio1());
}

class Ejercicio1 extends StatelessWidget {
  const Ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
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
  final TextEditingController _alturaInicialController = TextEditingController();
  final TextEditingController _tiempoController = TextEditingController();

  double calcular(double hi, double t) {
    const double a = 20.0; // Aceleración media constante
    return hi + 0.5 * a * t * t;
  }

  void alerta(BuildContext context, double hi, double t) {
    double alturaFinal = calcular(hi, t);
    String mensaje;
    if (alturaFinal < 1000) {
      mensaje = 'Alerta: El lanzamiento ha fallado. Altura alcanzada: ${alturaFinal.toStringAsFixed(2)} m';
    } else {
      mensaje = 'Lanzamiento exitoso. Altura alcanzada: ${alturaFinal.toStringAsFixed(2)} m';
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Resultado"),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cerrar"),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Cuerpo(context),
    );
  }

  Widget Cuerpo(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://4kwallpapers.com/images/walls/thumbs_3t/15554.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Ejercicio 01",
              style: TextStyle(fontSize: 30, color: Colors.redAccent),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _alturaInicialController,
              decoration: InputDecoration(
                labelText: 'Ingrese la altura inicial  en metros',
                filled: true,
                fillColor: Colors.white70,
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _tiempoController,
              decoration: InputDecoration(
                labelText: 'Ingrese el tiempo  en segundos',
                filled: true,
                fillColor: Colors.white70,
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            BotonCalcular(context),
          ],
        ),
      ),
    );
  }

  Widget BotonCalcular(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        double hi = double.tryParse(_alturaInicialController.text) ?? 0.0;
        double t = double.tryParse(_tiempoController.text) ?? 0.0;
        alerta(context, hi, t);
      },
      child: Text("Calcular"),
    );
  }
}
