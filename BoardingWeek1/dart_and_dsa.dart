import 'dart:io';

void main(){
  
  //DUPLICATE
  
  
 // List<int> arr =[1,1,2,1,2,3,1];
  
//   for(int i =0;i<arr.length;i++){
//     int j=i+1;
//     while(j<arr.length){
//      if(arr[i]==arr[j]){
//        arr.removeAt(j);
//      }else{
//        j++;
//      }
//     }
//   }
//   print(arr);
  
  
 // MAXFREQ
  
  
  
//   String name ="Hello World with Wonderfull Life";
  
  
//   Map<String,int> frq={};
  
  
//   for(var key in name.split('')){
//       frq[key] = (frq[key] ?? 0)+1; 
//    // print('${key}: ${frq[key]}');
//   }
  
//   int maxFreq=0;
//   frq.forEach((char,count){
//     if(count>maxFreq){
//       maxFreq=count;
//     }
//   });
  
//   print(maxFreq);
  
  
  //PRIME
//   List<int> arr=[1,2,3,4,5];
  
//     bool isPrime(int nums){
//     if(nums<=1)return false;
    
//     for(int i=2;i<=nums~/i;i++){
//       if(nums%i == 0)return false;
//     }
    
//     return true;
//   }
  
//   for(int i=0;i<arr.length;i++){
//     if(isPrime(arr[i])){
//       print(arr[i]);
//     }
//   }
  
  
 // Recursion
  
//  //fibonacci using resurion
  
  
// int fibonacci(int nums){
//   if(nums ==0)return 0;
//   if(nums ==1)return 1;
//   return fibonacci(nums-1) + fibonacci(nums-2);
// }
  
  
  
// int n=10;
  
//   for(int i=0;i<n;i++){
//     print(fibonacci(i));
//   }
  
 
 //Reverse String usingREcursion 
  
  
//   String str ="Nadeer";
  
  
//   String reverseString(String str){
//     if(str.isEmpty)return '';
//     return reverseString(str.substring(1))+str[0];
//   }
  
//   print(reverseString(str));
  
  
// //   Factorial
  
  
//   int n=5;
//     int factorial(int n){
//     if(n==0 || n==1) return 1;
//     return n*factorial(n-1);
//   }
  
//   int result = factorial(n);
  
// print(result);
  
  
  
 // Largest Number
  
  
//   List<int> arr=[1,2,3,4,5,6];
//   int largest =0;
//   for(int i =0;i<arr.length;i++){
//     if(arr[i]>largest){
//       largest = arr[i];
//     }
//   }
  
//   print(largest);
  
  
  
  
// // Find and Remove Second Largest
//  List<int> arr=[1,2,3,4,5,6];
  
  
//  int largest =arr[0];
//  int  secondLargest =-1;
  
//   for(int i=1;i<arr.length;i++){
//     if(arr[i]> largest){
//       secondLargest = largest;
//       largest=arr[i];
//     }else if (arr[i] > secondLargest && arr[i] != largest){
//       secondLargest = arr[i];
//     }
     
//   }

  
//   arr.removeWhere((element) => element == secondLargest);
  
//   print(arr);
  
  
  
  

  
  
  
  
  
  
  
//   String name = "hwello wworld";
  
  
//   HashTable<String,int> freqTable = HashTable();
  
  
//   for(var char in name.split('')){
//      if( char == ' ')continue;
//     int? count = freqTable.get(char);
//     if(count ==null ){
//       freqTable.insert(char,1);
//     }else{
//       freqTable.insert(char,count+1);
//     }
    
      
//   }
  
//   freqTable.display();
  
  
  
  // DList sl= DList();
  // sl.insert(1);
  // sl.insert(2);
  // sl.display();
  


//   String pali = "level";

//  Stack st = Stack();
// if(st.reverseString(pali) == pali){
//   print(true);
// }else{
//   print(false);
// }


//  Linked singly = Linked();
// singly.insert(1);
// singly.insert(2);
// singly.insert(3);
// // print('original lsit');
// // singly.printlist();
// // print('\nreversed lsit');
//  singly.reverse();
//  singly.printlist();



// String name ="my name is nadeer";

//  reverse(String str){
//   if(str.isEmpty) return '';
//   return reverse(str.substring(1))+ str[0];
//  }
//  reversed(String sentance){
//   List<String> nums = sentance.split(' ');
//   List<String> result=[];

//   List<String> isrevsed=['nadeer','name'];
//  for(var words in nums){
//   if(isrevsed.contains(words)){
//     result.add(reverse(words));
//   }else{
//     result.add(words);
//   }
 
//  }
//   return result.join(' ');
//  }

//  print(reversed(name));





}


