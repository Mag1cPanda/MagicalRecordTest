//
//  Beer+CoreDataProperties.h
//  MagicalRecordTest
//
//  Created by Mag1cPanda on 16/4/26.
//  Copyright © 2016年 Mag1cPanda. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Beer.h"

NS_ASSUME_NONNULL_BEGIN

@interface Beer (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSManagedObject *beerDetails;

@end

NS_ASSUME_NONNULL_END
