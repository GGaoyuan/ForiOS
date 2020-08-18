//
//  AlgStart.m
//  ForiOS
//
//  Created by 高源 on 2020/8/12.
//  Copyright © 2020 gaoyuan. All rights reserved.
//

#import "AlgStart.h"
#import "TreeNode.h"
@implementation AlgStart
    
+ (void)start {
    NSLog(@"111");
    
    
    
    
    
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
