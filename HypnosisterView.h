//
//  HypnosisterView.h
//  Hypnosister
//
//  Created by Richard Millet on 5/30/12.
//  Copyright (c) 2011-2012 Trioser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HypnosisterView : UIView

@property (strong, nonatomic) UIColor *lineColor;
@property (strong, nonatomic) NSString *text;

- (id)initWithFrame:(CGRect)frame andColor:(UIColor *)color;

@end
