List<bool> solution(List<int> numbers, int left, int right) {
  List<bool> result = [];

  for (int i = 0; i < numbers.length; i++) {
    int number_of_index = i + 1;

    if (numbers[i] % number_of_index == 0) {
      int x = numbers[i] ~/ number_of_index;
      if (x >= left && x <= right) {
        result.add(true);
      } else {
        result.add(false);
      }
    } else {
      result.add(false);
    }
  }

  return result;
}

void main() {
  List<int> numbers = [8,5,6,16,5];
  int left = 1;
  int right = 3;

  print(solution(numbers, left, right)); // [false, false, true, false, true]
}
