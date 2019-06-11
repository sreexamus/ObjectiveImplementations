//
//  FirstViewModel.m
//  ObjectiveImplementations
//
//  Created by Iragam Reddy, Sreekanth Reddy on 5/28/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

#import "FirstViewModel.h"

@implementation FirstViewModel

- (NSArray *)fetchPersonsData {
    People *person1 = [[People alloc]init];
    person1.address = @"Hyd";
    person1.name = @"Ahem";
    
    People *person2 = [[People alloc]init];
    person2.address = @"Hyd";
    person2.name = @"Nahem";
    
    NSArray *allPeople = [[NSArray alloc] initWithObjects:person1,person2, nil];
    return allPeople;
}

@end
