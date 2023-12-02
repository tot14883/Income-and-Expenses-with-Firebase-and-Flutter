import 'dart:async';

import 'package:rxdart/rxdart.dart';

class _ActivityToken<T> {
  final Stream<T> source;

  _ActivityToken(this.source);
}

class ActivityIndicator extends Stream<bool> implements ValueStream<bool> {
  final BehaviorSubject<int> _loadingCounter = BehaviorSubject.seeded(0);

  Stream<bool> get stream => _loadingCounter.map((event) => event > 0);

  void increment() {
    _loadingCounter.add(_loadingCounter.value + 1);
  }

  void decrement() {
    _loadingCounter.add(_loadingCounter.value - 1);
  }

  void close() {
    _loadingCounter.close();
  }

  bool get isClosed => _loadingCounter.isClosed;

  @override
  StreamSubscription<bool> listen(void Function(bool event)? onData,
          {Function? onError, void Function()? onDone, bool? cancelOnError}) =>
      stream.listen(onData,
          onError: onError, onDone: onDone, cancelOnError: cancelOnError);

  @override
  Object get error => _loadingCounter.error;

  @override
  Object? get errorOrNull => _loadingCounter.errorOrNull;

  @override
  bool get hasError => _loadingCounter.hasError;

  @override
  bool get hasValue => _loadingCounter.hasValue;

  @override
  StackTrace? get stackTrace => _loadingCounter.stackTrace;

  @override
  bool get value => (_loadingCounter.value ?? 0) > 0;

  @override
  bool? get valueOrNull => (_loadingCounter.value ?? 0) > 0;
}

extension TrackActivity<T> on Stream<T> {
  Stream<T> trackActivity(ActivityIndicator _activityIndicator) {
    return UsingStream<T, _ActivityToken<T>>(() {
      return _ActivityToken(this);
    }, (token) {
      _activityIndicator.increment();
      return token.source;
    }, (d) {
      _activityIndicator.decrement();
    });
  }

  Stream<T> whereNotLoading(ActivityIndicator _activityIndicator) {
    return where((event) => _activityIndicator.value != true);
  }
}
