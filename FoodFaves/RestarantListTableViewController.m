//
//  RestarantListTableViewController.m
//  FoodFaves
//
//  Created by Gregory Weiss on 8/10/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "RestarantListTableViewController.h"
#import "RestaurantFormViewController.h"
#import "Restaurant.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface RestarantListTableViewController ()

@property(strong, nonatomic) NSMutableArray *goodRestaurants;
@property(strong, nonatomic) NSManagedObjectContext *moc;
@property (strong, nonatomic) Restaurant *bRestaurant;

@end

@implementation RestarantListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.goodRestaurants = [[NSMutableArray alloc] init];
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.moc = appDelegate.managedObjectContext;
    
    // This block will fetch our counter objects from Core Data and load them in the tableView
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([Restaurant class])];
    NSError *error = nil;
    NSArray *restaurantsFromCoreData = [self.moc executeFetchRequest:fetchRequest error:&error];
    if (error)
    {
        NSLog(@"Could not fetch from moc: %@", [error localizedDescription]);
    }
    else
    {
        [self.goodRestaurants addObjectsFromArray:restaurantsFromCoreData];
    }
    if (self.goodRestaurants.count != 0)
    {
        
        self.bRestaurant = self.goodRestaurants[0];
        if (self.bRestaurant.restaurantName != nil)
            //[self configureAnnotations];
        {
            NSLog(@"%@ restName", self.bRestaurant.restaurantName);
            NSLog(@"%@ restNotes", self.bRestaurant.restaurantNotes);
            NSLog(@"%hd restRating", self.bRestaurant.restaurantRating);
        }
    }
   else if (self.goodRestaurants.count > 1)
    {
        
        self.bRestaurant = self.goodRestaurants[1];
        //[self configureAnnotations];
        NSLog(@"%@ restName", self.bRestaurant.restaurantName);
        NSLog(@"%@ restNotes", self.bRestaurant.restaurantNotes);
        NSLog(@"%hd restRating", self.bRestaurant.restaurantRating);
        
    }
   else if (self.goodRestaurants.count > 2)
    {
        
        self.bRestaurant = self.goodRestaurants[2];
        //[self configureAnnotations];
        NSLog(@"%@ restName", self.bRestaurant.restaurantName);
        NSLog(@"%@ restNotes", self.bRestaurant.restaurantNotes);
        NSLog(@"%hd restRating", self.bRestaurant.restaurantRating);
    }
    


    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.goodRestaurants.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RestaurantCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    Restaurant *theRestaurant = self.goodRestaurants[indexPath.row];
    cell.textLabel.text = @"";
    cell.detailTextLabel.text = @"";
    
    cell.textLabel.text = theRestaurant.restaurantName;
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"%hd / 10", theRestaurant.restaurantRating];
    cell.detailTextLabel.text = theRestaurant.restaurantNotes;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
