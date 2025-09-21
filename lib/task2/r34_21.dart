void main() {
  print(maxRibbonLength([9, 7, 5], 3));
  print(maxRibbonLength([7, 5, 9], 4)); 
  print(maxRibbonLength([1, 2, 3], 10)); 
}
int maxRibbonLength(List<int> a, int k) {
  if (a.isEmpty) return 0;

  int maxLen = 0, total = 0;
  for (final x in a) {
    if (x > maxLen) maxLen = x;
    total += x;
  }
  if (total < k) return 0; 

  int hi = (total ~/ k);
  if (hi > maxLen) hi = maxLen;

  for (int L = hi; L >= 1; L--) {
    int pieces = 0;
    for (final x in a) {
      pieces += x ~/ L;
      if (pieces >= k) return L; 
    }
  }
  return 0;
}