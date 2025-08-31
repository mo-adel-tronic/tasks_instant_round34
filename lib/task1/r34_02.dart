void main() {
  //print(solution([10, 20, 30], 5, 10));
  //print(solution([1, 2, 3, 4, 5], 1, 1));
  print(solution([8, 5, 6, 16, 5], 1, 3));
}

List<bool> solution(List<int> numbers, int left, int right) {
  List<bool> result = [];
  List<int> xNumbers = []; //[left,...,right];
  for (int i = left; i <= right; i++) {
    xNumbers.add(i);
  }
  print(xNumbers);
  for (int i = 0; i < numbers.length; i++) {
    bool isNumBetween = false;
    xNumbers.forEach(
      // ignore: unnecessary_set_literal
      (num) => {if (numbers[i] == (i + 1) * num) isNumBetween = true},
    );
    result.add(isNumBetween);
    print(result);
  }
  return result;
}
