
//
//  ANTextLayout.m
//  LayerText
//
//  Created by Qianrun on 17/1/16.
//  Copyright © 2017年 qianrun. All rights reserved.
//

#import "ANTextLayout.h"

@interface ANTextLayout ()

@end

@implementation ANTextLayout

- (id)init {
    self = [super init];
    if (self) {
        self.text = nil;
        self.attributedText = nil;
        self.boundsRect = CGRectZero;
        self.widthToFit = YES;
    }
    return self;
}

#pragma mark -Public
- (void)createFrame {
    if (_attributedText == nil) {
        return ;
    }
    if (_textHeight > 0) {
        return ;
    }
    CTFramesetterRef ctFrameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)_attributedText);
    CGSize suggestSize = CTFramesetterSuggestFrameSizeWithConstraints(ctFrameSetter,
                                                                      CFRangeMake(0, _attributedText.length),
                                                                      NULL,
                                                                      CGSizeMake(self.boundsRect.size.width, CGFLOAT_MAX),
                                                                      NULL);
    _textHeight = suggestSize.height;
    _textWidth = suggestSize.width;
    if (self.isWidthToFit) {
        self.boundsRect = CGRectMake(self.boundsRect.origin.x, self.boundsRect.origin.y, suggestSize.width, suggestSize.height);
    } else {
        self.boundsRect = CGRectMake(self.boundsRect.origin.x, self.boundsRect.origin.y, self.boundsRect.size.width, suggestSize.height);
    }
    CGMutablePathRef textPath = CGPathCreateMutable();
    CGPathAddRect(textPath, NULL, self.boundsRect);
    _frame = CTFramesetterCreateFrame(ctFrameSetter, CFRangeMake(0, 0), textPath, NULL);
    CFRelease(ctFrameSetter);
    CFRelease(textPath);
}

#pragma mark - Draw
- (void)drawInContext:(CGContextRef)context {
    @autoreleasepool {
        CGContextSaveGState(context);
        CGContextSetTextMatrix(context,CGAffineTransformIdentity);
        CGContextTranslateCTM(context, self.boundsRect.origin.x, self.boundsRect.origin.y);
        CGContextTranslateCTM(context, 0, self.boundsRect.size.height);
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextTranslateCTM(context, - self.boundsRect.origin.x, -self.boundsRect.origin.y);
        CTFrameDraw(self.frame, context);
        CGContextRestoreGState(context);
//        if (self.attachs.count == 0) {
//            return;
//        }
//        for (NSInteger i = 0; i < self.attachs.count; i ++) {
//            LWTextAttach* attach = self.attachs[i];
//            CGContextSaveGState(context);
//            CGContextTranslateCTM(context, self.boundsRect.origin.x, self.boundsRect.origin.y);
//            CGContextTranslateCTM(context, 0, self.boundsRect.size.height);
//            CGContextScaleCTM(context, 1.0, -1.0);
//            CGContextTranslateCTM(context, - self.boundsRect.origin.x, -self.boundsRect.origin.y);
//            CGContextDrawImage(context,attach.imagePosition,attach.image.CGImage);
//            CGContextRestoreGState(context);
//        }
    }
}

#pragma mark -Private
- (void)_resetFrameRef {
    if (_frame) {
        CFRelease(_frame);
        _frame = nil;
    }
    _textHeight = 0;
}

- (NSMutableAttributedString *)_createAttributedStringWithText:(NSString *)text {
    if (text.length <= 0) {
        return [[NSMutableAttributedString alloc]init];
    }
    // 创建属性文本
    NSMutableAttributedString* attbutedString = [[NSMutableAttributedString alloc]initWithString:text];
    // 添加颜色属性
//    [self _mutableAttributedString:attbutedString
//        addAttributesWithTextColor:_textColor
//                           inRange:NSMakeRange(0, text.length)];
    // 添加字体属性
//    [self _mutableAttributedString:attbutedString
//             addAttributesWithFont:_font
//                           inRange:NSMakeRange(0, text.length)];
    // 添加文本段落样式
//    [self _mutableAttributedString:attbutedString addAttributesWithLineSpacing:_linespace
//                     textAlignment:_textAlignment
//                     lineBreakMode:_lineBreakMode
//                           inRange:NSMakeRange(0, text.length)];
    //添加下划线式样
//    [self _mutableAttributedString:attbutedString addAttributesWithUnderlineStyle:_underlineStyle
//                           inRange:NSMakeRange(0, text.length)];
    
    return attbutedString;
}

#pragma mark -Setter
- (void)setText:(NSString *)text {
    
    [self _resetFrameRef];
    
    _attributedText = [self _createAttributedStringWithText:text];
    
}

@end
