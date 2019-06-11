//
//  PGViewEdge.h
//  SmartThings
//
//  Created by Brendon Justin on 1/27/17.
//  Copyright © 2017 Physical Graph. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Edges of a view. See `UIView.pg_constrainToSuperview(edges:insets:relativeToMargins:)`
 for example uses.
 
 Not declared as a Swift option set type because then it would not be usable from Objective-C.
 */
typedef NS_OPTIONS(NSUInteger, PGViewEdge) {
    PGViewEdgeTop = 1 << 0,
    PGViewEdgeLeading = 1 << 1,
    PGViewEdgeBottom = 1 << 2,
    PGViewEdgeTrailing = 1 << 3,
    PGViewEdgeTopAndBottom = PGViewEdgeTop | PGViewEdgeBottom,
    PGViewEdgeLeadingAndTrailing = PGViewEdgeLeading | PGViewEdgeTrailing,
    PGViewEdgeAll = PGViewEdgeTopAndBottom | PGViewEdgeLeadingAndTrailing,
};
