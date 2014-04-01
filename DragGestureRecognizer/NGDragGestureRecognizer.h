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

#import <UIKit/UILongPressGestureRecognizer.h>


@interface NGDragGestureRecognizer : UILongPressGestureRecognizer

/**
 * The translation of the pan gesture in the coordinate system of the specified view.
 * The x and y values report the total translation over time. They are not delta values from the last time that the translation was reported. 
 * Apply the translation value to the state of the view when the gesture is first recognized—do not concatenate the value each time the handler is called.
 * 
 * @param view The view in whose coordinate system the translation of the long press pan gesture should be computed. 
               If you want to adjust a view's location to keep it under the user's finger, request the translation in that view's superview's coordinate system.
 * @return A point identifying the new location of a view in the coordinate system of its designated superview.
 */
- (CGPoint)translationInView:(UIView *)view;

/**
 * Sets the translation value in the coordinate system of the specified view.
 * Changing the translation value resets the velocity of the pan.
 * 
 * @param translation A point that identifies the new translation value.
 * @param view A view in whose coordinate system the translation is to occur.
 */
- (void)setTranslation:(CGPoint)translation inView:(UIView *)view;

@end
