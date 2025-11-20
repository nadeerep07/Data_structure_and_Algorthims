import 'dart:io';

typedef Arr = List<int>;

bubbleSort(Arr arr) {
  for (int i = 0; i < arr.length; i++) {
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[i] > arr[j]) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }
  }
  stdout.write("$arr\n");
}

insertionSorting(Arr arr) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
  stdout.write("$arr\n");
}

selectionSorting(Arr arr){
  for(int i=0;i< arr.length;i++){
    int min =i;
    for(int j=i+1;j<arr.length;j++){
      if(arr[j]<arr[min]){
        min = j;
      }
    }
    int temp = arr[min];
    arr[min] = arr[i];
    arr[i]= temp;

  }
  stdout.write("$arr\n");
}

mergeSorting(Arr arr){
  if(arr.length <=1 ) return arr;
  int mid = arr.length ~/2;
  Arr left = arr.sublist(0,mid);
  Arr right = arr.sublist(mid);

  return merge(mergeSorting(left),mergeSorting(right));
}

merge(Arr left,Arr right){
  Arr sortArr =[];
  int i=0,j=0;

  while(i<left.length && j<right.length){
    if(left[i] < right[j]){
      sortArr.add(left[i]);
      i++;
    }else{
      sortArr.add(right[j]);
      j++;
    }
  }
  sortArr.addAll(left.sublist(i));
  sortArr.addAll(right.sublist(j));

  return sortArr;
}


quickSorting(Arr arr){
  if(arr.length <= 1) return arr;
  int pivot = arr[arr.length ~/2];

  Arr left = [];
  Arr mid =[];
  Arr right =[];

  for(int i=0;i<arr.length;i++){
    if(arr[i] < pivot){
      left.add(arr[i]);
    }else if(arr[i] > pivot){
      right.add(arr[i]);
    }else{
      mid.add(arr[i]);
    }
  }

  return [...quickSorting(left),...mid,...quickSorting(right)];
}

void main() {
  Arr arr = [55, 35, 3, 7, 8, 43, 5];
  bubbleSort(arr);
  insertionSorting(arr);
  selectionSorting(arr);
  stdout.write("${mergeSorting(arr)}\n");
  stdout.write("${quickSorting(arr)}\n");
}
