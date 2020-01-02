import Cocoa

class ShowAllStreamersVC: NSViewController, NSTableViewDataSource, NSTableViewDelegate{

    
    @IBOutlet var tableView: NSTableView!
    
    var userNameArray = [String]()
    var titleArray = [String]()
    var thumbnailUrlArray = [String]()
    

    @IBOutlet var imageView: NSImageView!
    @IBOutlet var gameNameLabel: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if showAllStreamers{
                self.gameNameLabel.stringValue = gameName
                let url = URL(string: correctUrl(nameUrl: .gameImageUrl))!
                
                if let data = try? Data(contentsOf: url){
                    self.imageView.image = NSImage(data: data)
                }
                self.getStreams(url: correctUrl(nameUrl: .streamerName))
                showAllStreamers = false
                
            }
        }
    }

    
    func numberOfRows(in tableView: NSTableView) -> Int {
          return userNameArray.count
      }

      func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
          guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {return nil}

          vw.textField?.stringValue = userNameArray[row]
          return vw
          
      }
   
    func tableViewSelectionDidChange(_ notification: Notification) {
        streamerName = userNameArray[tableView.selectedRow]
        streamerTitle = titleArray[tableView.selectedRow]
        
    }
    
    

    
    func getStreams(url: String){
        
        guard let url = URL(string: url) else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(CLIENT_ID, forHTTPHeaderField: "Client-ID")
        
        if userNameArray.count != 0{
            userNameArray.removeAll()
            titleArray.removeAll()
            thumbnailUrlArray.removeAll()
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
            
            do{
                let value = try JSONDecoder().decode(StreamsData.self, from: data)
                print(value.data.count)
                for streams in 0 ..< value.data.count{
                    self.userNameArray.append(value.data[streams].user_name!)
                    self.titleArray.append(value.data[streams].title!)
                    self.thumbnailUrlArray.append(value.data[streams].thumbnail_url!)
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
