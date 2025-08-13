List <bool> solution({required int left,required int right , required List <int>numbers }){
  List<bool> result = [];
  for(int i=0;i<numbers.length;i++){
    bool flag =false;
    int x=numbers[i] ~/(i+1);
    if(x>=left && x<=right && (i+1)*x == numbers[i]){
      flag=true;
    }
  result.add(flag);
  }
  
  return result;
}

void main(){
  print(solution(left :1, right :3, numbers:[8,5,6,16,5]));
  print(solution(left:1, right: 1, numbers: [1, 2, 3, 4, 5]));
  print(solution(left:5, right: 10, numbers: [10, 20, 30]));
}
