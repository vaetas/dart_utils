import 'package:dart_utils/dart_utils.dart';

void main() {
  print('Hello world');

  final dateList = [
    DateTime.now(),
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().subtract(Duration(days: 2)),
  ];

  print(dateList.sortByDate((item) => item));
}
