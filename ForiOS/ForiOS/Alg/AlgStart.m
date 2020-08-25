//
//  AlgStart.m
//  ForiOS
//
//  Created by 高源 on 2020/8/12.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import "AlgStart.h"
#import "TreeNode.h"
#import "ForiOS-Swift.h"

@implementation AlgStart
    
+ (void)start {
    NSLog(@"111");
    //快速排序
    FastSort *fastSort = [FastSort new];
    [fastSort sortWithArray:@[@10, @1, @22, @19, @9, @4, @15]];
    return;
    
    
    TreeNode *root = [TreeNode createTreeWithValues:@[@4, @1, @6, @8, @7, @2, @3, @5, @9, @0]];
    NSLog(@"");
//    [TreeNode preOrderTraverseTree:root];
//    [TreeNode midOrderTraverseTree:root];
//    [TreeNode postOrderTraverseTree:root];
//    [TreeNode levelTraverseTree:root];
    [TreeNode depthOfTree: root];
    NSLog(@"%ld", [TreeNode depthOfTree: root]);
}

@end
