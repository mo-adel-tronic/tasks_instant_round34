// Maximize Equal Ribbon Length

/* 

!inputs:
list of integre => a
int k =  the required number of ribbons
!output:
int l => maximum possible integer length 

a = [5, 2, 7, 4, 9]
k = 5
l = 4

*/

//[7,8,9,,4]
int maxRibbon(List<int> a, int k) {
  // maximum elemnt ofthe list a 
  int maximumLenth = a.reduce((x, y) => x > y ? x : y);
  // store maximum lenth until now
  int LenthOfeachRibbon = 0;
  // We will try every possible length l from 1 up to the longest ribbon
  for (int l = 1 ; l <= maximumLenth; l++) {
    // The counter that will accumulate the total number of ribbons we can obtain with length l
    int sumOfribbon = 0;
    // for in loop iterates over the values themselves inside the list
    for (int lenth in a) {
      sumOfribbon += lenth ~/ l;
    }
    // if we can get at least k ribbons of length l => then this length is valid
    if (sumOfribbon >= k) {
      LenthOfeachRibbon = l;
    }
  }
  return LenthOfeachRibbon;
}

void main() {
  print('test case 1');
  print(maxRibbon([5, 2, 7, 4, 9] , 5)); // => 4

  print('test case 2');
  print(maxRibbon([1, 2, 3, 4, 9], 6)); // => 2

  print('test case 3');
  print(maxRibbon([5, 5, 5], 4)); // => 2

  print('test case 4');
  print(maxRibbon([2, 3, 5], 7)); // => 1

  print('test case 5');
  print(maxRibbon([100], 1)); // => 100
}

