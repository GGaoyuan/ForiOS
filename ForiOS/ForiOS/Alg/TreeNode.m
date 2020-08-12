//
//  TreeNode.m
//  ForiOS
//
//  Created by 高源 on 2020/8/12.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

///  https://www.cnblogs.com/manji/p/4903990.html

#import "TreeNode.h"

@implementation TreeNode

+ (TreeNode *)createTreeWithValues:(NSArray *)values {
    
    TreeNode *root = nil;
    for (NSInteger i = 0; i < values.count; i++) {
        NSInteger value = [(NSNumber *)[values objectAtIndex:i] integerValue];
        root = [TreeNode addTreeNode:root value:value];
    }
    return root;
}

+ (TreeNode *)addTreeNode:(TreeNode *)treeNode value:(NSInteger)value {
    //根节点不存在，创建节点
    if (!treeNode) {
        treeNode = [TreeNode new];
        treeNode.value = value;
        NSLog(@"node:%@", @(value));
    }
    else if (value <= treeNode.value) {
        NSLog(@"to left");
        //值小于根节点，则插入到左子树
        treeNode.leftNode = [TreeNode addTreeNode:treeNode.leftNode value:value];
    }
    else {
        NSLog(@"to right");
        //值大于根节点，则插入到右子树
        treeNode.rightNode = [TreeNode addTreeNode:treeNode.rightNode value:value];
    }
    return treeNode;
}

+ (void)preOrderTraverseTree:(TreeNode *)rootNode {
    if (rootNode) {
        NSLog(@"pre --- %ld", rootNode.value);
        [self preOrderTraverseTree:rootNode.leftNode];
        [self preOrderTraverseTree:rootNode.rightNode];
    }
}

+ (void)midOrderTraverseTree:(TreeNode *)rootNode {
    if (rootNode) {
        [self preOrderTraverseTree:rootNode.leftNode];
        NSLog(@"pre --- %ld", rootNode.value);
        [self preOrderTraverseTree:rootNode.rightNode];
    }
}

+ (void)postOrderTraverseTree:(TreeNode *)rootNode {
    if (rootNode) {
        [self postOrderTraverseTree:rootNode.leftNode];
        [self postOrderTraverseTree:rootNode.rightNode];
        NSLog(@"pre --- %ld", rootNode.value);
    }
}

+ (void)levelTraverseTree:(TreeNode *)rootNode {
    NSMutableArray<TreeNode *> *queueArray = [NSMutableArray array]; //数组当成队列
    [queueArray addObject:rootNode];
    while (queueArray.count > 0) {
        TreeNode *node = [queueArray firstObject];
        NSLog(@"pre --- %ld", node.value);
        [queueArray removeObjectAtIndex:0];
        if (node.leftNode) {
            [queueArray addObject:node.leftNode];
        }
        if (node.rightNode) {
            [queueArray addObject:node.rightNode];
        }
    }
}

+ (NSInteger)depthOfTree:(TreeNode *)rootNode {
    if (!rootNode) {
        return 0;
    }
    if (!rootNode.leftNode && !rootNode.rightNode) {
        return 1;
    }
    //左子树深度
    NSInteger leftDepth = [self depthOfTree:rootNode.leftNode];
    //右子树深度
    NSInteger rightDepth = [self depthOfTree:rootNode.rightNode];
    
    
    return MAX(leftDepth, rightDepth) + 1;
}

@end
