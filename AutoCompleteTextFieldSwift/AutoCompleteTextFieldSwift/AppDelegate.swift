//
//  AppDelegate.swift
//  AutoCompleteTextFieldSwift
//
//  Created by Sheen on 10/4/24.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        let window = NSApp.mainWindow
        if let viewController = window?.contentViewController as? ViewController {
            viewController.saveChanges()
        }
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


}

