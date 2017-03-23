//
//  HypnosisView.m
//  iOSBook
//
//  Created by 楚晨晨 on 2017/3/22.
//  Copyright © 2017年 Ccc. All rights reserved.
//

#import "HypnosisView.h"
@interface HypnosisView ()
@property (strong,nonatomic)UIColor *circleColor;
@end
@implementation HypnosisView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGRect bounds = self.bounds;
    CGPoint center;
    center.x = bounds.origin.x +bounds.size.width/2.0;
    center.y = bounds.origin.y +bounds.size.height/2.0;
    float maxRadius =hypot(bounds.size.width,bounds.size.height)/2.0;
    UIBezierPath *path = [[UIBezierPath alloc]init];
    for (float currentRadius = maxRadius; currentRadius>0; currentRadius-=20) {
        [path moveToPoint:CGPointMake(center.x+currentRadius,center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI*2.0  clockwise:YES];
        
    }
    path.lineWidth=10.0;
    [self.circleColor setStroke];
    
    [path stroke];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    float red = (arc4random()%100)/100.0;
    float green = (arc4random()%100)/100.0;
    float blue = (arc4random()%100)/100.0;
    UIColor *randomColor  =[UIColor colorWithRed:red green:green blue:blue alpha:1.0] ;
    self.circleColor = randomColor;
    
}
-(void)setCircleColor:(UIColor *)circleColor{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}
@end
