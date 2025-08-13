import 'package:task1/task1.dart' as task1;

  

import 'dart:io';

 
List<bool> solution(
    {required List<int> numbers, required int left, required int right}) {
  late List<bool> result = [];
  int x = 0;
  late bool boolresult;
  for (int i = 0; i <= numbers.length - 1; i++) {
    for (int j = left; j <= right; j++) {
      x = (i + 1) * j;
      if (x == numbers[i]) {
        boolresult = true;
        break;
      } else
        boolresult = false;
    }
    result.add(boolresult);
  }

  return result;
}

void main() {
  
  print(solution(numbers: [8,5,6,16,5], left: 1, right: 3));
  print(solution(numbers: [1, 2, 3, 4, 5], left: 1, right: 1));
  print(solution(numbers: [10, 20, 30], left: 5, right: 10));
  
  print('c[ewfew[pfwe]]');
 
}
 