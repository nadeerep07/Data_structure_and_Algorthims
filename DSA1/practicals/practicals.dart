// factorial of a number using recursion
int fact(int val) {
  if (val == 0) return 1;
  return val * fact(val - 1);
}

int fibonacci(var val) {
  if (val == 0 || val == 1) return val;
  return fibonacci(val - 1) + fibonacci(val - 2);
}

// reverse a string using recursion
String reverseRecursive(String str) {
  if (str.isEmpty) return str;
  return reverseRecursive(str.substring(1)) + str[0];
}

// sum of array elements using recursion
int sumArray(List<int> arr, int i) {
  if (i >= arr.length) return 0;
  return arr[i] + sumArray(arr, i + 1);
}

// check if a string is palindrome using recursion
bool isPalindrome(String str, int start, int end) {
  if (start >= end) return true;
  if (str[start] != str[end]) return false;
  return isPalindrome(str, start + 1, end - 1);
}

// check if a number is prime using recursion
bool isPrime(int n, [int i = 2]) {
  if (n <= 2) return n == 2;
  if (n % i == 0) return false;
  if (i * i > n) return true;
  return isPrime(n, i + 1);
}

// linear search using recursion
int linearSearch(List<int> arr, int key) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == key) return i;
  }
  return -1;
}

// // binary search using recursion
// int binarySearch(List<int> arr, int key) {
//   int left = 0, right = arr.length - 1;
//   while (left <= right) {
//     int mid = (left + right) ~/ 2;
//     if (arr[mid] == key)
//       return mid;
//     else if (arr[mid] < key)
//       left = mid + 1;
//     else
//       right = mid - 1;
//   }
//   return -1;
// }

// recursive binary search
int recursiveBinarySearch(List<int> arr, int key, int left, int right) {
  if (left > right) return -1;
  int mid = (left + right) ~/ 2;
  if (arr[mid] == key)
    return mid;
  else if (arr[mid] < key)
    return recursiveBinarySearch(arr, key, mid + 1, right);
  else
    return recursiveBinarySearch(arr, key, left, mid - 1);
}

// sum of digits of a number using recursion
sumofDigits(int arr) {
  if (arr == 0) return 0;
  return arr % 10 + sumofDigits(arr ~/ 10);
}

deleteDuplicates(List<int> arr) {
  return arr.toSet().toList();
}

largest(List<int> arr, int i, int max) {
  if (i > arr.length) return 0;
  if (arr[i] > max) max = arr[i];
  return largest(arr, i + 1, max);
}

anagramrecursion(String str1, String str2) {
  if (str1.length != str2.length) return false;
  if (str1.isEmpty && str2.isEmpty) return true;
  if (str1[0] != str2[0]) return false;
  return anagramrecursion(str1.substring(1), str2.substring(1));
}

nonRepeatingchar(String str, int index) {
  if (index >= str.length) return '';
  if (str.substring(0, index).contains(str[index]))
    return nonRepeatingchar(str, index + 1);
  return str[index];
}

reverse(String str) {
  if (str.isEmpty) return 0;
  return reverse(str.substring(1)) + str[0];
}

reverseArr(List<int> arr) {
  if (arr.isEmpty) return [];
  return reverseArr(arr.sublist(1)) + [arr[0]];
}

removeChar(String str, int index) {
  if (index >= str.length) return '';
  return str.substring(0, index) + removeChar(str, index + 1);
}

binary(List<int> arr, int key, int left, int right) {
  if (left > right) return 0;
  int mid = left + right ~/ 2;
  if (arr[mid] == key) return mid;
  if (arr[mid] < key) return binary(arr, key, mid + 1, right);
  return binary(arr, key, left, mid - 1);
}


void main() {
  // print(fact(5));
  // print(reverseRecursive('hello'));
  // print(sumArray([1, 2, 3, 4, 5], 0));
  // print(isPalindrome('heywe', 0, 4));
  // print(isPrime(7));
  // print(linearSearch([1, 2, 3, 4, 5], 3));
  // print(recursiveBinarySearch([1, 2, 3, 4, 5], 3, 0, 4));
  // print(anagramrecursion('listen', 'silent'));
  // print(nonRepeatingchar('hello', 0));
  // print(deleteDuplicates([1, 2, 3, 4, 5, 5, 6, 7, 8, 9, 9]));
  // print(sumofDigits(123));
  print(reverseArr([1, 2, 3, 4, 5, 6]));
  print(removeChar('hello', 0));
}
