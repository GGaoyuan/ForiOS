//
//  Tree.swift
//  ForiOS
//
//  Created by 高源 on 2020/9/8.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

class TreeNodeSolution: NSObject {
    /**
    *  先序遍历
    *  先访问根，再遍历左子树，再遍历右子树
    */
    func preOrder(_ rootNode: TreeNode?) {
        if rootNode == nil { return }
        print("value = \(String(describing: rootNode?.val))")
        preOrder(rootNode?.left)
        preOrder(rootNode?.right)
    }
    /**
    *  中序遍历
    *  先遍历左子树，再访问根，再遍历右子树
    */
    func midOrder(_ rootNode: TreeNode?) {
        if rootNode == nil { return }
        midOrder(rootNode?.left)
        print("value = \(String(describing: rootNode?.val))")
        midOrder(rootNode?.right)
    }
    /**
    *  后序遍历
    *  先遍历左子树，再遍历右子树，再访问根
    */
    func postOrder(_ rootNode: TreeNode?) {
        if rootNode == nil { return }
        postOrder(rootNode?.left)
        postOrder(rootNode?.right)
        print("value = \(String(describing: rootNode?.val))")
    }
    /// 二叉树深度
    func depth(_ rootNode: TreeNode?) -> Int {
        if rootNode == nil {return 0}
        let leftDepth = depth(rootNode?.left)
        let rightDepth = depth(rootNode?.right)
        return max(leftDepth, rightDepth) + 1
    }
    /// 是否是平衡二叉树
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {return true}
        let leftDepth = depth(root?.left)
        let rightDepth = depth(root?.right)
        if abs(leftDepth - rightDepth) <= 1 && isBalanced(root?.left) && isBalanced(root?.right) {
            return true
        } else {
            return false
        }
    }
    /// 是否是对称二叉树
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {return true}
        return symmetric_result(root?.left, root?.right)
    }
    private func symmetric_result(_ leftNode: TreeNode?, _ rightNode: TreeNode?) -> Bool {
        if leftNode == nil && rightNode == nil { return true }
        if leftNode == nil { return false}
        if rightNode == nil { return false}
        //判断当前值左右是否相等，判断左子树的左节点和右子树的右节点，判断左子树的右节点和右子树的左节点是否相等，三者缺一不可，一直递归
        return leftNode?.val == rightNode?.val && symmetric_result(leftNode?.left, rightNode?.right) && symmetric_result(leftNode?.right, rightNode?.left)
        
    }
    /// 二叉树镜像/翻转二叉树
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return nil }
        let tempNode = root?.left
        root?.left = root?.right
        root?.right = tempNode
        let _ = mirrorTree(root?.left)
        let _ = mirrorTree(root?.right)
        return root
    }
    /// 层序遍历
    func levelOrder(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        if root == nil { return result }
        var nodeQueue = [TreeNode]()
        nodeQueue.append(root!)
        while nodeQueue.count > 0 {
            if nodeQueue.first?.left != nil {
                nodeQueue.append(nodeQueue.first!.left!)
            }
            if nodeQueue.first?.right != nil {
                nodeQueue.append(nodeQueue.first!.right!)
            }
            result.append(nodeQueue.first!.val)
            nodeQueue.remove(at: 0)
        }
        return result
    }

    /// 二叉树的直径
    var result: Int = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        return 0
    }
    private func _diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        let left = _diameterOfBinaryTree(root?.left)
        let right = _diameterOfBinaryTree(root?.right)
        result = max(left, left + right)
        return max(left, right) + 1
    }
    
    /// 二叉树Z字形遍历
    
}

class TreeNode: NSObject {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    class func createTree(values: [Int]) -> TreeNode {
        var tree: TreeNode?
        for newElement in values {
            if tree == nil {
                tree = TreeNode(newElement)
            } else {
                var p: TreeNode? = tree
                var q: TreeNode? = tree
                while p != nil {
                    if p!.val < newElement {
                        q = p
                        p = p!.right
                    } else {
                        q = p
                        p = p!.left
                    }
                }
                let temp = TreeNode(newElement)
                if q!.val < newElement {
                    q!.right = temp
                } else {
                    q!.left = temp
                }
            }
        }
        return tree!
    }
}
    
    