class Node{
  int data;
  Node? next;
  Node(this.data);
}

class Linked{
  Node? head;

insert(int val){
var newNode = Node(val);
if(head == null){
  head = newNode;
  return;
}

var current = head;
while(current!.next != null){
  current = current.next;
}

current.next = newNode;
}

reverse(){
  Node? prev;
  Node? current = head;
  Node? next;

  while(current != null){
    next = current.next;
    current.next = prev;
    prev = current;
    current=next;
    
  }
  head = prev;
}


printlist(){
  var current = head;
  while(current != null){
    stdout.write( current.data);
    current = current.next;
  }
}
}

// class Node<V>{
//   V data;
//   Node? next;
//   Node(this.data);
// }


// class Stack<V>{

//   Node? head;

//   append(V value){
//     var newNode = Node(value);

//     if(head == null){
//       head = newNode;
//       return;
//     }

//     newNode.next = head;
//     head = newNode;
//   }

//   pop(){
//     if(head == null) return null;
//      var poppedValue = head!.data;
//      head = head!.next;
//      return poppedValue;
//   }
//   reverseString(String name){
//       for(int i =0;i<name.length;i++){
//    append(name[i] as V);

//   }
  
//   String reversed ='';
//   while(head != null){
//     reversed+= pop();

//   }
//   return reversed;
 //   }


  
// }

// class Node<K,V>{
//  K key;
//   V value;
//   Node(this.key,this.value);
// }

// class HashTable<K,V>{
  
// late  List<List<Node>?> table;
  
//   HashTable([int size=10]){
//     table = List.filled(size,null);
//   }
  
  
//   int hash( K key){
//     return key.hashCode % table.length;
//   }
  
//   insert(K key,V value){
//     int index = hash(key);
    
//     table[index] ??= [];
    
//     for(var pair in table[index]!){
//       if(pair.key ==key ){
//         pair.value = value;
//         return;
//       }
//     }
    
//     table[index]!.add(Node(key,value));
    
//   }
  
//   get(K key){
//     int index = hash(key);
//     if(table[index] == null) return;
    
//     for(var pair in table[index]!){
//       if(pair.key == key) return pair.value;
//     }
    
//     return;
//   }
  
  
  
//   display(){
//     for(int i=0;i<table.length;i++){
//       if(table[i] !=null && table[i]!.isNotEmpty){
//         for(var j in table[i]!){
//           print("${j.key}:${j.value}");
//         }
//       }
//     }
//   }
  
// }



// class Node{
//   int data;
//   Node? next;
//   Node? prev;
  
//   Node(this.data);
// }

// class DList{
//   Node? head;
//   Node? tail;
  
//   insert(int value){
//     var newNode = Node(value);
    
//     if(head == null){
//       head = newNode;
//       tail = newNode;
//       return;
//     }
    
//   tail!.next = newNode;
//     tail= newNode; 
//   }
  
//   display(){
//    var current = head;
//     while(current != null){
//       print(current.data);
//       current = current.next;
//     }
//   }
// }

// class Slist{
//   Node? head;
  
  
  
//   insert(int value){
//     var newNode = Node(value);
    
//     if(head == null){
//       head = newNode;
//       return;
//     }
//    var current= head;
//     while(current!.next != null){
//       current = current.next;
//     }
    
//     current.next = newNode;
//   }
  
//   display(){
//     var current = head;
//     while(current != null){
//        print(current?.data);
//       current = current.next;
     
//     }
//   }
// }
  

  class JSon{
final String name;


  JSon(this.name);

    Map<String,dynamic> toJson(
      String name,
    ){
      return {'name': name};
    }


   factory JSon.fromJson(Map<String,dynamic> json){
    return JSon(json['name'] ?? '');
   }
  }