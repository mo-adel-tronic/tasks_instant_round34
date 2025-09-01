int solution(List<int> a, int k) {
  int left = 1;
  int right = a.reduce((curr, next) => curr > next ? curr : next);
  int answer = 0;
  while (left <= right) {
    int mid = (left + right) ~/ 2;
    int count = 0;
    for (int length in a) {
      count += length ~/ mid;
    }
    if (count >= k) {
      answer = mid;
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return answer;
}
void main() {
  print(solution([5, 2, 7, 4, 9], 5));
}
