import 'package:flutter/material.dart';

void main() {
  runApp(Ejercicio2());
}

class Ejercicio2 extends StatelessWidget {
  const Ejercicio2({super.key});

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
  final TextEditingController _velocidadAngularController = TextEditingController();

  double calcularDistancia(double w, double t) {
    return w * t;
  }

  void alerta(BuildContext context, double w) {
    double t = 25; 
    double distancia = calcularDistancia(w, t);
    String mensaje = 'La distancia recorrida es: ${distancia.toStringAsFixed(2)} rad';

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
          image: NetworkImage("https://images.pexels.com/photos/1257860/pexels-photo-1257860.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Ejercicio 2",
              style: TextStyle(fontSize: 30, color: Colors.redAccent, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _velocidadAngularController,
              decoration: InputDecoration(
                labelText: 'Ingrese la velocidad angular (w) en rad/s',
                filled: true,
                fillColor: Colors.white70,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
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
    return Center(
      child: ElevatedButton(
        onPressed: () {
          double w = double.tryParse(_velocidadAngularController.text) ?? 0.0;
          alerta(context, w);
        },
        child: Text("Calcular"),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          textStyle: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
