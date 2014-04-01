//
//  MainViewController.m
//  DragGestureRecognizer
//
//  Created by Wojciech Nagrodzki on 01/04/14.
//  Copyright (c) 2014 Wojciech Nagrodzki. All rights reserved.
//

#import "MainViewController.h"
#import "NGDragGestureRecognizer.h"


@interface MainViewController ()

@property (strong, nonatomic) UIView * containerView;
@property (strong, nonatomic) UIView * draggableView;

@end


@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat diameter = 44;
    
    for (NSInteger row = 1; row < 5; row++) {
        for (NSInteger column = 1; column < 4; column++) {
            
            UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, diameter, diameter)];
            view.center = CGPointMake(column * 80, row * 96);
            view.backgroundColor = [UIColor whiteColor];
            view.layer.cornerRadius = diameter / 2;
            view.layer.borderColor = [UIColor colorWithRed:0.0902 green:0.5765 blue:0.7725 alpha:1.0000].CGColor;
            view.layer.borderWidth = 3;
            
            NGDragGestureRecognizer * gestureRecognizer = [[NGDragGestureRecognizer alloc] initWithTarget:self action:@selector(handleDragGesture:)];
            [view addGestureRecognizer:gestureRecognizer];
            [self.view addSubview:view];
        }
    }
}

- (void)handleDragGesture:(NGDragGestureRecognizer *)gestureRecognizer
{
    UIView * draggedView = gestureRecognizer.view;
    UIView * superview = draggedView.superview;
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        [gestureRecognizer setTranslation:draggedView.center inView:superview];
        [superview bringSubviewToFront:draggedView];
        draggedView.layer.borderColor = [UIColor colorWithRed:0.2784 green:0.7412 blue:0.9412 alpha:1.0000].CGColor;
        return;
    }
    
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        draggedView.center = [gestureRecognizer translationInView:superview];
        return;
    }
    
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded || gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
        draggedView.layer.borderColor = [UIColor colorWithRed:0.0902 green:0.5765 blue:0.7725 alpha:1.0000].CGColor;
        return;
    }
}

@end
