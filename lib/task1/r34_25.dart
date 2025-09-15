List<bool> solution({
  required List<int> numbers,
  required int left,
  required int right,
}) {
  int i = 0;
  return numbers.map<bool>((item) {
    num x = item / (i + 1);
    i++;
    if ((x == x.toInt()) && x >= left && x <= right) {
      return true;
    }
    return false;
  }).toList();
}



void main() {
  print(solution(numbers: [8, 5, 6, 16, 5], left: 1, right: 3));
}
