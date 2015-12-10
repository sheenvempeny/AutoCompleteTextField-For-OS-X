//
//  AutoCompleteTextField.m
//  AutoComplete
//
//  Created by Sheen on 12/9/15.
//  Copyright © 2015 Sheen. All rights reserved.
//

#import "AutoCompleteTextField.h"
#import "AutoCompleter.h"


@interface AutoCompleteTextField()

@property (nonatomic,retain) AutoCompleter *autoCompleter;



@end


@implementation AutoCompleteTextField

@synthesize autoCompleter;
@synthesize key;


- (void)dealloc
{
    self.autoCompleter = nil;
   
}

- (void)setKey:(NSString *)inKey{
    key = inKey;
    self.autoCompleter = [AutoCompleter new];
    self.autoCompleter.key = key;
   
}

- (NSArray*)suggestNames{
    
    NSArray *suggestedNames = [self.autoCompleter suggestedNames:self.stringValue];
    return suggestedNames;
}


-(void)saveRecent{
    
    [self.autoCompleter saveUsed:self.stringValue];
}




@end
