//
//  HypnosisViewController.m
//  iOSBook
//
//  Created by 楚晨晨 on 2017/3/22.
//  Copyright © 2017年 Ccc. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"
@interface HypnosisViewController ()<UITextFieldDelegate>

@end

@implementation HypnosisViewController

-(void)loadView{
   
CGRect frame = [UIScreen mainScreen].bounds;
    HypnosisView *hyfirstView  =[[HypnosisView alloc]initWithFrame:frame];
    CGRect textFieldRect =CGRectMake(40, 70, 240, 30);
    UITextField *textField =[[UITextField alloc]initWithFrame:textFieldRect];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"cuimianwo";
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    
    [hyfirstView addSubview:textField];
    
    self.view = hyfirstView;
    self.view.backgroundColor =[UIColor clearColor];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"%@",textField.text);
    [self dramHyNoticeMessage:textField.text];
    textField.text=@"";
    [textField resignFirstResponder];
    
    return  YES;
    
}

-(void)dramHyNoticeMessage:(NSString*)message{

    for (int i=0; i<20; i++) {
        UILabel *messageLabel =[[UILabel alloc]init];
        messageLabel.backgroundColor =[UIColor clearColor];
        messageLabel.textColor = [UIColor whiteColor];
        messageLabel.text = message;
        [messageLabel sizeToFit];
        int width = (int)(self.view.bounds.size.width-messageLabel.bounds.size.width);
        int x =arc4random() %width;
        int height = (int)(self.view.bounds.size.height-messageLabel.bounds.size.height);
        int y = arc4random()%height;
        CGRect frame =messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        [self.view addSubview: messageLabel];
        
       
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    UIScrollView *scrollView =[[UIScrollView alloc]initWithFrame:self.view.bounds];
//    [scrollView setPagingEnabled:YES];
//    
//    [self.view addSubview:scrollView];
//    CGRect screenRect =self.view.bounds;
//    HypnosisView *hyfirstView  =[[HypnosisView alloc]initWithFrame:screenRect];
//    [scrollView addSubview: hyfirstView];
//    screenRect.origin.x +=screenRect.size.width;
//
//    HypnosisView *hytwoView  =[[HypnosisView alloc]initWithFrame:screenRect];
//    [scrollView addSubview: hytwoView];
//    
//    CGRect bigRect = self.view.bounds;
//    bigRect.size.width *=2.0;
////    bigRect.size.height *=2.0;
//    scrollView.contentSize =bigRect.size;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
