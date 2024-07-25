


import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit_exam2/api_service/dust.dart';


part 'api_service.g.dart';

@RestApi(baseUrl: "http://api.openweathermap.org/")
abstract class ApiService {

  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("data/2.5/air_pollution")
  Future<Dust> getDust(
    @Query("lat") double lat,
    @Query("lon") double lon,
    @Query("appid") String appid,
  );
}

























