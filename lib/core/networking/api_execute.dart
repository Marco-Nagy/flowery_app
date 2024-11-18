import 'dart:async';

import 'common/api_result.dart';


Future<DataResult<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    var result = await apiCall.call();
    return Success(result);
  } on Exception catch (e) {
    return Fail(e);
  }
}