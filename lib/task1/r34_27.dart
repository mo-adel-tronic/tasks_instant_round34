List<bool> solution(List<int> numbers, int left, int right) {
  List<bool> result = [];

  for (int i = 0; i < numbers.length; i++) {
    int index = i + 1;

    if (numbers[i] % index == 0) {
      int x = numbers[i] ~/ index;

      bool isInRange = x >= left && x <= right;
      result.add(isInRange);
    } else {
      result.add(false);
    }
  }

  return result;
}
