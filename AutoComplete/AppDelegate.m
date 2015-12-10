//
//  AppDelegate.m
//  AutoComplete
//
//  Created by Sheen on 12/9/15.
//  Copyright © 2015 Sheen. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <NSTextFieldDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (nonatomic,assign) IBOutlet AutoCompleteTextField *nameField;

@end

@implementation AppDelegate

@synthesize nameField;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    [nameField setDelegate:self];
    [nameField setKey:@"userName"];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(IBAction)saveName:(id)sender{
    
    [nameField saveRecent];
}


- (void)controlTextDidChange:(NSNotification *)notification {
   
    [[[notification userInfo] objectForKey:@"NSFieldEditor"] complete:nil];
}

- (NSArray *)control:(NSControl *)control textView:(NSTextView *)textView completions:(NSArray *)words forPartialWordRange:(NSRange)charRange indexOfSelectedItem:(NSInteger *)index
{
     AutoCompleteTextField *textField = (AutoCompleteTextField*)control;
    *index = -1;
    return textField.suggestNames;
}

@end
