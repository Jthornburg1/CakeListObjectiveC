//
//  CakeController.m
//  Cake List
//
//  Created by jonathan thornburg on 1/28/17.
//  Copyright © 2017 Stewart Hart. All rights reserved.
//

#import "CakeController.h"
#import "Cake.h"

@implementation CakeController


- (void)getCakesAsynchronously:(NSString *)urlString completion:(void (^)(NSArray *))completion {
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            NSLog(@"%@", [error localizedDescription]);
        } else {
            NSMutableArray *responseData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSMutableArray *tempArray = [NSMutableArray new];
            for (int i = 0; i < responseData.count; i++) {
                Cake *newCake = [[Cake alloc] initWithDictionary:responseData[i]];
                [tempArray addObject:newCake];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(tempArray);
            });
        }
    }];
    [task resume];
}

- (void)getCakeImageAsynchronously:(NSString *)urlString completion:(void (^)(NSData *))completion {
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil) {
            NSLog(@"%@", error.localizedDescription);
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(data);
            });
        }
    }];
    [task resume];
}


@end
