mergeSorting(List<int> arr) {
  if (arr.length <= 1) return arr;

  int mid = arr.length ~/ 2;
  List<int> left = arr.sublist(0, mid);
  List<int> right = arr.sublist(mid);

  return merge(mergeSorting(left), mergeSorting(right));
}

merge(List<int> left, List<int> right) {
  List<int> sortedArr = [];
  int i = 0, j = 0;
  while (i < left.length && j < right.length) {
    if (left[i] < right[j]) {
      sortedArr.add(left[i]);
      i++;
    } else {
      sortedArr.add(right[j]);
      j++;
    }
  }
  sortedArr.addAll(left.sublist(i));
  sortedArr.addAll(right.sublist(j));
  return sortedArr;
}

void main() {
  List<int> arr = [12, 11, 13, 5, 6];
  List<int> sortedArr = mergeSorting(arr);
  print("Sorted array: $sortedArr");
}
