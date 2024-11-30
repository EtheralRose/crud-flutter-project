import 'package:cuartapp/services/firebase_service.dart';
import 'package:flutter/material.dart';

class Update extends StatelessWidget {
  const Update(this.user,this.tur,this.date,this.uid,{super.key});
    final String user;
    final String tur;
    final String date; 
    final String uid;

  @override
  Widget build(BuildContext context) {
    TextEditingController usuario = TextEditingController(text: user);
    TextEditingController tour = TextEditingController(text: tur);
    TextEditingController fecha = TextEditingController(text: date);
  
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(58, 50, 139, 1),
        toolbarHeight: 70,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Actualiza los datos", style: TextStyle(
              fontWeight: FontWeight.bold
              ),
            ) 
          ],
        )
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(58, 50, 139, 1),
              Color.fromRGBO(103, 196, 133, 1),
            ]
          )
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,10,0,10),
              child: TextField(
                controller: usuario,
                style: const TextStyle(
                  fontSize: 19,
                  color: Colors.white
                ),
                decoration: const InputDecoration(
                  hintText: "Ingresa el nuevo usuario", hintStyle: TextStyle(
                    color: Color.fromARGB(136, 255, 255, 255)
                  ),
                  fillColor: Color.fromRGBO(17, 26, 39, 0.555),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: tour,
                style: const TextStyle(
                  fontSize: 19,
                  color: Colors.white
                ),
                decoration: const InputDecoration(
                  hintText: "Ingresa el nuevo tour", hintStyle: TextStyle(
                    color: Color.fromARGB(136, 255, 255, 255)
                  ),
                  fillColor: Color.fromRGBO(17, 26, 39, 0.555),
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: TextField(
                controller: fecha,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19
                ),
                decoration: const InputDecoration(
                  hintText: "Ingresa la nueva fecha", hintStyle: TextStyle(
                    color: Color.fromARGB(136, 255, 255, 255)
                  ),
                  fillColor: Color.fromRGBO(17, 26, 39, 0.555),
                  filled: true,
                ),
              ),
            ),
            ElevatedButton(onPressed: () async{
              await updateReserva(uid, usuario.text, tour.text, fecha.text).then((_){
                Navigator.pop(context);
                }
              ); 
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(160, 50),
              backgroundColor: const Color.fromARGB(255, 40, 59, 180),
            ),
            child: const Text("AGENDAR", 
                style: TextStyle(  
                  color: Colors.white,
                  fontSize: 18
                ), 
              )
            )
          ],
        ),
      )
    );
  }
}