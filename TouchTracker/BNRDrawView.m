//
//  BNRDrawView.m
//  TouchTracker
//
//  Created by Albert Carter on 2/19/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRDrawView.h"
#import "BNRLine.h"

@interface BNRDrawView()

@property (nonatomic, strong) BNRLine *currentLine;
@property (nonatomic, strong) NSMutableArray *finishedLines;

@end

@implementation BNRDrawView

- (instancetype) initWithFrame:(CGRect)r {
    self = [super initWithFrame:r];
    
    if (self) {
        self.finishedLines = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor grayColor];
//        self.multipleTouchEnabled = YES;
    }
    
    return self;
}

# pragma mark - touches

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *t = [touches anyObject];
    
    // get location out of the touch in view's coordinate system
    CGPoint location = [t locationInView:self];
    
    self.currentLine = [[BNRLine alloc] init];
    self.currentLine.begin = location;
    self.currentLine.end = location;
    
    [self setNeedsDisplay];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *t = [touches anyObject];
    CGPoint location = [t locationInView:self];
    
    self.currentLine.end = location;
    
    [self setNeedsDisplay];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.finishedLines addObject:self.currentLine];
    
    self.currentLine = nil;
    
    [self setNeedsDisplay];
}

# pragma mark - stroke

- (void) strokeLine:(BNRLine *) line {
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 10;
    bp.lineCapStyle = kCGLineCapRound;
    
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    [bp stroke];
}

- (void) drawRect:(CGRect)rect {
    // draw finished lines in black
    for (BNRLine *line in self.finishedLines) {
        [self strokeLine:line];
    }
    
    if (self.currentLine) {
        // if there is a line currently being drawn, do it in red
        [[UIColor redColor] self];
        [self strokeLine:self.currentLine];
    }
}

@end
