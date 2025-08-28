int max_ribbob({required int k ,required List <int>number}){ 
  int max = number[0]; 
  for(int i = 1; i < number.length; i++){ 
    if(number[i] > max){ 
      max = number[i]; 
    } 
  } 

  // return max; 
  int new_length = max; 
  do{ 
    int piece = 0; 
    for (int j = 0; j < number.length; j++){ 
      piece += number[j] ~/ new_length; 
    } 
    if(piece >= k){ 
      return new_length; 
    } 
    new_length--; 
  } while(new_length >= 1); 

  return 0; 
} 

void main(){ 
  print(max_ribbob(k: 5, number: [5,2,7,4,9])); 
  print(max_ribbob(k: 6, number: [1, 2, 3, 4, 9])); 
  print(max_ribbob(k: 4, number: [5, 5, 5])); 
  print(max_ribbob(k: 7, number: [2,3,5])); 
  print(max_ribbob(k: 1, number: [100])); 
}