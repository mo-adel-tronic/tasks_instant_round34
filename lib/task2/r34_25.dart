int Ribbon(List<int> ribbons, int k) {
  int maxLength = ribbons.reduce((a, b) => a > b ? a : b);

  for (int len = maxLength; len >= 1; len--) {
    int count = 0;

    for (int ribbon in ribbons) {
      count += ribbon ~/ len;
    }

    if (count >= k) {
      return len;
    }
  }
  return 0;
}

void main() {
  List<int> ribbons = [5, 2, 7, 4, 9];
  int k = 5;
  print(Ribbon(ribbons, k));
}
