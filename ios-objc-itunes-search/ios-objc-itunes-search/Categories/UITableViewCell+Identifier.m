//
//  UITableViewCell+Identifier.m
//  ios-objc-itunes-search
//
//  Created by OkuderaYuki on 2017/09/24.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

#import "UITableViewCell+Identifier.h"

@implementation UITableViewCell (Identifier)
+ (NSString *)identifier {
    return NSStringFromClass([self class]);
}
@end
