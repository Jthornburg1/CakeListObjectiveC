//
//  MasterViewController.m
//  Cake List
//
//  Created by Stewart Hart on 19/05/2015.
//  Copyright (c) 2015 Stewart Hart. All rights reserved.
//

#import "MasterViewController.h"
#import "CakeCell.h"
#import "Cake.h"
#import "CakeController.h"

@interface MasterViewController ()
@property (strong, nonatomic) NSArray *objects;
@property (strong, nonatomic) NSString *urlString;
@property (strong, nonatomic) CakeController *controller;
@property (strong, nonatomic) NSCache *cache;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _urlString = @"https://gist.githubusercontent.com/hart88/198f29ec5114a3ec3460/raw/8dd19a88f9b8d24c23d9960f3300d0c917a4f07c/cake.json";
    self.controller = [CakeController new];
    [self.controller getCakesAsynchronously:self.urlString completion:^(NSArray *objects) {
        self.objects = objects;
        [self.tableView reloadData];
    }];
}

- (UIImage *)getCachedImageForkey:(NSString *)urlString {
    return [self.cache objectForKey:urlString];
}

#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CakeCell *cell = (CakeCell*)[tableView dequeueReusableCellWithIdentifier:@"CakeCell"];
    Cake *cake = self.objects[indexPath.row];
    cell.titleLabel.text = cake.name;
    cell.descriptionLabel.text = cake.descripcion;
    
    UIImage *cachedImage = [self getCachedImageForkey:cake.imageString];
    
    if (cachedImage != nil) {
        NSLog(@"Loading Cached");
        cell.cakeImageView.image = cachedImage;
    } else {
        NSLog(@"Pulling image");
        [self.controller getCakeImageAsynchronously:cake.imageString completion:^(NSData *data) {
            UIImage *cellImage = [[UIImage alloc] initWithData:data];
            [self.cache setObject:cellImage forKey:cake.imageString];
            cell.cakeImageView.image = cellImage;
        }];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
