//
//  AutoCompleteTextField.h
//  AutoComplete
//
//  Created by Sheen on 12/9/15.
//  Copyright © 2015 Sheen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>


@interface AutoCompleteTextField : NSTextField

@property(nonatomic,retain) NSString *key;
//save Recent Name
- (void)saveRecent;
//suggested Names
- (NSArray*)suggestNames;

@end
