String reverseRecursive(String str) {
  if (str.isEmpty) return str;
  return reverseRecursive(str.substring(1)) + str[0];
}


void main(){
  print(reverseRecursive('HELLo'));
}