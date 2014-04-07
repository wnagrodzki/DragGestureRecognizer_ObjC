/*
 * Copyright (c) 2014 Wojciech Nagrodzki
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "NGDragGestureRecognizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>


@interface NGDragGestureRecognizer ()

@property (assign, nonatomic) CGPoint initialTouchLocationInReferenceView;
@property (strong, nonatomic) NSMapTable * initialTouchLocationsInViews;

@end


@implementation NGDragGestureRecognizer

#pragma mark - Public Instance Methods

- (CGPoint)translationInView:(UIView *)view
{
    CGPoint currentLocation = [self locationInView:view];
    NSValue * initialLocationValue = [self.initialTouchLocationsInViews objectForKey:view];
    CGPoint initialLocation = initialLocationValue ? initialLocationValue.CGPointValue : [[self referenceView] convertPoint:self.initialTouchLocationInReferenceView toView:view];
    return CGPointMake(currentLocation.x - initialLocation.x, currentLocation.y - initialLocation.y);
}

- (void)setTranslation:(CGPoint)translation inView:(UIView *)view
{
    CGPoint currentLocation = [self locationInView:view];
    CGPoint initialLocation = CGPointMake(currentLocation.x - translation.x, currentLocation.y - translation.y);
    NSValue * initialLocationValue = [NSValue valueWithCGPoint:initialLocation];
    [self.initialTouchLocationsInViews setObject:initialLocationValue forKey:view];
}

#pragma mark - Overriden

- (void)setState:(UIGestureRecognizerState)state
{
    [super setState:state];
    
    if (state == UIGestureRecognizerStateBegan) {
        [self.initialTouchLocationsInViews removeAllObjects];
        self.initialTouchLocationInReferenceView = [self locationInView:[self referenceView]];
    }
}

#pragma mark - Private Instance Methods

- (NSMapTable *)initialTouchLocationsInViews
{
    if (_initialTouchLocationsInViews == nil) {
        _initialTouchLocationsInViews = [NSMapTable weakToStrongObjectsMapTable];
    }
    return _initialTouchLocationsInViews;
}

#pragma mark - Private Methods

- (UIView *)referenceView
{
    return self.view;
}

@end
