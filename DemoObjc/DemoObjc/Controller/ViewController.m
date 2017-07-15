//
//  ViewController.m
//  DemoObjc
//
//  Created by Pulkit on 7/5/17.
//  Copyright © 2017 Pulkeet. All rights reserved.
//

#import "ViewController.h"
#import "cellList.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tblView;
    NSMutableArray *arrData;
}
@end

@implementation ViewController

#pragma mark - Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self setUI];
    [self loadXIB];
    
    [self fetchData:@"http://reviewprototypes.com/projects_dev/exam/exam.json"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Setup UI
-(void)setUI{
    
    
    tblView = [[UITableView alloc]init];
    [tblView setDelegate:self];
    [tblView setDataSource:self];
    [tblView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [tblView setTranslatesAutoresizingMaskIntoConstraints:false];
    [self.view addSubview:tblView];
    
    
    NSArray *verticleConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|"
                                            options:0 metrics:nil views:@{@"view":tblView}];
    
    
    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|"
                                            options:0 metrics:nil views:@{@"view":tblView}];
    
    
    [self.view addConstraints:verticleConstraints];
    [self.view addConstraints:horizontalConstraints];
    
    
}
-(void)loadXIB{
    [tblView registerNib:[UINib nibWithNibName:@"cellList" bundle:nil] forCellReuseIdentifier:@"cellList"];
}


#pragma mark - Table View
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *strCellIdentifier = @"cellList";
    cellList *cell = [tableView dequeueReusableCellWithIdentifier:strCellIdentifier];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self getHeight];
}
-(CGFloat)getHeight
{
    return 100;
}

#pragma mark - Connection
-(void)fetchData:(NSString *)strURL{
    
    
    NSURL *URL = [NSURL URLWithString:strURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      // ...
                                      
                                      
                                      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;

                                      
                                      if ([httpResponse statusCode] == 200) {
                                          
                                          NSDictionary *JSON = [NSJSONSerialization
                                                                JSONObjectWithData: data
                                                                options: NSJSONReadingMutableContainers
                                                                error: nil];
                                          
                                          
                                          NSLog(@"Response : %@",JSON);
                                          

                                      }
                                      
                                     
                                      
                                      

                                  }];
    
    [task resume];


    
}
-(void)downloadData:(NSString *)strURL{
    NSURL *URL = [NSURL URLWithString:strURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request
                                                            completionHandler:
                                              ^(NSURL *location, NSURLResponse *response, NSError *error) {
                                                  
                                                  NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                  
                                                  
                                                  if ([httpResponse statusCode] == 200) {
                                                      
                                                      NSLog(@"Path : %@",location);

                                                      //Update UI in main thread only
                                                     dispatch_async(dispatch_get_main_queue(), ^{

                                                     });
                                                      
                                                      
                                                  }
                                     
                                              }];
    
    [downloadTask resume];
}

@end
