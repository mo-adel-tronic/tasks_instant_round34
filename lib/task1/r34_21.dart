void main() {
  
  print(solution([8, 5, 6, 16, 5], 1, 3));
  // [false, false, true, false, true]


  print(solution([1, 2, 3, 4, 5], 1, 1));
  // [true, true, true, true, true]


  print(solution([10, 20, 30], 5, 10));
  // [true, true, true]
}
List<bool> solution(List<int> numbers, int left, int right) {
  List<bool> result = [];

  for (int i = 0; i < numbers.length; i++) {
    bool found = false; 
    for (int x = left; x <= right; x++) {
      if (numbers[i] == (i + 1) * x) { 
        found = true;
        break; 
      }
    }

    result.add(found);
  }

  return result;
}
