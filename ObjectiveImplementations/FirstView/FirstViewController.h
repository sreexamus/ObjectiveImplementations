//
//  FirstViewController.h
//  ObjectiveImplementations
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/25/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewModel.h"

@interface FirstViewController: UIViewController

@property (nonatomic, strong) FirstViewModel *viewModel;

-(instancetype)initWithViewModel: (FirstViewModel *)viewModel;

@end

