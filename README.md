# AutoCompleteTextField-For-OS-X
NSTextField supports Auto Complete

Must do
------

1) use the AutoCompleteTextField key 

2) Use NSTextFieldDelegate

- (void)controlTextDidChange:(NSNotification *)notification {
   
    [[[notification userInfo] objectForKey:@"NSFieldEditor"] complete:nil];
}

- (NSArray *)control:(NSControl *)control textView:(NSTextView *)textView completions:(NSArray *)words forPartialWordRange:(NSRange)charRange indexOfSelectedItem:(NSInteger *)index
{
     AutoCompleteTextField *textField = (AutoCompleteTextField*)control;
    *index = -1;
    return textField.suggestNames;
}

