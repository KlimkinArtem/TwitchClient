import Foundation

enum correctUrlChoice{
    case gameImageUrl, streamerName, playVideoUrl
}

var changeMenuSection = 0
var prepareVariable = 0
var observeTheShowVariables = false



let CLIENT_ID = "1we71oc0so0wr4ouztap8jw6z6w3ey"
let GET_TOP_GAMES = "https://api.twitch.tv/helix/games/top?first=100"
let GET_ALL_GAMES = "https://api.twitch.tv/helix/games"

var gameName = ""
var gameId = ""
var gameImageUrl = ""
var streamerName = ""
var streamerTitle = ""

func correctUrl(nameUrl: correctUrlChoice) -> String{
    
    switch nameUrl {
    case .gameImageUrl:
        var oldUrl = gameImageUrl.replacingOccurrences(of: "{width}", with: "150")
        var newUrl = oldUrl.replacingOccurrences(of: "{height}", with: "200")
        return newUrl
    case .streamerName:
        return "https://api.twitch.tv/helix/streams?game_id=\(gameId)&first=100&language=ru"
    case .playVideoUrl:
        return "https://player.twitch.tv/?channel=\(streamerName)"
    }
    
    return ""
}
