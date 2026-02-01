import 'package:intl/intl.dart';

class DateHeaderFormat {
  static final dateHeaderFormat = DateFormat('EEE MMM dd HH:mm:ss').format(DateTime.now());
}