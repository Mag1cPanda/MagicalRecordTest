# MagicalRecordTest
##使用方法：
###Step1：将MagicalRecord.framework拷贝到项目中，然后添加CoreData.framework

###Step2：
* 创建模型文件

![创建模型](https://github.com/Mag1cPanda/MyPictcures/blob/master/创建模型-0%402x.png)

* 在模型文件中添加实体和属性

![添加实体和属性](https://github.com/Mag1cPanda/MyPictcures/blob/master/添加实体和属性.png)

* 创建模型对象子类

![创建模型对象子类](https://github.com/Mag1cPanda/MyPictcures/blob/master/创建模型对象子类.png)

* 选中所有，点击创建

![选中所有](https://github.com/Mag1cPanda/MyPictcures/blob/master/选中所有.png)

###Step3 数据库操作

* 增

```objc
#define DefaultContext [NSManagedObjectContext MR_defaultContext]
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

```

* 删

```objc
-(void)deleteData {
    NSArray *personArr = [Beer MR_findByAttribute:@"name" withValue:@"Fort"];
    
    for (Beer *person in personArr) {
        [person MR_deleteEntity];
    }
    
    [DefaultContext MR_saveToPersistentStoreAndWait];
}
```

* 改

```objc
-(void)updateData {
    NSArray *personArr = [Beer MR_findByAttribute:@"name" withValue:@"aslo"];
    
    for (Beer *person in personArr) {
        person.name = @"Fort";
    }
    [DefaultContext MR_saveToPersistentStoreAndWait];
}
```

* 查

```objc
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

```




