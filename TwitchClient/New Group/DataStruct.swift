import Foundation


struct GamesData: Decodable{
    let data: [Games]
}

struct Games: Decodable{
    let id: String?
    let name: String?
    let box_art_url: String?
}

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
