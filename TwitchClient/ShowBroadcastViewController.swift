import Cocoa

class ShowBroadcastViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate{

    
    @IBOutlet var tableView: NSTableView!
    
    var observeTheShowVariablesProp: Bool?{
        didSet{
            print("")
        }
    }
    @IBOutlet var imageView: NSImageView!
    @IBOutlet var gameNameLabel: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if observeTheShowVariables{
                self.gameNameLabel.stringValue = gameName
                let url = URL(string: correctUrl(nameUrl: .gameImageUrl))!
                
                if let data = try? Data(contentsOf: url){
                    self.imageView.image = NSImage(data: data)
                }
                
                
                GetCurrentStreams.shared.getStreams(url: correctUrl(nameUrl: .streamerName))
                
                observeTheShowVariables = false
            }
        }
    }
    
    @IBAction func reload(_ sender: Any) {
        
        if GetCurrentStreams.shared.titleArray.count == 0{
            return
        }else{
            tableView.reloadData()
        }
        

    }
        
    
    func numberOfRows(in tableView: NSTableView) -> Int {
          return GetCurrentStreams.shared.userNameArray.count
      }

      func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
          guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {return nil}

          vw.textField?.stringValue = GetCurrentStreams.shared.userNameArray[row]
          return vw
          
      }
   
    func tableViewSelectionDidChange(_ notification: Notification) {
        streamerName = GetCurrentStreams.shared.userNameArray[tableView.selectedRow]
        streamerTitle = GetCurrentStreams.shared.titleArray[tableView.selectedRow]
    }
}
