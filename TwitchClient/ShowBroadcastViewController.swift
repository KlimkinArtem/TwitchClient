//
//  ShowBroadcastViewController.swift
//  TwitchClient
//
//  Created by Артем Климкин on 30/12/2019.
//  Copyright © 2019 Artem Klimkin. All rights reserved.
//

import Cocoa

class ShowBroadcastViewController: NSViewController {

    @IBOutlet var imageView: NSImageView!
    @IBOutlet var gameNameLabel: NSTextField!
    
    @IBAction func showTapped(_ sender: Any) {
   
        
        let url = URL(string: correctUrl())!

        if let data = try? Data(contentsOf: url){
            imageView.image = NSImage(data: data)
        }
        
        gameNameLabel.stringValue = topGameImageUrl
        
        print(correctUrl())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
