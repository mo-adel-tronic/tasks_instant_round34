int solution(List<int> a, int k) {
  int left = 1;
  int right = a.reduce((x, y) => x > y ? x : y);
  int maxLength = 0;

  while (left <= right) {
    int mid = left + (right - left) ~/ 2;
    int count = 0;

    for (int length in a) {
      count += length ~/ mid;
    }

    if (count >= k) {
      maxLength = mid;
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }

  return maxLength;
}

void main() {
  print(solution([5, 2, 7, 4, 9], 5)); 
  print(solution([1, 2, 3, 4, 9], 6)); 
  print(solution([5, 5, 5], 4)); 
  print(solution([2, 3, 5], 7)); 
  print(solution([100], 1)); 
}