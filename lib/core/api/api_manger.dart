import 'package:islami/core/model/RadiosResponse.dart';
import 'package:islami/core/model/quran_radio.dart';
import 'package:dio/dio.dart';
class ApiManger{
  static const String baseUrl="mp3quran.net";
  static const String radioRoute="/api/v3/radios";
 static Future<List<QuranRadio>>getRadiosList()async{
    try{
      Uri uri=Uri.https(baseUrl,radioRoute,{
        "language" : "ar"
      });
      Dio dio=Dio();
      var response=await dio.getUri(uri);
      RadiosResponse radiosResponse=RadiosResponse.fromJson(response.data);
      return radiosResponse.radios??[];
    }catch(e){
      throw Exception(e);
    }
  }

}