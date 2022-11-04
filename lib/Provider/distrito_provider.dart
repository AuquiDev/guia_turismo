//proveedor de informacion 


import 'package:flutter/material.dart';
import 'package:guia_turismo/Model/distrito_models.dart';
import 'package:http/http.dart' as http;

class DistritoProvider extends ChangeNotifier {
  String _baseUrl = 'api.sheety.co';
  String _apiKey = '12a3169e379e5a4e451a2007bf9529d7/distritosDeLaProvinciaDeUrubamba/distritos';

List<Distrito> distritoList = [];

 DistritoProvider(){
   print('distrito provider inicalizado');
   getDistritoprovider();
   
 }

 //otro metodo para ver los datos mapeados
 getDistritoprovider()async {
  //https://api.sheety.co/12a3169e379e5a4e451a2007bf9529d7/distritosDeLaProvinciaDeUrubamba/distritos
  var url = Uri.https(_baseUrl,'12a3169e379e5a4e451a2007bf9529d7/distritosDeLaProvinciaDeUrubamba/distritos',{
    'api_key': _apiKey
  });
  
  final response = await http.get(url);
  //decodificar la informacion y convertirlo a un Mapa
  final decodeData =  DistritoResponsive.fromJson(response.body);
  // print(decodeData.distritos[0].descripcion); 
  distritoList = decodeData.distritos;
  notifyListeners();//notifica a lo swidgets los cambios
 }
}