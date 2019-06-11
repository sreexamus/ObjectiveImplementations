//
//  NewTableViewCell.m
//  ObjectiveImplementations
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/26/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

#import "NewTableViewCell.h"
#import "ObjectiveImplementations-Swift.h"

#define ICON_IMAGE_DIMENSION 45.0f

@interface NewTableViewCell ()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *rightLabel;
@end

@implementation NewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        self.textLabel.font = [UIFont boldSystemFontOfSize:12.0f];
        self.textLabel.textColor = [UIColor brownColor];
        self.detailTextLabel.font = [UIFont boldSystemFontOfSize:8.0f];
        self.detailTextLabel.textColor = [UIColor yellowColor];
        _iconImageView = [UIImageView new];
        [self.contentView pg_addAutoLayoutSubview:_iconImageView];
        [_iconImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
        [_iconImageView pg_constrainToSize:CGSizeMake(ICON_IMAGE_DIMENSION, ICON_IMAGE_DIMENSION)];
        [_iconImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor].active = YES;
        _iconImageView.contentMode = UIViewContentModeCenter;
        
        _rightLabel = [UILabel new];
        _rightLabel.font = [UIFont italicSystemFontOfSize:12.0f];
        [self.contentView pg_addAutoLayoutSubview:_rightLabel];
        [_rightLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor].active = YES;
        [_rightLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10.0f].active = YES;
    }
    
    return self;
    
}


-(void)initWithData: (NSString*) labelName {
    _rightLabel.text = labelName;
}
@end
