import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/cardinfo.php')
abstract class ApiService extends ChopperService {

  @Get()
  Future<Response> getAllCards(@Query('num') int num);

  @Get()
  Future<Response> getMonsterCards(@Query('num') int num, @Query('type') String type);

  static ApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://db.ygoprodeck.com/api/v5',
      services: [
        _$ApiService(),
      ],
      interceptors: [HttpLoggingInterceptor()],
    );
    return _$ApiService(client);
  }
}