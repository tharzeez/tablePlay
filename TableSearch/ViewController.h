//
//  ViewController.h
//  TableSearch
//
//  Created by Tharzeez on 7/19/17.
//  Copyright © 2017 tharzeez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *marray ;
    NSMutableArray *searched;
    
}
@property (weak, nonatomic) IBOutlet UIButton *editButton;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (weak, nonatomic) IBOutlet UISearchBar *mySeachBar;
@end

