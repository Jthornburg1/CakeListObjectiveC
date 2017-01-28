//
//  CakeController.h
//  Cake List
//
//  Created by jonathan thornburg on 1/28/17.
//  Copyright © 2017 Stewart Hart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CakeController : NSObject

- (void)getCakesAsynchronously:(NSString *)urlString completion:(void (^)(NSArray *))completion;

- (void)getCakeImageAsynchronously:(NSString *)urlString completion:(void(^)(NSData *))completion;

@end
