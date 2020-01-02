//
//  GetCurrentStreams.swift
//  TwitchClient
//
//  Created by Артем Климкин on 02/01/2020.
//  Copyright © 2020 Artem Klimkin. All rights reserved.
//

import Foundation

struct StreamsData: Decodable{
    let data: [Streams]
}

struct Streams: Decodable{
    let id: String?
    let user_id: String?
    let user_name: String?
    let game_id: String?
    let type: String?
    let title: String?
    let viewer_count: Int?
    let started_at: String?
    let language: String?
    let thumbnail_url: String?
}

class GetCurrentStreams{
    
    static let shared = GetCurrentStreams()
    
    var userNameArray = [String]()
    var titleArray = [String]()
    var thumbnailUrlArray = [String]()
    
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
            }catch let err{
                print(err)
            }
        }.resume()
    }
}


//https://player.twitch.tv/?channel=dallas
