// void main() {
//   // print(reversestr('12345'));
//   //   LinkedList list = LinkedList();
//   //   list.addtofirst(1);
//   //   list.addtoLast(2);
//   //   list.addtoLast(3);
//   //   list.addtoLast(66);
//   //   list.prinList();
//   print(linearsearch([1, 2, 3, 4, 5], 4));
//   print(sumofdigit(10));
// }
// //  reversestr(String str){
// //    if(str.isEmpty) return str;
// //    return reversestr(str.substring(1)) + str[0];
// //  }

class Node {
  int data;
  Node? next;
  Node(this.data);
}

class LinkedList {
  Node? head;

  addtofirst(var val) {
    var newNode = Node(val);
    newNode.next = head;
    head = newNode;
  }

  addtoLast(var val) {
    var newNode = Node(val);
    if (head == null) {
      addtofirst(val);
    } else {
      var current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
  }

  fromArray(List<int> arr) {
    for (int i = 0; i < arr.length; i++) {
      addtoLast(arr[i]);
    }
  }
  toArr(){
    List<int> arr = [];
    var current = head;
    while(current != null){
      arr.add(current.data);
      current = current.next;
    }
    return arr;
  }

  insertAt(int i, int val) {
    var newNode = Node(val);
    if (i == 0) {
      addtofirst(val);
    } else {
      var current = head;
      for (int j = 0; j < i - 1; j++) {
        current = current!.next;
      }
      newNode.next = current!.next;
      current.next = newNode;
    }
  }

  prinList() {
    var current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

binarysearch(List<int> arr, int target, int left, int right) {
  //   int left = 0;
  //   int right = arr.length - 1;
  if (left > right) return -1;
  int mid = (left + right) ~/ 2;
  if (arr[mid] == target)
    return mid;
  else if (arr[mid] < target) {
    return binarysearch(arr, target, mid + 1, right);
  } else {
    return binarysearch(arr, target, left, mid - 1);
  }
}

linearsearch(List<int> arr, int target) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == target) {
      return i;
    }
  }
}

sumofdigit(int n) {
  if (n == 0) return n;
  return sumofdigit(n - 1) + n;
}

fibo(int n) {
  if (n == 0 || n == 1) return n;
  return fibo(n - 1) + fibo(n - 2);
}

void main() {
  print(fibo(10));
}
