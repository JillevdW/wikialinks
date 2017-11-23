//
//  UploadViewController.swift
//  Wikia_links
//
//  Created by Jille van der Weerd on 24/09/2017.
//  Copyright © 2017 De Programmeermeneer. All rights reserved.
//

import Cocoa

class UploadViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        if let wikiaString = Defaults.defaults.string(forKey: "wikiaText") {
            wikiaTextField.stringValue = wikiaString
        }
    }
    
    @IBOutlet weak var wikiaTextField: NSTextField!
    
    @IBOutlet weak var imageTextField: NSTextField!
    
    
    
    @IBAction func uploadAction(_ sender: Any) {
        let finalText : String
        let imageText = imageTextField.stringValue
        let formattedText = imageText.replacingOccurrences(of: " ", with: "_")
        finalText = formattedText
        
        if let url = URL(string: "http://\(wikiaTextField.stringValue).wikia.com/wiki/Special:Upload?wpDestFile=\(finalText).png"), NSWorkspace.shared.open(url) {
            print("default browser was successfully opened")
        }
    }
    
    
    
}

extension UploadViewController {
    // MARK: Storyboard instantiation
    static func freshController() -> UploadViewController {
        //1.
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        //2.
        let identifier = NSStoryboard.SceneIdentifier(rawValue: "UploadViewController")
        //3.
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? UploadViewController else {
            fatalError("Why cant i find UploadViewController? - Check Main.storyboard")
        }
        return viewcontroller
    }
}
