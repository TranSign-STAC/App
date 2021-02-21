// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://api.transign.co/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<TransignTextToSignLangResponse> textToSignLang(
      transignTextToSignLangRequest) async {
    ArgumentError.checkNotNull(
        transignTextToSignLangRequest, 'transignTextToSignLangRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data
        .addAll(transignTextToSignLangRequest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('translate/text/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TransignTextToSignLangResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<TransignTranslationHistoryResponse> getHistory(uuid) async {
    ArgumentError.checkNotNull(uuid, 'uuid');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'translate/history/?uuid=$uuid',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TransignTranslationHistoryResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<TransignGetFavoriteTranslationResponse> getFavorite(uuid) async {
    ArgumentError.checkNotNull(uuid, 'uuid');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'translate/favorite/?uuid=$uuid',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TransignGetFavoriteTranslationResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<TransignGetFavoriteTranslationResponse> toggleFavorite(
      transignToggleFavoriteTranslationRequest) async {
    ArgumentError.checkNotNull(transignToggleFavoriteTranslationRequest,
        'transignToggleFavoriteTranslationRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(transignToggleFavoriteTranslationRequest?.toJson() ??
        <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        'translate/favorite/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = TransignGetFavoriteTranslationResponse.fromJson(_result.data);
    return value;
  }
}
