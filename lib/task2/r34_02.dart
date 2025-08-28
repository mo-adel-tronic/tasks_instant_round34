void main() {
  print(solution([5, 2, 7, 4, 9], 5));
  print(solution([1, 2, 3, 4, 9], 6));
  print(solution([5, 5, 5], 4));
  print(solution([2, 3, 5], 7));
  print(solution([100], 1));
}

//ribbons : عدد الشرائط
//k  طول الشريط
int solution(List<int> ribbons, int k) {
  int result = 0;
  ribbons.sort();
  List<int> myResult = [];
  for (int i = ribbons.last; i > 0; i--) {
    int numOfdata = 0;
    ribbons.forEach((r) {
      //print("r = $r ,, i == $i ,, r/i= ${r / i}");
      if (r ~/ i > 0) {
        numOfdata += r ~/ i;
        //r~/i = (r/i).toInt()
      }
      //print("numOfData = $numOfdata");
    });
    if (numOfdata >= k) {
      result = i;
      break;
    }
  }
  return result;
}

//from ai
int solutionFromAI(List<int> ribbons, int k) {
  ribbons.sort();
  int left = 1;
  int right = ribbons.last; // largest ribbon
  int best = 0;

  while (left <= right) {
    int mid = (left + right) ~/ 2;

    // count how many ribbons of length mid we can cut
    int count = 0;
    for (int r in ribbons) {
      count += r ~/ mid;
    }

    if (count >= k) {
      best = mid; // mid is valid, try bigger
      left = mid + 1;
    } else {
      right = mid - 1; // mid is too big, try smaller
    }
  }

  return best;
}
