//
//  GamesMenuViewController.swift
//  WatchTwitch
//
//  Created by Артем Климкин on 26/12/2019.
//  Copyright © 2019 Artem Klimkin. All rights reserved.
//

import Cocoa


class SecondMenuViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    let getGames = GetCurrentGames()
    
    let section = ["🎮 Games", "🎖 Games", "👨‍❤️‍👨 Games"]
    let section2 = ["🎮 FFGames", "🎖 FFGames", "👨‍❤️‍👨 FFGames","🎮 FFGames", "🎖 FFGames", "👨‍❤️‍👨 FFGames","🎮 FFGames", "🎖 FFGames", "👨‍❤️‍👨 FFGames","🎮 FFGames", "🎖 FFGames"]
    
    @IBOutlet var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.tableView.reloadData()
        }
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return GetCurrentGames.shared.games.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {return nil}
        
        if changeMenuSection == 0 {
            return nil
        }else if changeMenuSection == 1{
            vw.textField?.stringValue = GetCurrentGames.shared.games[row]
            return vw
        }else{
            vw.textField?.stringValue = section2[row]
            return vw
        }
        
    }
    
    
    
}
