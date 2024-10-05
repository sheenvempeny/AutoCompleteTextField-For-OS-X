//
//  AutoCompleteTFViewController.swift
//  AutoCompleteTextFieldSwift
//
//  Created by Sheen on 10/4/24.
//

import Cocoa

class AutoCompleteTFViewController: NSViewController {
    private(set) var textField: NSTextField!
    var interactor: AutoCompleteTFInteractable
    
    init(interactor: AutoCompleteTFInteractable) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Storyboard are a pain")
    }
    
    override func loadView() {
        view = NSView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField = NSTextField()
        view.addSubview(textField)
        textField.delegate = self
        layoutSubViews()
    }
}

private extension AutoCompleteTFViewController {
    func layoutSubViews() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textField.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
}

extension AutoCompleteTFViewController: NSTextFieldDelegate {
    
    func controlTextDidChange(_ obj: Notification) {
        guard let userInfo = obj.userInfo,
        let fieldEditor = userInfo["NSFieldEditor"] as? NSTextView else {
            return
        }
        fieldEditor.complete(nil)
    }
    
    func control(_ control: NSControl, textView: NSTextView, completions words: [String], forPartialWordRange charRange: NSRange, indexOfSelectedItem index: UnsafeMutablePointer<Int>) -> [String] {
        let names = interactor.search(name: textField.stringValue)
        index.pointee = -1
        return names
    }
}
