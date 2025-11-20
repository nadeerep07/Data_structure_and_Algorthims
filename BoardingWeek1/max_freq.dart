import 'dart:io';

class Node<K,V>{
K key;
V value;
Node(this.key,this.value);
}


class HashTable<K,V>{
late List<List<Node>?> table;

HashTable([int size=10]){
   table = List.filled(size, null);
}

hash(K key){
 return key.hashCode % table.length;
}

insert(K key,V value){
  int index = hash(key);

table[index] ??= [];

 for(var pair in table[index]!){
  if(pair.key == key){
     pair.value = value;
  }
 }

 table[index]!.add(Node(key,value));
}


get(K key){
  int index = hash(key);

  if(table[index] == null) return;

for(var pair in table[index]!){
  if(pair.key == key) return pair.value;
}
}

display(){
  for(int i=0;i<table.length;i++){
    if(table[i] != null && table[i]!.isNotEmpty){
  for(var n in table[i]!){
  stdout.write("${n.key}:${n.value} -> " " ");
  }
    }
  }
}

}



void main(){
String name = "hello world";
  HashTable<String,dynamic> hash = HashTable();

  for(var char in name.split('')){
    if(char == ' ')continue;
   var count = hash.get(char);
   if(count == null){
    hash.insert(char, 1);
   }else{
    hash.insert(char, count+1); 
   }
  }

  hash.display();

print('\n');

name = "nadeer";
  Map<String,int> freq={};

  for(var key in name.split('')){
    freq[key] = (freq[key] ?? 0)+1;
  }

  freq.forEach((char,count){
    print("${char}:${count}");
  });


  LLis lis = LLis();
  lis.insert(1);
  lis.insert(3);
  lis.insert(4);
  lis.insert(6);
  lis.remove(3);
  lis.diaplay();




List<int> arr=[1,2,3,4,5,6];
int sum = arr.reduce((a,b) => a+b); 
num avg = sum / arr.length; 

for(int i =0;i<arr.length;i++){

  if(arr[i] >= avg && arr[i]%2 ==0){
    arr.removeAt(i);
    i--;
  }

}

print(arr);

binarysearch(List<int> arr,int target,int left,int right){
 if(left > right) return 0;
int mid = left+right~/2;

if(arr[mid] == target) return mid;
if(arr[mid] < target) return binarysearch(arr, target, mid+1, right);
return binarysearch(arr, target, left, mid-1);
 
}

print(binarysearch([1,2,3,4,5], 2, 0, 4));
}



class LnnkedNode{
  int data;
  LnnkedNode? next;
  LnnkedNode(this.data);
}

class LLis{
  LnnkedNode? head;



  insert(int val){
    var newNode = LnnkedNode(val);

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


  remove(int val){
    if(head == null) return;

    if(head!.data == val){
     head = head!.next;
     return;
    }

    var current = head;
    while(current!.next!.data != val){
      current = current.next;
    }
  current.next = current.next!.next;
  }


  diaplay(){
    var current = head;
    while(current != null){
      stdout.write(current.data);
      current = current.next;
    }
  }
}





