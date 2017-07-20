//
//  ViewController.m
//  TableSearch
//
//  Created by Tharzeez on 7/19/17.
//  Copyright © 2017 tharzeez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    marray=[[NSMutableArray alloc]initWithObjects:@"Some",@"People",@"Just" ,@"Want" ,@"to", @"watch", @"the", @"world", @"burn", nil];
    searched=[[NSMutableArray alloc]initWithArray:marray];
    self.myTableView.allowsSelectionDuringEditing=YES;
    
}


-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    
}

-(BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if([searchText length]==0){
        [searched removeAllObjects];
        [searched addObjectsFromArray:marray];
        
    }else{
      [searched removeAllObjects];
        for(NSString *items in marray){
            NSRange range=[items rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if(range.location !=NSNotFound){
                [searched addObject:items];
            }
            
        }
    }
    
    [_myTableView reloadData];
       
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [searched count];
   
}





-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}



- (IBAction)editButtonAction:(id)sender {
    static NSInteger count=0;
    count++;
    if(count%2==1){
        [self.myTableView setEditing:YES animated:YES];
    }else{
        [self.myTableView setEditing:NO animated:YES];
    }
    
}




//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:( NSIndexPath *)indexPath{
//    if(editingStyle == UITableViewCellEditingStyleDelete  ){
//        NSLog(@"Is it");
//        [marray removeObjectAtIndex:indexPath.row];
//      
//        [tableView beginUpdates];
//        [self constructTableGroups];
//        [_myTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
//
//        [tableView endUpdates];
//    }
//    [searched removeAllObjects];
//    [searched addObjectsFromArray:marray];
//    [_myTableView reloadData];
//}


-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewRowAction *delete=[UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Delete" handler:^(UITableViewRowAction *  action, NSIndexPath *  indexPath) {
        
        [marray removeObjectAtIndex:indexPath.row];
        [searched removeAllObjects];
        [searched addObjectsFromArray:marray];
        [_myTableView reloadData];
        
    }];
    delete.backgroundColor=[UIColor redColor];
    
    UITableViewRowAction *add=[UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"add" handler:^(UITableViewRowAction *  action, NSIndexPath * indexPath) {
        
   //     [marray addObject:@"added"];
        [marray insertObject:@"lol" atIndex:indexPath.row+1];
        [searched removeAllObjects];
        [searched addObjectsFromArray:marray];
        [_myTableView reloadData];
        
    }];
    add.backgroundColor = [UIColor greenColor];

    UITableViewRowAction *cancel=[UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"Cancel" handler:^(UITableViewRowAction *  action, NSIndexPath *  indexPath) {
        
        [self.myTableView setEditing:NO animated:YES];

        
    }];
    cancel.backgroundColor=[UIColor yellowColor];
    
    return @[delete,add,cancel];
    
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId =@"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellId];
//    NSLog(@"%@",cell);
    
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }
   
    cell.textLabel.text=[searched objectAtIndex:indexPath.row];
    

    
    return cell;
    
}




-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Lolaayi";
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
