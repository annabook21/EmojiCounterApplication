import SwiftUI

struct ContentView: View {
    @State private var emojiItems: [EmojiItem] = [
        EmojiItem(emoji: "😀", name: "Happy"),
        EmojiItem(emoji: "🔥", name: "Fire"),
        EmojiItem(emoji: "🚀", name: "Rocket"),
        EmojiItem(emoji: "❤️", name: "Heart"),
        EmojiItem(emoji: "⭐", name: "Star")
    ]

    var body: some View {
        NavigationStack {
            List($emojiItems) { $item in
                HStack {
                    Text(item.emoji)
                        .font(.system(size: 36))

                    Text(item.name)
                        .font(.headline)

                    Spacer()

                    Text("\(item.count)")
                        .font(.title2)
                        .frame(minWidth: 40)

                    Button {
                        item.count -= 1
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .font(.title2)
                            .foregroundStyle(.red)
                    }
                    .buttonStyle(.borderless)

                    Button {
                        item.count += 1
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .foregroundStyle(.green)
                    }
                    .buttonStyle(.borderless)
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Emoji Counter")
        }
    }
}

#Preview {
    ContentView()
}
