/* input: 
  ! list a (a[i] the length of a ribbon) [5, 2, 7, 4, 9]
  ! int k the minimum required number of ribbons (all of the same length) 5
  process:
  - num -> the max length in the list 9, for loop start from num and then it goes low step by step i--;
  - for every list item using map do a[i]~/num (~/ to drop the remainder), sum the list elements in result
  ! 5 ~/ 4 = 1, 2 ~/ 4 = 0, 7 ~/ 4 = 1, 4 ~/ 4 = 1, 9 ~/ 4 = 2 -> [1,0,1,1,2] -> result = 1+0+1+1+2 = 5
  - if result >= k return num 4
  output:
  maximum ribbon length L that allows cutting at least k pieces */

void main(){
print(maximumLength([5, 2, 7, 4, 9], 5)); //output = 4
}
int maximumLength (List <int> a, int k){
  int longestRibbon = a.reduce((x,y) => x > y ? x : y); //reduce:takes a function and applies it on list elements
  for(int i = longestRibbon; i > 0; i--){
    // to know number of pieces of length i that can be cut from all ribbons
    int result = a.map((ribbon) => ribbon ~/ i).reduce((x, y) => x + y);
    if(result >= k){
      return i;
    }
  }
   return 0;
}