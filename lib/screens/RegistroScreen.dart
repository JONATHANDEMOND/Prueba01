
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba_01/screens/LoginScreen.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Registro());
}
class Registro extends StatelessWidget {
  const Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
        title: const Text("REGISTRO"),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context){
  return Container(
    padding: EdgeInsets.all(10),
    child: (
      Column(
        children: <Widget>[
          const Text("REGISTRO"),
        
          CampoCorreo(context),
          CampoContrasenia(context),
          BotonGuardar(context)
        ],
      )
      
    ),
  );
}
final TextEditingController _correo = TextEditingController();

Widget CampoCorreo(context){
  return Container(
    padding: EdgeInsets.all(10),
    child: (
      TextField(
        controller: _correo,
      decoration: const InputDecoration(
        hintText: "Ingrese Correo"),
    )
    
    ),
  );
}
/*final TextEditingController _nick = TextEditingController();
Widget CampoNickName(context){
  return Container(
    padding: EdgeInsets.all(10),
    child: (
      TextField(
        controller: _nick,
      decoration:  InputDecoration(
        hintText: "Ingrese NickName"),
    )
    
    ),
  );
}*/
final TextEditingController _contrasenia= TextEditingController();
Widget CampoContrasenia(context){
   return Container(
    padding: EdgeInsets.all(10),
     child: (
    TextField(
        controller: _contrasenia,
      decoration: const InputDecoration(
        hintText: "Ingrese Contraseña"),
       )
     
       ),
   );
}
Widget BotonGuardar(context){
  return(
    ElevatedButton(onPressed: (){ registro(context);
      
    }, child: const Text("Registro"))
  );

}

Future<void> registro(context) async {
  try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: _correo.text,
    password: _contrasenia.text,
  );
  //////////////navegacion///
    Navigator.push(context,MaterialPageRoute(builder: (context)=> Login()));

} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
    alert01(context, const Text("La contraseña es muy debil"), const Text("Ingrese una contraseña fuerte"));
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
    alert02(context, const Text("ERROR"), const Text("LA CUENTA YA EXISTE"));
  }
} catch (e) {
  print(e);
}
}
////////////////alertas//////////////faltan
///
///
 void alert01(BuildContext context, Widget title, Widget content) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: title,
        content: content,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}
void alert02(BuildContext context, Widget title, Widget content) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: title,
        content: content,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
            },
            child: const Text("Sí"),
          ),
          TextButton(
            onPressed: () {
              print("Aquí debería ir una función (NO)");
              Navigator.pop(context);
            },
            child: const Text("No"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: const Text("Cancelar"),
          ),
        ],
      );
    },
  );
}