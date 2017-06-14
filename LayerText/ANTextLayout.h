//
//  ANTextLayout.h
//  LayerText
//
//  Created by Qianrun on 17/1/16.
//  Copyright © 2017年 qianrun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface ANTextLayout : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) CGRect boundsRect;
@property (nonatomic,strong) NSMutableAttributedString* attributedText;

/**
 *  ctFrameRef
 */
@property (nonatomic,assign) CTFrameRef frame;

/**
 *  文字高度
 */
@property (nonatomic,assign) CGFloat textHeight;

/**
 *  文字宽度
 *
 */
@property (nonatomic,assign) CGFloat textWidth;

/**
 *  是否自动适配宽度
 */
@property (nonatomic,assign,getter=isWidthToFit) BOOL widthToFit;

- (void)createFrame;

/**
 *  绘制
 *
 */
- (void)drawInContext:(CGContextRef)context;

@end
