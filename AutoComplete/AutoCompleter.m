//
//  AutoCompleter.m
//  AutoComplete
//
//  Created by Sheen on 12/9/15.
//  Copyright © 2015 Sheen. All rights reserved.
//

#import "AutoCompleter.h"

@interface UsedName : NSObject

@property(nonatomic,retain) NSString *name;
@property(nonatomic,assign) NSInteger usedCount;

@end

@implementation UsedName

@synthesize name;
@synthesize usedCount;

- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeInteger:self.usedCount forKey:@"usedCount"];
    
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.name = [decoder decodeObjectForKey:@"name"];
        self.usedCount = [decoder decodeIntegerForKey:@"usedCount"];
       
    }
    return self;
}

@end

@interface AutoCompleter()

@property (nonatomic,retain) NSArray *storedNames;

- (NSArray*)names;

@end


@implementation AutoCompleter

@synthesize key;
@synthesize storedNames;

- (void)dealloc
{
    self.key = nil;
    self.storedNames = nil;
}

- (UsedName*)usedName:(NSString*)name{
    
    for (UsedName *inUsedName in self.names) {
        
        if ([inUsedName.name isEqualToString:name]) {
            return inUsedName;
        }
        
    }
    
    return nil;
}


- (NSArray*)names {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:key];
    NSArray *returnArray = [NSArray array];
    if(encodedObject){
        returnArray = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    }
    
    return returnArray;
    
}

- (void) setKey:(NSString *)inKey{
    
    key = inKey;
    self.storedNames = [self names];
}

- (void)saveUsed:(NSString*)name{
    
    UsedName *usedName = [self usedName:name];
    
    if (nil == usedName) {
        usedName = [UsedName new];
        usedName.name = name;
        usedName.usedCount = 0;
        
        NSMutableArray *arrayToSave = [NSMutableArray arrayWithArray:self.names];
        [arrayToSave addObject:usedName];
        self.storedNames = [NSArray arrayWithArray:arrayToSave];
    }
    
    usedName.usedCount++;
    
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:self.storedNames];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:key];
    [defaults synchronize];
}

- (NSArray *)suggestedNames:(NSString*)name {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name CONTAINS[cd] %@",
                              name];
    NSArray *suggestdNames = [self.storedNames filteredArrayUsingPredicate:predicate];
    //sorting
    NSSortDescriptor *valueDescriptor = [[NSSortDescriptor alloc] initWithKey:@"usedCount" ascending:YES];
    NSArray *descriptors = [NSArray arrayWithObject:valueDescriptor];
    NSArray *sortedArray = [suggestdNames sortedArrayUsingDescriptors:descriptors];
    
    return [sortedArray valueForKeyPath:@"name"];
}


@end
