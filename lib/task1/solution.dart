/*
! Input: List<int> numbers = [8, 5, 6, 16, 5], int left = 1, int right = 3
! Output: List<bool> result = [false, false, true, false, true]

! i = 2
? 6 = (2 + 1) * x
? 6 = 3x
? x = 6 / 3

1. loop number: {
  x = numbers[i] / (i + 1)
  if ((x == x.toInt()) && x >= left && x <= right) {
    result.add(true)
  } else {
    result.add(false)
  }
}
*/

List<bool> solution ({
  required List<int> numbers,
  required int left,
  required int right
}) {
  int i = 0;
  return numbers.map<bool>((item) {
    num x = item / (i + 1);
    i++;
    if (right <= left) throw Exception('invalid range');
    if ((x == x.toInt()) && x >= left && x <= right) {
      return true;
    }
    return false;
  }).toList();
}