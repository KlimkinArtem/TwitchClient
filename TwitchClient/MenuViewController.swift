import Cocoa


class MenuViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

//1we71oc0so0wr4ouztap8jw6z6w3ey
//curl -H 'Client-ID: 1we71oc0so0wr4ouztap8jw6z6w3ey' -X GET 'https://api.twitch.tv/helix/streams?game_id=509658'
    
    
    @IBOutlet var tableView: NSTableView!
    let section = ["🎮 Games", "🕵🏻‍♂️ Search", "👨‍❤️‍👨 Subscribers"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GetCurrentGames.shared.getGames()
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
            prepareVariable = 1
        }else{
            changeMenuSection = 2
            prepareVariable = 2
        }
    }
}
