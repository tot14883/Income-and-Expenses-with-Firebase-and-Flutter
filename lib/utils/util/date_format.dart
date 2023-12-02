import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:smart_money/utils/util/string_extension.dart';
import 'package:smart_money/widgets/custom_platform.dart';

class BaseDateFormatter {
  BaseDateFormatter._();

  static DateTime _convertToLocal(DateTime dateTime) {
    return CustomPlatform.isTest ? dateTime : dateTime.toLocal();
  }

  /// Format [DateTime] to 'HH:mm:ss'
  static String formatTime(DateTime date) {
    return DateFormat('HH:mm:ss').format(_convertToLocal(date));
  }

  /// Format [DateTime] to 'yyyy-MM-dd'
  static String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(_convertToLocal(date));
  }

  /// Format [DateTime] to 'yyyy-MM-dd HH:mm:ss'
  static String formatDateWithTime(DateTime date) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(_convertToLocal(date));
  }

  /// Format [DateTime] to 'dd MMM yy HH:mm'
  static String formatDateTimeWithNameOfMonth(
    DateTime date,
    String format, {
    String lang = 'en',
  }) {
    if (lang == 'th' || lang == 'TH') {
      final buddhistYear = DateTime(
        date.year + 543,
        date.month,
        date.day,
        date.hour,
        date.minute,
        date.second,
      );
      final buddhistDateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'")
          .format(_convertToLocal(buddhistYear));

      return DateFormat(format)
          .format(_convertToLocal(DateTime.parse(buddhistDateFormat)));
    }

    return DateFormat(format).format(_convertToLocal(date));
  }

  /// Format [DateTime] to 'dd/MM/yyyy HH:mm'
  static String formatDateWithDateTime(DateTime date) {
    return DateFormat('dd/MM/yyyy HH:mm').format(_convertToLocal(date));
  }

  /// Format [String] to [DateTime]
  static DateTime convertStringToDateTime(String date) {
    return _convertToLocal(DateFormat('yyyy-MM-dd').parse(date));
  }

  /// Format [DateTime] with timeZone to 'yyyy-MM-dd HH:mm:ss'
  static String formatDateWithTimeAndTimeZone(DateTime date) {
    final localDate = date.toLocal();
    final utcDate = date.toUtc();

    final currentTimeZone = CustomPlatform.isTest
        ? 7
        : (DateTime(
            localDate.year,
            localDate.month,
            localDate.day,
            localDate.hour,
            localDate.minute,
          ))
            .difference(
              DateTime(
                utcDate.year,
                utcDate.month,
                utcDate.day,
                utcDate.hour,
                utcDate.minute,
              ),
            )
            .inHours;
    return '${DateFormat('yyyy-MM-dd HH:mm:ss').format(date)} GMT${currentTimeZone >= 0 ? '+' : ''}$currentTimeZone';
  }

  static String formatDateWithFreeStyleFormat(
    String format,
    DateTime date, {
    bool isJiffyFormat = false,
  }) {
    if (isJiffyFormat) {
      return Jiffy.parse('$date').format(pattern: format);
    }

    return DateFormat(format).format(date);
  }

  static String formatDateWithSecond(DateTime date) {
    return DateFormat('dd MMM yyyy HH:mm:ss').format(_convertToLocal(date));
  }

  static String getDateGroupText(
    DateTime? start,
    DateTime? end,
  ) {
    if (start == null || end == null) return '';

    final startDate = formatDateWithFreeStyleFormat('dd MMM yyyy', start);
    final endDate = formatDateWithFreeStyleFormat('dd MMM yyyy', end);

    if (startDate == endDate) {
      return endDate;
    }

    final dayOfStartDate = startDate.split(' ')[0];

    return '$dayOfStartDate-$endDate';
  }

  /// Format [DateTime] to 'dd MM yyyy'
  static String formatDateToDisplayDate(DateTime date) {
    String format = "dd MMM yyyy";
    return DateFormat(format).format(_convertToLocal(date));
  }

  static DateTime formatStringToDate(
    String date,
    String splitChar,
  ) {
    final splitDate = date.split(splitChar);

    return DateTime(
        splitDate[2].pareInt, splitDate[1].pareInt, splitDate[0].pareInt);
  }
}
