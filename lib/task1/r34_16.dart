void main(){
  print(solution(numbers: [8, 5, 6, 16, 5], left: 1, right: 3)); //output: [false,false, true, false, true]
}

/*
inputs:
 - List<int> numbers
 - int left
 - int right
process:
- number[0] 8  = (i 0 +1) * x , x = 8/(0+1) = 8
- int x = ? x between 1 to 3 = 1,2,3 -> left 1 <= x <= right 3, - if x not int and not in the range return fasle-
output:
 - List<bool> result
*/

List<bool> solution({
  required List<int> numbers,
  required int left,
  required int right,
}) { 
    List<bool> result = [];
    for(int i = 0; i<numbers.length; i++){
        double x = numbers[i]/(i+1);         // fomrula to get the x 
         if(x % 1 == 0 && x >= left && x <= right){ //ex: 5.0 % 1 → 0  no decimal part → it's an integer
                 result.add(true);
             }else{ result.add(false);}
    }
  return result;
}