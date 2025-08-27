//!الحل ده من chatgpt
//?بس انا حولت افهمه كويس بس في حجات مش فهمها اوي
//?فكره اني رافعه مش عشان بس محتاج اعرف لو في حل تاني عشان انا حولت فيها كتير بس موصلتش للحل المنصب و لو ممكن ناخد الفكره دي و نشرحها في المره الجايه
//?شكرا
int maximizeEqualRibbonLength(List<int> a, int k) {
  int low = 1;
  int high = a.reduce((curr, next) => curr > next ? curr : next);
  int result = 0;

  while (low <= high) {
    int mid = (low + high) ~/ 2;
    int pieces = a.fold(0, (sum, length) => sum + (length ~/ mid));
    print('mid11111111:$mid');
    print('p1111111111:$pieces');
    if (pieces >= k) {
      result = mid;
      print('mid: $mid');
      low = mid + 1; // try longer ribbon length
    } else {
      high = mid - 1; // try shorter ribbon length
    }
  }

  return result;
}

void main() {
  List<int> a = [5, 2, 7, 4, 9];
  int k = 5;
  print(maximizeEqualRibbonLength(a, k));
  // Output: 4
}
