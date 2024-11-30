import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore Database = FirebaseFirestore.instance;

//Read
Future<List> getReserva() async{
  List Reserva =[];
  CollectionReference collectionReserva = Database.collection("Reserva");
  
  QuerySnapshot QueryReserva = await collectionReserva.get(); 

  for (var documento in QueryReserva.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String,dynamic>;
    final dato ={
      "Usuario": data["Usuario"],
      "Tour": data["Tour"],
      "Fecha": data["Fecha"],
      "uid": documento.id
    };
    Reserva.add(dato);
  }

  return Reserva;
}

//Create
Future<void> addReserva(String usuario, String tour, String fecha) async{
  await Database.collection("Reserva").add({"Usuario": usuario, "Tour": tour, "Fecha": fecha});
}

//Update
Future<void> updateReserva(String uid, String newUsuario, String newTour, String newFecha ) async{
  await Database.collection("Reserva").doc(uid).set({"Usuario": newUsuario, "Tour": newTour, "Fecha": newFecha});
}

//Delete
Future<void> deleteReserva(String uid) async{
  await Database.collection("Reserva").doc(uid).delete();
}