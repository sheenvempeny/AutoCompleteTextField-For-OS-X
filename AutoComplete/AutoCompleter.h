//
//  AutoCompleter.h
//  AutoComplete
//
//  Created by Sheen on 12/9/15.
//  Copyright © 2015 Sheen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AutoCompleter : NSObject

//Key for storing value in plist
@property (nonatomic,retain) NSString *key;

//save used name to plist
- (void)saveUsed:(NSString*)Name;
// reterving suggested names
- (NSArray *)suggestedNames:(NSString*)name;


@end
