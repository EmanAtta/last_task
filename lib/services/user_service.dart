import 'package:application_2/models/user_model.dart';
import 'package:dio/dio.dart';

class Dataservice {
  String url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<DataCompleted>> getDataComplted()async{

    List<DataCompleted> Datalist = [];
    final dio = Dio();
    final response = await dio.get(url);
    var data = response.data;
    data.forEach((jsonElement) {
      DataCompleted Data = DataCompleted.fromJson(jsonElement);
      Datalist.add(Data);
    });
    return Datalist;
  }
}
