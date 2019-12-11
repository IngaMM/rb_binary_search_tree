Binary search tree

By I. Mahle

A project of The Odin Project: https://www.theodinproject.com/courses/ruby-programming/lessons/data-structures-and-algorithms

Instructions

1. Run ./binary_search_tree.rb
2. Change the input in the file binary_search_tree.rb
3. Run again

Discussion
I used the following technologies: Ruby with classes and methods.
This is an implementation of a binary search tree (https://en.wikipedia.org/wiki/Binary_search_tree).
A binary tree is given as an input and built up. A crawler function locates the data inside it by visiting every node and finds a given value. Different search methods are implemented.

Some details of the implementation:

- The class Node has a value that it stores and also links to its children (if they exist). Getters and setters are included.
- The method build_tree takes an array of data (e.g. [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]) and turns it into a binary tree full of Node objects appropriately placed.
  cript that runs build_tree so you can test it out.
- The method breadth_first_search takes a target value and returns the node at which it is located using the breadth first search technique (https://en.wikipedia.org/wiki/Breadth-first_search). If the target node value is not located, nil is returned.
- The method depth_first_search returns the node at which the target value is located using the depth first search technique (https://en.wikipedia.org/wiki/Depth-first_search). An array acting as a stack is used to do this.
- The method dfs_rec also uses a depth first search but instead of using a stack it is recursive.

Requirements
Ruby
