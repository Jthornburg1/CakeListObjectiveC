//
//  Cake.h
//  Cake List
//
//  Created by jonathan thornburg on 1/28/17.
//  Copyright © 2017 Stewart Hart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cake : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *descripcion;
@property (nonatomic, strong) NSString *imageString;

-(instancetype)initWithDictionary: (NSDictionary *)dict;

@end
