//
//  ViewController.m
//  MagicalRecordTest
//
//  Created by Mag1cPanda on 16/4/26.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//

#import "ViewController.h"
#import <MagicalRecord/MagicalRecord.h>
#import "Beer.h"
#import "BeerDetails.h"

#define DefaultContext [NSManagedObjectContext MR_defaultContext]
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self creatData];
//    [self updateData];
    
//    [self deleteData];
    
    [self findData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 增加数据
-(void)creatData {
    Beer *beer = [Beer MR_createEntity];
    beer.name = @"XXXX";
    BeerDetails *beerDetails = [BeerDetails MR_createEntity];
    beerDetails.image = @"someImage";
    beerDetails.rating = @24;
    beerDetails.note = @"someNote";
    
    Beer *asloBeer = [Beer MR_createEntity];
    asloBeer.name = @"aslo";
    BeerDetails *asloBeerDetails = [BeerDetails MR_createEntity];
    asloBeerDetails.image = @"asloImage";
    asloBeerDetails.rating = @28;
    asloBeerDetails.note = @"asloNote";
    
    [DefaultContext MR_saveToPersistentStoreAndWait];
}

#pragma mark - 查找数据
-(void)findData {
    //查找数据库中所有的数据
    NSArray *beerArr = [Beer MR_findAll];
    NSLog(@"beerArr -> %zi",beerArr.count);
    //查找所有并排序
    NSArray *beerSortedArr = [Beer MR_findAllSortedBy:@"name" ascending:YES];
    NSLog(@"beerSortedArr -> %zi",beerSortedArr.count);
    
    //根据属性值查找
    NSArray  *nameEqualAlso = [Beer MR_findByAttribute:@"name" withValue:@"aslo"];
    NSLog(@"nameEqualAlso -> %zi",nameEqualAlso.count);
    
    
    //查找第一条记录
    Beer *firstPerson = [Beer MR_findFirst];
    NSLog(@"--------------------------%@" ,firstPerson.name);
}

#pragma mark - 修改(更新)数据
-(void)updateData {
    NSArray *personArr = [Beer MR_findByAttribute:@"name" withValue:@"aslo"];
    
    for (Beer *person in personArr) {
        person.name = @"Fort";
    }
    [DefaultContext MR_saveToPersistentStoreAndWait];
}

#pragma mark - 删除数据
-(void)deleteData {
    NSArray *personArr = [Beer MR_findByAttribute:@"name" withValue:@"Fort"];
    
    for (Beer *person in personArr) {
        [person MR_deleteEntity];
    }
    
    [DefaultContext MR_saveToPersistentStoreAndWait];
}


@end
