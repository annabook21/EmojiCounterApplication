import Foundation

struct EmojiItem: Identifiable {
    let id = UUID()
    var emoji: String
    var name: String
    var count: Int = 0
}
