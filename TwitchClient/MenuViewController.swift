//
//  MenuViewController.swift
//  WatchTwitch
//
//  Created by Артем Климкин on 26/12/2019.
//  Copyright © 2019 Artem Klimkin. All rights reserved.
//

import Cocoa

var changeMenuSection = 0

class MenuViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    //1we71oc0so0wr4ouztap8jw6z6w3ey
//curl -H 'Client-ID: 1we71oc0so0wr4ouztap8jw6z6w3ey' -X GET 'https://api.twitch.tv/helix/streams?game_id=33214'
    
    
    let apiKey = "1we71oc0so0wr4ouztap8jw6z6w3ey"
    @IBOutlet var tableView: NSTableView!
    let section = ["🎮 Games", "🎖 Favorites", "👨‍❤️‍👨 Subscribers"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetCurrentGames.shared.jsonParse()
//
//        guard let url = URL(string: "https://api.twitch.tv/helix/games/top") else {
//            return
//        }
//        print("url")
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.addValue(apiKey, forHTTPHeaderField: "Client-ID")
//
//        URLSession.shared.dataTask(with: request) { (data, request, err) in
//
//            guard let data = data else {return}
//
//            do{
//                let jsonValue = try JSONDecoder().decode(DataUrl.self, from: data)
//                for top in 0...10{
//                    print(jsonValue.data[top].name)
//                }
//
//            }catch let error{
//                print(error)
//            }
//
////            if let str = String(data: data, encoding: .utf8){
////                print(str)
////
////            }
//        }.resume()
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return section.count
    }
    
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {return nil}



        vw.textField?.stringValue = section[row]
        return vw
        
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        if tableView.selectedRow == 0{
            changeMenuSection = 1
            print(changeMenuSection)
        }else{
            changeMenuSection = 2
            print(changeMenuSection)
        }
    }
    
}
