import Cocoa


class SecondMenuViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {


    let section = ["🎮 Games", "🎖 Games", "👨‍❤️‍👨 Games"]
    let section2 = ["🎮 FFGames", "🎖 FFGames", "👨‍❤️‍👨 FFGames","🎮 FFGames", "🎖 FFGames", "👨‍❤️‍👨 FFGames","🎮 FFGames", "🎖 FFGames", "👨‍❤️‍👨 FFGames","🎮 FFGames", "🎖 FFGames"]
    
    @IBOutlet var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let _ = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            if prepareVariable == 0{
                return
            }else if prepareVariable == 1{
                self.tableView.reloadData()
                prepareVariable = 0
            }else if prepareVariable == 2{
                self.tableView.reloadData()
                prepareVariable = 0
            }
        }
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return GetCurrentGames.shared.topGamesNameArray.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {return nil}
                
        
        if changeMenuSection == 0 {
            return nil
        }else if changeMenuSection == 1{
            vw.textField?.stringValue = GetCurrentGames.shared.topGamesNameArray[row]
            return vw
        }else{
            vw.textField?.stringValue = section2[row]
            return vw
        }
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        topGameId = GetCurrentGames.shared.topGamesIdArray[tableView.selectedRow]
        topGameName = GetCurrentGames.shared.topGamesNameArray[tableView.selectedRow]
        topGameImageUrl = GetCurrentGames.shared.topGamesImageUrlArray[tableView.selectedRow]
        
        
        
    }
            
}
