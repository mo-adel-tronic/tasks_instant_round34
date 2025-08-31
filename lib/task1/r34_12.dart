//First task on the git creat function return list boolean result
List<bool> solution(List<int> numbers, int left, int right) {
  //List include some integer
  //operator is: x=number[i]/(i+1)
  //variable is left will ckeck if this operator left<x<right
  //variable is right will ckeck if this operator left<x<right
  // final list return boolean value of operator
  List<bool> result = [];
  //for loop to check on all vaule of list

  for (int i = 0; i < numbers.length; i++) {
    double x = numbers[i] / (i + 1); // نحسب x
    if (x % 1 == 0 && x >= left && x <= right) {
      // x % 1 == 0 معناها عدد صحيح
      result.add(true);
    } else {
      result.add(false);
    }
  }
  return result;
}

void main() {
  print(solution([8, 5, 6, 16, 5], 1, 3));
}
