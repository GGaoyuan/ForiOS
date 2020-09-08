////
////  TreeNode.m
////  ForiOS
////
////  Created by 高源 on 2020/8/12.
////  Copyright © 2020 gaoyuan. All rights reserved.
////
//
/////  https://www.cnblogs.com/manji/p/4903990.html
//
//#import "TreeNode.h"
//
//@implementation TreeNode
//
//+ (TreeNode *)createTreeWithValues:(NSArray *)values {
//    TreeNode *root = nil;
//    for (NSInteger i = 0; i < values.count; i++) {
//        NSInteger value = [(NSNumber *)[values objectAtIndex:i] integerValue];
//        root = [TreeNode addTreeNode:root value:value];
//    }
//    return root;
//}
//
//+ (TreeNode *)addTreeNode:(TreeNode *)treeNode value:(NSInteger)value {
//    //根节点不存在，创建节点
//    if (!treeNode) {
//        treeNode = [TreeNode new];
//        treeNode.value = value;
////        NSLog(@"node:%@", @(value));
//    }
//    else if (value <= treeNode.value) {
////        NSLog(@"to left");
//        //值小于根节点，则插入到左子树
//        treeNode.leftNode = [TreeNode addTreeNode:treeNode.leftNode value:value];
//    }
//    else {
////        NSLog(@"to right");
//        //值大于根节点，则插入到右子树
//        treeNode.rightNode = [TreeNode addTreeNode:treeNode.rightNode value:value];
//    }
//    return treeNode;
//}
//
//
//+ (void)preOrder:(TreeNode *)rootNode {
//    if (rootNode) {
//        NSLog(@"pre --- %ld", (long)rootNode.value);
//        [self preOrder: rootNode.leftNode];
//        [self preOrder: rootNode.rightNode];
//    }
//}
//
//+ (void)midOrder:(TreeNode *)rootNode {
//    if (rootNode) {
//        [self midOrder: rootNode.leftNode];
//        NSLog(@"mid --- %ld", (long)rootNode.value);
//        [self midOrder: rootNode.rightNode];
//    }
//}
//
//+ (void)postOrder:(TreeNode *)rootNode {
//    if (rootNode) {
//        [self postOrder: rootNode.leftNode];
//        [self postOrder: rootNode.rightNode];
//        NSLog(@"post --- %ld", (long)rootNode.value);
//    }
//}
//
//+ (NSInteger)depth:(TreeNode *)rootNode {
//    if (rootNode == nil) {
//        return 0;
//    }
////    if (rootNode && rootNode.leftNode == nil && rootNode.rightNode == nil) {
////        return 1;
////    }
////    NSLog(@"NodeValue = %ld", (long)rootNode.value);
//    NSInteger leftDepth = [self depth:rootNode.leftNode];
//    NSLog(@"Left NodeValue = %ld, Deepth = %ld", (long)rootNode.value, leftDepth);
//    NSInteger rightDepth = [self depth:rootNode.rightNode];
//    NSLog(@"Right NodeValue = %ld, Deepth = %ld", (long)rootNode.value, rightDepth);
//    return MAX(leftDepth, rightDepth) + 1;
////    return 0;;
//}
////
//+ (BOOL)balance:(TreeNode *)rootNode {
//    NSInteger left = [self balanceHeight: rootNode.leftNode];
//    NSInteger right = [self balanceHeight: rootNode.rightNode];
//    return YES;
//}
//static NSInteger result = 10;
//+ (NSInteger)balanceHeight:(TreeNode *)rootNode {
//    if (rootNode == nil) {
//        return 0;
//    }
//    NSInteger leftHeight = [self balanceHeight:rootNode.leftNode];
//    NSInteger rightHeight = [self balanceHeight:rootNode.rightNode];
//    return MAX(leftHeight, rightHeight) + 1;
//}
//
//
//
//
//
//
//
//
//+ (void)preOrderTraverseTree:(TreeNode *)rootNode {
//    if (rootNode) {
//        NSLog(@"pre --- %ld", rootNode.value);
//        [self preOrderTraverseTree:rootNode.leftNode];
//        [self preOrderTraverseTree:rootNode.rightNode];
//    }
//}
//
//+ (void)midOrderTraverseTree:(TreeNode *)rootNode {
//    if (rootNode) {
//        [self midOrderTraverseTree:rootNode.leftNode];
//        NSLog(@"mid --- %ld", rootNode.value);
//        [self midOrderTraverseTree:rootNode.rightNode];
//    }
//}
//
//+ (void)postOrderTraverseTree:(TreeNode *)rootNode {
//    if (rootNode) {
//        [self postOrderTraverseTree:rootNode.leftNode];
//        [self postOrderTraverseTree:rootNode.rightNode];
//        NSLog(@"post --- %ld", rootNode.value);
//    }
//}
//
//+ (void)levelTraverseTree:(TreeNode *)rootNode {
//    NSMutableArray<TreeNode *> *queueArray = [NSMutableArray array]; //数组当成队列
//    [queueArray addObject:rootNode];
//    while (queueArray.count > 0) {
//        TreeNode *node = [queueArray firstObject];
//        NSLog(@"pre --- %ld", node.value);
//        [queueArray removeObjectAtIndex:0];
//        if (node.leftNode) {
//            [queueArray addObject:node.leftNode];
//        }
//        if (node.rightNode) {
//            [queueArray addObject:node.rightNode];
//        }
//    }
//}
//
//+ (NSInteger)depthOfTree:(TreeNode *)rootNode {
//    if (!rootNode) {
//        return 0;
//    }
//    if (!rootNode.leftNode && !rootNode.rightNode) {
//        return 1;
//    }
//    //左子树深度
//    NSInteger leftDepth = [self depthOfTree:rootNode.leftNode];
//    //右子树深度
//    NSInteger rightDepth = [self depthOfTree:rootNode.rightNode];
//    return MAX(leftDepth, rightDepth) + 1;
//}
//
//@end
