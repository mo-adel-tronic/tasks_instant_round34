void main(){
  
print(solution([8, 5, 6, 16, 5], 1, 3));
print(solution([1, 2, 3, 4, 5], 1, 1));
print(solution([10, 20, 30], 5, 10));
}

List<bool> solution (List<int> numbers, int left, int right){
  List <bool> result = [];
  
  for (int i = 0; i < numbers.length; i++){
      double x = numbers[i] / (i + 1);
      int convert = x.toInt();
      if (x == convert){
        if (left <= x && right >= x){
           result.add(true);
        }
        else{
          result.add(false);
        }
      }
      else{
        result.add(false);
      }
  }
  return result;
}
