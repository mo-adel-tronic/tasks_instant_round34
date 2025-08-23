void main() {
  // Test Case 1
  print(solution([5, 2, 7, 4, 9], 5)); // 4
  // Test Case 2
  print(solution([1, 2, 3, 4, 9], 6)); //2
  // Test Case 3
  print(solution([5, 5, 5], 4)); //2
  // Test Case 4
  print(solution([2, 3, 5], 7)); //1
  // Test Case 5
  print(solution([100], 1)); //100
}

int solution(List<int> a, int k) {
  if (a.isEmpty || k <= 0) return 0;

  int maxLen = a[0];

  for (int i = 1; i < a.length; i++) {
    if (a[i] > maxLen) {
      maxLen = a[i];
    }
  }
  //Another way :
  //int maxLen = a.reduce((m, x) => m > x ? m : x);

  for (int L = maxLen; L >= 1; L--) {
    int pieces = 0;

    for (int length in a) {
      pieces += length ~/ L;
    }

    if (pieces >= k) {
      return L;
    }
  }
  return 0;
}