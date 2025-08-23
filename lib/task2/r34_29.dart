int maxRibbonLength(List<int>ribbons,int k){

  int maxLength = ribbons.reduce((a,b)=>a>b?a:b);
  int result =0;
  for (int len=1 ;len <= maxLength;len++){
    int pieces=0;
    for (int ribbon in ribbons){
      pieces+=ribbon ~/ len;
    }
    if (pieces>=k){
      result=len;
    }
  }
  return result;
}

void main(){

print (maxRibbonLength([5,2,7,4,9], 5));

}