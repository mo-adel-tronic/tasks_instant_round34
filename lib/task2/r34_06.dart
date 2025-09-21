int maxribbon(List<int> a, int k) {
  bool canCut(int L) {
    int total = 0;
    for (int x in a) {
      total += x ~/ L; 
    }
    return total >= k;
  }

  int low = 1;
  int high = a.reduce((curr, next) => curr > next ? curr : next); 
  int best = 0;

  while (low <= high) {
    int mid = (low + high) ~/ 2;

    if (canCut(mid)) {
      best = mid;     
      low = mid + 1;  
    } else {
      high = mid - 1; 
    }
  }

  return best;
}

void main() {
  List<int> ribbons = [5, 2, 7, 4, 9];
  int k = 5;
  print(maxribbon(ribbons, k));
}
