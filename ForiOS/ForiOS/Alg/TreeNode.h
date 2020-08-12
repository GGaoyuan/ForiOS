//
//  TreeNode.h
//  ForiOS
//
//  Created by 高源 on 2020/8/12.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject

/**
 *  值
 */
@property (nonatomic, assign) NSInteger value;
/**
 *  左节点
 */
@property (nonatomic, strong) TreeNode *leftNode;
/**
 *  右节点
 */
@property (nonatomic, strong) TreeNode *rightNode;

+ (TreeNode *)createTreeWithValues:(NSArray *)values;
/**
*  先序遍历
*  先访问根，再遍历左子树，再遍历右子树
*/
+ (void)preOrderTraverseTree:(TreeNode *)rootNode;
/**
*  中序遍历
*  先遍历左子树，再访问根，再遍历右子树
*/
+ (void)midOrderTraverseTree:(TreeNode *)rootNode;
/**
 *  后序遍历
 *  先遍历左子树，再遍历右子树，再访问根
 */
+ (void)postOrderTraverseTree:(TreeNode *)rootNode;

/**
 *  层次遍历（广度优先）
 */
+ (void)levelTraverseTree:(TreeNode *)rootNode;
/**
 *  二叉树的深度
 */
+ (NSInteger)depthOfTree:(TreeNode *)rootNode;


@end

NS_ASSUME_NONNULL_END
