void main() {
  print('Case 1:');
  print(firstQ1(numbers: [8, 5, 6, 16, 5], left: 1, right: 3)); 
  print('Case 2:');
  print(firstQ1(numbers: [1, 2, 3, 4, 5], left: 1, right: 1)); 
  print('Case 3:');
  print(firstQ1(numbers: [10, 20, 30], left: 5, right: 10)); 
}

List<bool> firstQ1({
  required List<int> numbers,
  required int left,
  required int right,
}) {
  List<bool> result = [];
  for (int i = 0; i < numbers.length; i++) {
    bool found = false;
    for (int x = left; x <= right; x++) {
      if (numbers[i] == (i + 1) * x) {
        found = true;
      }
    }
    result.add(found);
  }
  return result;
}
 
