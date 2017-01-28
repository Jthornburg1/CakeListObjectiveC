//
//  Cake.m
//  Cake List
//
//  Created by jonathan thornburg on 1/28/17.
//  Copyright © 2017 Stewart Hart. All rights reserved.
//

#import "Cake.h"

@implementation Cake

-(instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    
    if (self) {
        self.name = dict[@"title"];
        self.descripcion = dict[@"desc"];
        self.imageString = dict[@"image"];
    }
    
    return self;
}

@end
