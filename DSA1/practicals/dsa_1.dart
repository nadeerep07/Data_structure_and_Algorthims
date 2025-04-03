// fibonacci(int val) {
//   if (val == 0 || val == 1) return val;
//   return fibonacci(val - 1) + fibonacci(val - 2);
// }

// fact(int val) {
//   if (val == 0) return 1;
//   return val * fact(val - 1);
// }

// sumofDigit(int val) {
//   if (val == 0) return 0;
//   return val % 10 + sumofDigit(val ~/ 10);
// }

// sumofArray(List<int> arr, int i) {
//   if (i >= arr.length) return 0;
//   return arr[i] + sumofArray(arr, i + 1);
// }

// reverseString(String str) {
//   if (str.isEmpty) return 0;
//   return reverseString(str.substring(1)) + str[0];
// }

// bool isPalindrome(String str, int start, int end) {
//   if (start >= end) return true;
//   if (str[start] != str[end]) return false;
//   return isPalindrome(str, start + 1, end - 1);
// }

// linearSearch(List<int> arr, int target) {
//   for (int i = 0; i < arr.length; i++) {
//     if (arr[i] == target) {
//       return i;
//     }
//   }
//   return -1;
// }

// reverseArray(List<int> arr, int start, int end) {
//   if (start >= end) return;
//   var temp = arr[start];
//   arr[start] = arr[end];
//   arr[end] = temp;
//   reverseArray(arr, start + 1, end - 1);
// }

// findLargest(List<int> arr, int i, int max) {
//   if (i > arr.length) return 0;
//   if (arr[i] > max) {
//     max = arr[i];
//   }
//   return findLargest(arr, i + 1, max);
// }

// findSmallest(List<int> arr, int i, int min) {
//   if (i > arr.length) return 0;
//   if (arr[i] < min) {
//     min = arr[i];
//   }
//   return findSmallest(arr, i + 1, min);
// }

// binarySearch(List<int> arr, int target, int left, int right) {
//   if (left > right) return -1;
//   var mid = (left + right) ~/ 2;
//   if (arr[mid] == target) return mid;
//   if (arr[mid] < target) return binarySearch(arr, target, mid + 1, right);
//   return binarySearch(arr, target, left, mid - 1);
// }

// void main() {
//   print(fibonacci(10));
//   print(fact(5));
// }

fibo(var val) {
  if (val == 0 || val == 1) return val;
  return fibo(val - 1) + fibo(val - 2);
}

fac(var val) {
  if (val == 0) return 1;
  return val * fac(val - 1);
}

sumofDigit(var val) {
  if (val == 0) return 0;
  return val % 10 + sumofDigit(val ~/ 10);
}

sumofArray(List<int> arr, int i) {
  if (i >= arr.length) return 0;
  return arr[i] + sumofArray(arr, i + 1);
}

reverseString(String str) {
  if (str.isEmpty) return 0;
  return reverseString(str.substring(1)) + str[0];
}

linearSearch(List<int> arr, int key) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == key) return i;
  }
  return -1;
} 




binarySearch(List<int> arr, int target, int left, int right) {
  if (left > right) return 0;
  int mid = left + right ~/ 2;
  if (arr[mid] == target) return mid;
  if (arr[mid] < target) return binarySearch(arr, target, mid + 1, right);
  return binarySearch(arr, target, left, mid - 1);
}
