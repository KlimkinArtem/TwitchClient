import Foundation

class PrintJson{
    
    static let shared = PrintJson()
     
    func printJson(url: String){
         
        guard let url = URL(string: url) else {return }
         
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(CLIENT_ID, forHTTPHeaderField: "Client-ID")
         
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
             
            if let str = String(data: data, encoding: .utf8){
                print(str)
            }
        }.resume()
        
     }
     
    
}
