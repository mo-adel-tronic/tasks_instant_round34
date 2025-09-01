void main() {
  print(
    solution(numbers: [1, 2, 3, 4, 5], left: 1, right: 1),
  ); //[true, true, true, true, true]
    print(
    solution(numbers:  [8, 5, 6, 16, 5],left:  1,right:  3),
  ); //[false, false, true, false, true]
}
//5=(1+1)*x 

//numbers[i] = (i + 1) * x
List<bool> solution({
  required List<int> numbers,
  required int left,
  required int right,
}) {
  List<bool> result = [];
  for (int i = 0; i < numbers.length; i++) {
    double x = numbers[i] / (i + 1);

    if (x % 1 == 0 && left <= x && x <= right) {
      result.add(true);
    } else {
      result.add(false);
    }
  }

  return result;
}
