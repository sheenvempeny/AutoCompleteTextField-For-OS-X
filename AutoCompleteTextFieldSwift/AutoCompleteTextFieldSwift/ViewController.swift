//
//  ViewController.swift
//  AutoCompleteTextFieldSwift
//
//  Created by Sheen on 10/4/24.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var box: NSBox!
    
    private lazy var interactor: AutoCompleteTFInteractable = {
        AutoCompleteTFInteractor()
    }()
    
    private lazy var autoCompleteTFViewController: AutoCompleteTFViewController = {
        AutoCompleteTFViewController(interactor: interactor)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        box.contentView = autoCompleteTFViewController.view
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func saveName(sender: AnyObject) {
        interactor.addName(name: autoCompleteTFViewController.textField.stringValue)
    }
    
    func saveChanges() {
        interactor.saveNames()
    }
}
