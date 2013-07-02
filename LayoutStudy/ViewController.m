//
//  ViewController.m
//  LayoutStudy
//
//  Created by Feather Chan on 13-7-1.
//  Copyright (c) 2013年 Feather Chan. All rights reserved.
//

#import "ViewController.h"
#import "UIView+BNLayout.h"

#define SEG_TAG_LEFT    100
#define SEG_TAG_WIDTH   101
#define SEG_TAG_RIGHT   102


@interface ViewController ()

@property (nonatomic,assign) UIView *container;
@property (nonatomic,assign) UIView *subview;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    // it is the container, which is always resized.
    self.container = [[[UIView alloc]initWithLayout:BNLayoutMake(0, 0, AUTO, AUTO, 320, 200)]autorelease];
    self.container.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.container];
    
    // it is the subview, which should resize itself to adjust the superview.
    // you can change the layout pattern of subview and observe the difference.
    self.subview = [[[UIView alloc]initWithLayout:BNLayoutMake(10, 10, 10, 10, AUTO, AUTO)]autorelease];
    self.subview.backgroundColor = [UIColor yellowColor];
    [self.container addSubview:self.subview];


    // control pannel
    UIView *controlPannel = [[[UIView alloc]initWithLayout:BNLayoutMake(AUTO, 0, 0, 0, AUTO, 140)]autorelease];
    controlPannel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:controlPannel];
    
    UISegmentedControl *leftSegControl = [[[UISegmentedControl alloc]initWithItems:@[@"left:10",@"left:AUTO"]]autorelease];
    leftSegControl.tag = SEG_TAG_LEFT;
    leftSegControl.frame = CGRectMake(10, 10, 300, 30);
    leftSegControl.selectedSegmentIndex = 0;
    [leftSegControl addTarget:self action:@selector(pressSegControl:) forControlEvents:UIControlEventValueChanged];
    [controlPannel addSubview:leftSegControl];
    
    UISegmentedControl *widthSegControl = [[[UISegmentedControl alloc]initWithItems:@[@"width:10",@"width:AUTO"]]autorelease];
    widthSegControl.tag = SEG_TAG_WIDTH;
    widthSegControl.frame = CGRectMake(10, 50, 300, 30);
    widthSegControl.selectedSegmentIndex = 1;
    [widthSegControl addTarget:self action:@selector(pressSegControl:) forControlEvents:UIControlEventValueChanged];
    [controlPannel addSubview:widthSegControl];
    
    UISegmentedControl *rightSegControl = [[[UISegmentedControl alloc]initWithItems:@[@"right:10",@"right:AUTO"]]autorelease];
    rightSegControl.tag = SEG_TAG_RIGHT;
    rightSegControl.frame = CGRectMake(10, 90, 300, 30);
    rightSegControl.selectedSegmentIndex = 0;
    [rightSegControl addTarget:self action:@selector(pressSegControl:) forControlEvents:UIControlEventValueChanged];
    [controlPannel addSubview:rightSegControl];
    
}


#pragma mark - User Interaction -

- (void)pressSegControl:(UISegmentedControl *)segControl
{
    if (segControl.tag == SEG_TAG_LEFT) {
        if (segControl.selectedSegmentIndex == 0) {
            self.subview.left = 10;
        }else{
            self.subview.left = AUTO;
        }
    }
    
    if (segControl.tag == SEG_TAG_WIDTH) {
        if (segControl.selectedSegmentIndex == 0) {
            self.subview.width = 10;
        }else{
            self.subview.width = AUTO;
        }
    }
    
    if (segControl.tag == SEG_TAG_RIGHT) {
        if (segControl.selectedSegmentIndex == 0) {
            self.subview.right = 10;
        }else{
            self.subview.right = AUTO;
        }
    }
}


#pragma mark - Animation -

- (void)becomeBigger
{
    [UIView animateWithDuration:1 animations:^{
        self.container.width    = 320;
    } completion:^(BOOL finished) {
        [self performSelector:@selector(becomeSmaller) withObject:nil afterDelay:0.5];
    }];
}

- (void)becomeSmaller
{
    [UIView animateWithDuration:1 animations:^{
        self.container.width    = 50;
    } completion:^(BOOL finished) {
        [self performSelector:@selector(becomeBigger) withObject:nil afterDelay:0.5];
    }];
}

#pragma mark - ViewController Life Cycle -

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Animation begin here
    [self becomeSmaller];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
