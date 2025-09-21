int solution(List<int> x, int k) {
  int left = 1;
  int right = x.reduce((current, next) => current > next ? current : next);
  int result = 0;
  while (left <= right) {
    int mid = (left + right) ~/ 2;
    int count = 0;
    for (int length in x) {
      count += length ~/ mid;
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
void main() {
  print(solution([4, 2, 1,2,7],6));
}