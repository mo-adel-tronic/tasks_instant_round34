import 'dart:math';
void main() {

  print('Case 1:');
  print(solution([5, 2, 7, 4, 9], 5));
  print('Case 2:');
  print(solution([1, 2, 3, 4, 9], 6));
  print('Case 3:'); 
  print(solution([5, 5, 5], 4));
  print('Case 4:'); 
  print(solution([2, 3, 5], 7));
  print('Case 5:');
  print(solution([100], 1));



}

int solution(List<int> a, int k) {
  int left = 1;
  int right = a.reduce(max);
  int result = 0;

  while (left <= right) {
    int mid = (left + right) ~/ 2;
    int count = 0;
    for (int i = 0; i < a.length; i++) {
      count += a[i] ~/ mid;
   }
    if (count >= k) {
      result = mid;
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return result;
}