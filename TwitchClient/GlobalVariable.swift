import Foundation

var changeMenuSection = 0
var prepareVariable = 0

let CLIENT_ID = "1we71oc0so0wr4ouztap8jw6z6w3ey"
let GET_TOP_GAMES = "https://api.twitch.tv/helix/games/top?first=100"
let GET_ALL_GAMES = "https://api.twitch.tv/helix/games"

var topGameName = ""
var topGameId = ""
var topGameImageUrl = ""


func correctUrl() -> String{
    
    var oldUrl = topGameImageUrl.replacingOccurrences(of: "{width}", with: "300")
    var newUrl = oldUrl.replacingOccurrences(of: "{height}", with: "300")
    
    return newUrl
}
