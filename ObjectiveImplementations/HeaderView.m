//
//  HeaderView.m
//  ObjectiveImplementations
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/26/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

#import "HeaderView.h"
#import "ObjectiveImplementations-Swift.h"

@interface HeaderView ()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *fullNameLabel;

@end

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _iconImageView = [UIImageView new];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        
        _fullNameLabel = [UILabel new];
        _fullNameLabel.textColor = [UIColor darkTextColor];
        _fullNameLabel.font = [UIFont boldSystemFontOfSize:6.0f];
        
        [self pg_addAutoLayoutSubview:_iconImageView];
        [self pg_addAutoLayoutSubview:_fullNameLabel];
        
        [_iconImageView pg_constrainToSize:CGSizeMake(80.0f, 80.0f)];
        [_iconImageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
        [_fullNameLabel.leadingAnchor constraintEqualToAnchor:_iconImageView.trailingAnchor constant:4].active = YES;
        [_fullNameLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
        [_iconImageView setImage: [UIImage imageNamed:@"slider-control-brightness"]];
    }
    
    return self;
}

- (void)initWithData: (NSString *) title {
    _fullNameLabel.text = title;
}

@end
