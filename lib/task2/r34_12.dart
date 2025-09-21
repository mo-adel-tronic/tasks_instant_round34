List<int> a = [3, 5, 8, 9];
int key = 5;
solution(List<int> x, int key) {
  //اصغر طول نجرب عليه
  int low = 1;
  //هلف علي list علشان اقدر اجيب اكبر قيمة ودا اكبر طول اقدر اوصله
  int high = x.reduce(
    (curr, next) => curr > next ? curr : next,
  ); //max number of list
  //لتحزين الطول المناسب اللي هوصله
  int value = 0;
  for (int i = high; i > low; i--) {
    //الطول الوسط بين الادني والاكبر لو نفع ابدا ازود غير اقلل
    int mid = (low + high) ~/ 2;
    //map:بتاخد المصفوفة الاصلية وابدا اعدل علب كل قيمة قسمها علي mid وارجع مصفوفة تانيه بعد التعديل
    //reduce:هاخد ال list الجديدة وابدا اجمع عناصرها
    int num = a.map((x) => x ~/ mid).reduce((sum, val) => sum + val);
    if (num >= key) {
      //stored mid
      value = mid;

      //نجرب طول اكبر
      low = mid + 1;
    } else {
      //mid كبير
      high = mid - 1;
    }
  }
  return value;
}

void main() {
  print(solution([3, 5, 8, 9], 5));
}
