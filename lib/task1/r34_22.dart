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

void main() {
  print(solution([5,15,20], 10, 20 ));
}
