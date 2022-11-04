
import 'package:flutter/material.dart';
import 'package:guia_turismo/Model/recurso_model.dart';
import 'package:http/http.dart' as http;

class RecursosProvider extends ChangeNotifier {
  String _baseUrl = 'api.sheety.co';
  String _api_key = '12a3169e379e5a4e451a2007bf9529d7/distritosDeLaProvinciaDeUrubamba/recursos';
  
  List<Recurso> recursoList= [];
  RecursosProvider(){
    print('Recursos Provider inicializado');
    getRecursosProvider();
  }

  getRecursosProvider() async{
  //https://api.sheety.co/12a3169e379e5a4e451a2007bf9529d7/distritosDeLaProvinciaDeUrubamba/recursos
    var url = Uri.https(_baseUrl,'12a3169e379e5a4e451a2007bf9529d7/distritosDeLaProvinciaDeUrubamba/recursos',{
      'api_key': _api_key,
    });

    final response = await http.get(url);
    final decodeData = RecursoResponsive.fromJson(response.body);
    print(decodeData.recursos);
    recursoList = decodeData.recursos;
    notifyListeners();

  }
  
}