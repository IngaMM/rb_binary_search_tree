#!/usr/bin/ruby

class Node

  def initialize(value)
    @value = value
    @child_left = nil
    @child_right = nil
#    @parent = nil
  end

  def child_left
    @child_left
  end

  def child_right
    @child_right
  end

#  def parent
#    @parent
#  end

  def value
    @value
  end

  def child_left=(child_node)
    @child_left = child_node
#    @child_left.parent = self
  end

  def child_right=(child_node)
    @child_right = child_node
#    @child_right.parent = self
  end

#  def parent=(parent_node)
#    @parent = parent_node
#  end

end

class Tree
  def initialize
    @root = nil
  end

  def build_tree(arr)
    arr.each_with_index do |value, index|
      if (index == 0)
         @root = Node.new(arr[index])
      else
        insert_in_tree(arr[index])
      end
    end
  end

  def show_tree(node_to_print = @root)
    if (node_to_print.child_left || node_to_print.child_right)
      p "Parent: #{node_to_print.value}"
    end
     if (node_to_print.child_left)
       p "Left child: #{node_to_print.child_left.value}"
     end
     if (node_to_print.child_right)
       p "Right child: #{node_to_print.child_right.value}"
     end
     if (node_to_print.child_left)
       show_tree(node_to_print.child_left)
     end
     if (node_to_print.child_right)
       show_tree(node_to_print.child_right)
     end
  end

  def breadth_first_search(value_to_find)
    discovered_nodes = [@root]
    while discovered_nodes != []
      # Visit first element in discovered_nodes
      if discovered_nodes[0].value == value_to_find
        return discovered_nodes[0]
      else
        # Enqueue left child
        if (discovered_nodes[0].child_left)
          discovered_nodes.push(discovered_nodes[0].child_left)
        end
        # Enqueue right child
        if (discovered_nodes[0].child_right)
          discovered_nodes.push(discovered_nodes[0].child_right)
        end
        # Remove visited node after printing its value
        p "Visited: #{discovered_nodes[0].value}"
        discovered_nodes.shift
      end
    end
    return nil
   end

   def depth_first_search(value_to_find)
     discovered_nodes = [@root]
     while discovered_nodes != []
       # Visit first element in discovered_nodes
       if discovered_nodes[0].value == value_to_find
         return discovered_nodes[0]
       else
         # Remove visited node after printing its value
         p "Visited: #{discovered_nodes[0].value}"
         visited_node = discovered_nodes[0]
         discovered_nodes.shift
         # Add right child to the front of the discovered nodes
         if visited_node.child_right
           discovered_nodes.unshift(visited_node.child_right)
         end
         # Add left child to the front of the discovered nodes
         if visited_node.child_left
           discovered_nodes.unshift(visited_node.child_left)
         end
       end
     end
     return nil
   end

   def dfs_rec(value_to_find, node_to_check = @root)
     if (node_to_check == @root)
       @@not_found = true
       @@node_found = nil
     end
     if (node_to_check)
       p "Visited: #{node_to_check.value}"
       if (node_to_check.value == value_to_find)
         @@not_found = false
         @@node_found = node_to_check
       else
         if @@not_found
           dfs_rec(value_to_find, node_to_check.child_left)
         end
         if @@not_found
           dfs_rec(value_to_find, node_to_check.child_right)
         end
       end
     end
     return @@node_found
   end

  private
    def insert_in_tree(value)
      node_to_compare = @root
      not_yet_inserted = true
      while not_yet_inserted do
        if node_to_compare.value <= value # go down right branch
          if node_to_compare.child_right
            node_to_compare = node_to_compare.child_right
          else
            new_node = Node.new(value)
#            new_node.parent = node_to_compare
            node_to_compare.child_right = new_node
            not_yet_inserted = false
          end
        else # go down left branch
          if node_to_compare.child_left
            node_to_compare = node_to_compare.child_left
          else
            new_node = Node.new(value)
#            new_node.parent = node_to_compare
            node_to_compare.child_left = new_node
            not_yet_inserted = false
          end
        end
      end
    end

end

my_tree = Tree.new
my_tree.build_tree([8, 3, 10, 14, 13, 1, 6, 7, 4])
p my_tree.dfs_rec(13)
