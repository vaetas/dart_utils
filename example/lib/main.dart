import 'package:dart_utils/dart_utils.dart';

void main() {
  print('Hello world');

  /*
  Sort list by date
  */
  final dateList = [
    DateTime.now(),
    DateTime.now().subtract(Duration(days: 2)),
    DateTime.now().subtract(Duration(days: 1)),
  ];

  print(dateList.sortedByDate((item) => item));
}
