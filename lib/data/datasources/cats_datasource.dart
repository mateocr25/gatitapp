import 'package:dio/dio.dart';
import 'package:gatitapp/data/models/cat_model.dart';

abstract class CatsDataSource {
  Future<List<CatModel>> fetchCats();
  Future<String> fetchImage(String referenceId);
}

class CatsDataSourceImpl implements CatsDataSource {
  final Dio _dio;

  CatsDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<CatModel>> fetchCats() async {
    try {
      final response = await _dio.get("breeds");
      final jsonResponse = _validateResponse(response) as List;
      return jsonResponse.map((item) => CatModel.fromJson(item)).toList();
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  dynamic _validateResponse(Response response){
    if(response.statusCode! >= 200 && response.statusCode! < 300){
      return response.data;
    }
    throw Exception(response.toString());
  }

  @override
  Future<String> fetchImage(String referenceId) async{
    try {
      final response = await _dio.get("images/$referenceId");
      final Map<String, dynamic> jsonResponse = _validateResponse(response);
      return jsonResponse['url'];
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
