import 'package:creche/core/networking/app_api.dart';
import 'package:creche/core/storage/app_storage.dart';
import 'package:creche/models/enfants_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

class HomeController extends GetxController {
  dio.Dio? _dio;
  @override
  void onInit() {
    _dio = dio.Dio();
    getEnfantsByParent();
    super.onInit();
  }

  List<EnfantsModel?>? enfantsModel;
  Future<List<EnfantsModel?>?> getEnfantsByParent() async {
    try {
      dio.Response response = await _dio!.get(
        "${AppApi.getEnfantsByParent}${AppStorage.readId()}",
      );
      if (response.statusCode == 200) {
        List<dynamic> responseData = response.data;

        enfantsModel =
            responseData.map((json) => EnfantsModel.fromJson(json)).toList();

        print("the response is $enfantsModel");
        return enfantsModel;
      }

      return null;
    } catch (e) {
      print("the error is $e");
    }
    return null;
  }
}
