import 'package:app/src/models/favorite_translation.dart';
import 'package:app/src/models/text_to_sign_lang.dart';
import 'package:app/src/models/translation_history.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

class Routes {
  static const String translate = "translate/";

  static const String textToSignLang = translate + "text";
  static const String history = translate + "history";
  static const String favorite = translate + "favorite";
}

@RestApi(baseUrl: "https://api.transign.co/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // @POST(Routes.textToSignLang)
  // Future<TransignTextToSignLangResponse> textToSignLang(
  //     @Body() TransignTextToSignLangRequest transignTextToSignLangRequest);

  @POST(Routes.textToSignLang)
  Future<TransignTextToSignLangResponse> textToSignLang(
      @Body() TransignTextToSignLangRequest transignTextToSignLangRequest);

  @GET(Routes.history + "?uuid={uuid}")
  Future<TransignTranslationHistoryResponse> getHistory(
      @Path("uuid") String uuid);

  @GET(Routes.favorite + "?uuid={uuid}")
  Future<TransignGetFavoriteTranslationResponse> getFavorite(
      @Path("uuid") String uuid);

  @POST(Routes.favorite)
  Future<TransignGetFavoriteTranslationResponse> setFavorite(
      @Body()
          TransignToggleFavoriteTranslationRequest
              transignToggleFavoriteTranslationRequest);
}
