//
//  AlgEntrance.swift
//  ForiOS
//
//  Created by 高源 on 2020/9/8.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

import UIKit

class AlgEntrance: NSObject {
    @objc public class func start() {
        print("AlgEntrance --- start")
        //fastSort()
        binaryTree()
    }
    
    /// 快速排序
    class func fastSort() {
        let sort = FastSort()
        sort.sort(array: [10, 1, 22, 19, 9, 4, 15])
    }
    
    /// 二叉树
    class func binaryTree() {
        let scale = UIScreen.main.scale
        print(scale)
//        let treeNode = TreeNode.createTree(values: [4, 1, 6, 8, 7, 2, 3, 5, 9, 0, 10])
        let treeNode = TreeNode.createTree(values: [4, 1, 6, 8, 2, 5, 0])
        let solution = TreeNodeSolution()
        //先序遍历
        print("先序遍历")
        solution.preOrder(treeNode)
        //中序遍历
        print("中序遍历")
        solution.midOrder(treeNode)
        //后序遍历
        print("后序遍历")
        solution.postOrder(treeNode)
        //深度
        print("深度 --- \(solution.depth(treeNode))")
        //是否是平衡树
        print("平衡树 --- \(solution.isBalanced(treeNode))")
    }
}
