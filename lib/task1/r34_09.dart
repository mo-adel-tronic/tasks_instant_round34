void main() {
 
  print(solution([8, 5, 6, 16, 5], 1, 3));
}

List<bool> solution(List<int> numbers, int left, int right) {
  List<bool> result = [];
  List<int> number = [];  
  for (int i = left; i <= right; i++) {
    number.add(i);
  }
  print(number);
  for (int i = 0; i < numbers.length; i++) {
    bool isNumBetween = false;
    number.forEach(
       (num) => {if (numbers[i] == (i + 1) * num) isNumBetween = true},
    );
    result.add(isNumBetween);
    print(result);
  }
  return result;
}
