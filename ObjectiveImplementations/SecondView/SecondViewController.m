//
//  SecondViewController.m
//  ObjectiveImplementations
//
//  Created by Iragam Reddy, Sreekanth Reddy on 6/5/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *lastNameLabel;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _nameLabel = [[UILabel alloc] init];
    _lastNameLabel = [[UILabel alloc] init];
    
    // Do any additional setup after loading the view.
}

-(void)setTheData: (NSString *) firstName lastName: (NSString *) lastName {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
