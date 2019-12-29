import Foundation


struct DataUrl: Decodable{
    let data: [Games]
}

struct Games: Decodable{
    let id: String?
    let name: String?
    let box_art_url: String?
}

class GetCurrentGames{
    
    
    static let shared = GetCurrentGames()
    var topGamesArray = [String]()
    
    func getTopGames(){
        
        guard let url = URL(string: GET_TOP_GAMES) else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(CLIENT_ID, forHTTPHeaderField: "Client-ID")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
            
            do{
                let value = try JSONDecoder().decode(DataUrl.self, from: data)
                print(value.data.count)
                for game in 0 ..< value.data.count{
                    print(value.data[game].name!)
                    self.topGamesArray.append(value.data[game].name!)
                }
            }catch let err{
                print(err)
            }
        }.resume()
    }
    
   
    
}
