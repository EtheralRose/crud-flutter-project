import 'package:cuartapp/screens/create.dart';
import 'package:cuartapp/screens/update.dart';
import 'package:cuartapp/services/firebase_service.dart';
import 'package:flutter/material.dart';

class Read extends StatefulWidget {
  const Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(58, 50, 139, 1),
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Reservas", style: TextStyle(
              fontWeight: FontWeight.bold
              ),
            ),
            InkWell(onTap: () async {
              await Navigator.push(context, MaterialPageRoute(builder: (context)=> Create())).then((_){setState((){});});
            },
            child: const Icon(Icons.add, size: 40,) 
            )
          ],
        )
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
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
        child: const Reservas(),
      ) 
    );
  }
}

class Reservas extends StatefulWidget {
  const Reservas({
    super.key,
  });

  @override
  State<Reservas> createState() => _ReservasState();
}

class _ReservasState extends State<Reservas> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getReserva(), 
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index){
              return Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(17, 26, 39, 0.726),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                margin: const EdgeInsets.fromLTRB(25,5,25,5),
                padding: const EdgeInsets.fromLTRB(0,7,0,7),
                child: Column(
                  children: [
                    ListTile(
                      onTap: () async{
                        await Navigator.push(context, MaterialPageRoute(builder: (context)=> Update(
                              snapshot.data?[index]["Usuario"],
                              snapshot.data?[index]["Tour"],
                              snapshot.data?[index]["Fecha"],
                              snapshot.data?[index]["uid"]
                            )
                          )
                        ).then((_){setState((){});});
                      },
                      onLongPress: () async {
                        DeleteConfirm(context,
                          snapshot.data?[index]["Usuario"],
                          snapshot.data?[index]["Tour"],
                          snapshot.data?[index]["Fecha"],
                          snapshot.data?[index]["uid"]
                        );
                      },
                      title: Column(
                        children: [
                          Text(snapshot.data?[index]["Usuario"], style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            ),
                          ),
                          Text(snapshot.data?[index]["Tour"], style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            ),
                          ),
                          //Pendiente buscar como pasar timestamp a texto -.-
                          Text(snapshot.data?[index]["Fecha"], style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            ),
                          )
                        ],
                      ),
                    ), 
                  ],
                )
              ); 
            },
          );
        } 
        else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

void DeleteConfirm (BuildContext context,String usuario,String tour,String fecha,String uid){
  showDialog(context: context, 
  builder: (BuildContext){
    return AlertDialog(
      backgroundColor: const Color.fromRGBO(17, 26, 39, 1),
      title: const Text("Borrar reserva",style: TextStyle(
        color: Color.fromARGB(255, 250, 250, 250),
        fontSize: 25
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Estas a punto de borrar esta reserva:",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 250, 250, 250),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("\n$usuario",
                  style: const TextStyle(
                    fontSize: 19,
                    color: Color.fromARGB(255, 250, 250, 250),
                  ),  
                ),
                Text(tour,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 250, 250, 250),
                  ),  
                ),
                Text("$fecha\n",
                  style: const TextStyle(
                    fontSize: 19,
                    color: Color.fromARGB(255, 250, 250, 250),
                  ),  
                ),
              ],
            ),
            
          ),
          const Text("\n¿Deseas continuar?",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 250, 250, 250),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () async{
          await deleteReserva(uid).then((_){
            Navigator.pop(context);
            }
          );
        }, 
          child: const Text("Borrar", style: TextStyle(
              color: Colors.red,
              fontSize: 15
            ),
          )
        ),
        TextButton(onPressed: (){
          Navigator.pop(context);
        },
          child: const Text("Cancelar", style: TextStyle(
              fontSize: 15
            ),
          )
        ),
      ],
    );
  });
}