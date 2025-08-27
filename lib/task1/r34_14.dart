
//! first problem on GitHub 

//? Analysis for the problem
/*
   ! inputs :
    list of int => numbers
    int left 
    int right
   ! process :
    int x = 1 , 2 , 3
    left <= x <= rigt
    i = 2
    6 = (2+1) * x 
    give true
   ! output :
    list of bool => result
*/

void main() {
  print('test case 1');
  print(
    solution(numbers: [8, 5, 6, 16, 5], left: 1, right: 3),
  ); // [false ,false , true , false , true]

  print('test case 2');
  print(
    solution(numbers: [1, 2, 3, 4, 5], left: 1, right: 1),
  ); // [true, true, true, true, true]
  print('test case 3');
  print(
    solution(numbers: [10, 20, 30], left: 5, right: 10),
  ); // [true, true, true]
}

// function 
List<bool> solution({
  required List<int> numbers,
  required int left,
  required int right,
}) {
  List<bool> result = [];
 // To loop over the list
  for (int i = 0; i < numbers.length; i++) {
    int divisor = i + 1; 
    if (numbers[i] % divisor == 0) { 
      // numbers[i] % divisor == 0 => Is numbers[i] divisible by (i+1) without leaving a remainder?
      int x = numbers[i] ~/ divisor; // Divide numbers[i] by divisor and take the exact integer result without fractions.
      if (left <= x && x <= right) {
      // left <= x && x <= right => Make sure that x is between the left and the right
        result.add(true);
        continue;
      }
    }
    result.add(false);
  }
  return result;
}
