import SwiftUI

struct ContentView: View {
    @State private var emojiItems: [EmojiItem] = [
        EmojiItem(emoji: "\u{1F600}", name: "Happy"),
        EmojiItem(emoji: "\u{1F525}", name: "Fire"),
        EmojiItem(emoji: "\u{1F680}", name: "Rocket"),
        EmojiItem(emoji: "\u{2764}\u{FE0F}", name: "Heart"),
        EmojiItem(emoji: "\u{2B50}", name: "Star")
    ]

    var body: some View {
        NavigationStack {
            List($emojiItems) { $item in
                HStack {
                    EmojiView(emoji: item.emoji, size: 44)

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
