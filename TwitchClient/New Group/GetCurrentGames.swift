import Foundation


struct GamesData: Decodable{
    let data: [Games]
}

struct Games: Decodable{
    let id: String?
    let name: String?
    let box_art_url: String?
}

class GetCurrentGames{
    
    
    static let shared = GetCurrentGames()
    
    var gamesNameArray = [String]()
    var gamesIdArray = [String]()
    var gamesImageUrlArray = [String]()
    
    func getGames(){
        
        guard let url = URL(string: GET_TOP_GAMES) else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(CLIENT_ID, forHTTPHeaderField: "Client-ID")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
            
            do{
                let value = try JSONDecoder().decode(GamesData.self, from: data)
                print(value.data.count)
                for game in 0 ..< value.data.count{
                    self.gamesIdArray.append(value.data[game].id!)
                    self.gamesNameArray.append(value.data[game].name!)
                    self.gamesImageUrlArray.append(value.data[game].box_art_url!)
                    
                }
            }catch let err{
                print(err)
            }
        }.resume()
    }
    
   
    
}
