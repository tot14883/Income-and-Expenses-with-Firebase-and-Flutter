import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:dio/dio.dart';
import 'package:smart_money/utils/error/failure.dart';

abstract class UseCase<P, R> {
  Logger? _logger;
  Logger get logger {
    if (_logger != null) {
      return _logger!;
    }
    _logger = Logger(runtimeType.toString());
    return _logger!;
  }

  @protected
  Future<R> exec(P request);

  Future<Result<R, Failure>> execute(P request) async {
    try {
      final result = await exec(request);
      return Success(result);
    } on DioException catch (e) {
      logger.info('[DioError]');
      logger.info(e);

      if (e.response?.statusCode == 401) {}

      try {
        final data = e.response!.data;
        logger.info('e $data');

        return Error(
          Failure(
            message: data['message'],
            code: data['statusCode'],
          ),
        );
      } catch (e) {
        //do nothing
      }
    } on SocketException catch (e) {
      return Error(
        Failure(
          message: e.message,
        ),
      );
    }

    return Error(
      Failure(
        message: '',
      ),
    );
  }

  Stream<Result<R, Failure>> stream(P params) => execute(params).asStream();
}
