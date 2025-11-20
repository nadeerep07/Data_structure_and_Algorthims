binary(List<int> arr,int key,int left,int right){
  if(left>right)return 0;
  int mid = (left+right)~/2;

  if(arr[mid] == key) return mid;
  if(arr[mid] < key) return binary(arr, key, mid +1, right);
  return binary(arr, key, left, mid-1);
}

void main(){
  print(binary([1,2,3,4,5,6], 6, 0, 5));
}