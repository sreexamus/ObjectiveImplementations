//
//  FirstViewModel+FetchData.m
//  ObjectiveImplementations
//
//  Created by Iragam Reddy, Sreekanth Reddy on 6/4/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

#import "FirstViewModel+FetchData.h"

@implementation FirstViewModel (FetchData)
- (NSArray *)fetchPersonsData {
    
    People *person1 = [[People alloc]init];
    person1.address = @"Hyd";
    person1.name = @"From Category1";
    
    People *person2 = [[People alloc]init];
    person2.address = @"Hyd";
    person2.name = @"From Category2";
    
    NSArray *allPeople = [[NSArray alloc] initWithObjects:person1,person2, nil];
    return allPeople;
}
@end
