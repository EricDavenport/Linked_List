

/*
 A linked list is a way of storing information. A linked list consists of a series of nodes. Each node contains data, as well as a pointer to the next node in the series.
 A linked list is a way of storing information. A linked list consist o a series of nodes. Each node contains data, as well as a pointer to the next node in a series.
 
 use customStringConvertible - provides description protocol
 
 if linked list points in two directions - considered doubly linked listed
 
 extensions are not allowed to have store property does not compile
 */

import UIKit

// implementing a Node abstract data structure
class Node<T: Equatable>: Equatable {
  var value: T
  var next: Node?   // Singly linked list
 // var previous: Node? // Doubly linked list
  
  // required unction for equatable
  static func == (lhs: Node, rhs: Node) -> Bool {
    // T & T = true
    // T & F = false
    return lhs.value == rhs.value && lhs.next == rhs.next
  }
  
  init(_ value: T) {
    self.value = value
  }
}

// implementing CustomStringConvertible to customize description of a Node
extension Node: CustomStringConvertible {
  
  // var name = 90 - DOES NOT COMPILE, EXTENSIONS ARE NOT ALLOWED TO HAVE STORED PROPERTIES
  var description: String {
    guard let next = next else {
      return "\(value) -> nil"  // 12 -> nil
    }
    //    guard let previous = previous else {
    //      return "\(value) <-> \(next)"
    //    }
    // if we have connected nodes
    return "\(value) -> \(next)"
  }
}

// instantiating node instances
let car12 = Node<Int>(12)
let car99 = Node<Int>(99)



// link our nodes (linked list using connected nodes)
car12.next = car99
//car12.previous = car12

// print the current state of linked node
// in order to print connect nodes in a readable manner we conformed to CustomStringConvertible
// implented var description and wrote the print logic
print(car12)  // 12 -> 99   -- has no way to print itself - no description


let fellow = ["Ameni", "Lilia"]
print(fellow)

class LinkedList<T: Equatable> {
  var head: Node<T>?
  var tail: Node<T>?
  
  // First computer property
  public var first: Node<T>? {
    return head
  }
  // last computer property
  public var last: Node<T>? {
    return tail
  }
  
  // isEmpty computer property
  public var isEmpty: Bool {
    return head == nil  // if head is equal to nil then list is empty
  }
  // append method
  public func append(_ value: T) {
    // create a node
    let newNode = Node(value)
    
    // scenrio 1: appending to empty list
    guard let lastNode = tail else {
      // empty list
      head = newNode
      tail = head
      return
    }
    
    // scenario 2: existing node
    lastNode.next = newNode
    tail = newNode
  }
  // removeLast method
  public func removeLast() -> Node<T>? {
    // scenario 1
    if isEmpty {
      return nil
    }
    var removedNode: Node<T>?
    if head == tail {
      // scenario 2 - if head and tail pointing to the same Node
      removedNode = head
      head = nil
      tail = nil
      return removedNode
    }
    // scenario 3 - iterate, traverse, walk the linked list starting from the head
            // unabel to do for loop because does not conform to sequencing
    var currentNode = head
    
    while currentNode?.next != tail {   // stops at node before the tail(final node)
      // keep traverdsing
      currentNode = currentNode?.next
    }
    // saved the tails node before removing the last node (tail)
    removedNode = tail
    
    // set tail to Node bfore the last node
    tail = currentNode
    
    currentNode?.next = nil
    
    return removedNode
  }
}

extension LinkedList: CustomStringConvertible {
  // computed property
  var description: String {
    guard let head = head else {
      return "empty list"
    }
    return "\(head)"
  }
}


let fellows = LinkedList<String>()
//fellows.append("Oscar")
fellows.append("Tanya")
fellows.append("David")
fellows.append("Eric")
fellows.append("Christian")

print(fellows)  // Oscar -> nil
fellows.removeLast()
print(fellows)
fellows.removeLast()
print(fellows)
fellows.removeLast()
print(fellows)
fellows.removeLast()
print(fellows)
fellows.append("Eric")
print(fellows)
fellows.append("Christian")
fellows.append("David")
print(fellows)
print(fellows.first)
print(fellows.last)

