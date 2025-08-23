void main() {
  isBetween([8, 5, 6, 16, 5], 1, 3);
}

List<bool> isBetween(List<int> numbers, int left, int right) {
  List<bool> result = [];
  var x;
  for (int i = 0; i < numbers.length; i++) {
    x = (numbers[i] / (i + 1));
    print(x);
    if (right <= left) throw Exception('invalid range');
    if (x == x.toInt()) {
      if (x >= left && x <= right) {
        result.add(true);
      }else{
        result.add(false);
      }
    }else{
      result.add(false);
    }
  }
  print(result);
  return result;
}
