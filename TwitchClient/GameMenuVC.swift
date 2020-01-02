import Cocoa


class GameMenuVC: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    var gamesNameArray = [String]()
    var gamesIdArray = [String]()
    var gamesImageUrlArray = [String]()
    
    @IBOutlet var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getGames()
        
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return gamesNameArray.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {return nil}
                
        vw.textField?.stringValue = gamesNameArray[row]
        return vw
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        gameId = gamesIdArray[tableView.selectedRow]
        gameName = gamesNameArray[tableView.selectedRow]
        gameImageUrl = gamesImageUrlArray[tableView.selectedRow]
        showAllStreamers = true
    }
    
    
    func getGames(){
        
        guard let url = URL(string: GET_TOP_GAMES) else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(CLIENT_ID, forHTTPHeaderField: "Client-ID")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
            do{
                let value = try JSONDecoder().decode(GamesData.self, from: data)
                
                for game in 0 ..< value.data.count{
                    self.gamesIdArray.append(value.data[game].id!)
                    self.gamesNameArray.append(value.data[game].name!)
                    self.gamesImageUrlArray.append(value.data[game].box_art_url!)
                    
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch let err{
                print(err)
            }
        }.resume()
        
    }
            
}
