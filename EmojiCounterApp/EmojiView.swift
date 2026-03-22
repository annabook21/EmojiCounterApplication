import SwiftUI
import UIKit

/// Renders an emoji string as an image for reliable display across devices and simulators.
struct EmojiView: View {
    let emoji: String
    var size: CGFloat = 44

    var body: some View {
        if let uiImage = emojiToImage(emoji, size: size) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)
        } else {
            Text(emoji)
                .font(.system(size: size * 0.7))
        }
    }

    private func emojiToImage(_ emoji: String, size: CGFloat) -> UIImage? {
        guard !emoji.isEmpty else { return nil }
        let fontSize = size * 0.85
        let font = UIFont.systemFont(ofSize: fontSize)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .paragraphStyle: paragraphStyle,
        ]
        let format = UIGraphicsImageRendererFormat()
        format.scale = UIScreen.main.scale
        format.opaque = false
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: size, height: size), format: format)
        return renderer.image { _ in
            let rect = CGRect(x: 0, y: 0, width: size, height: size)
            (emoji as NSString).draw(in: rect, withAttributes: attributes)
        }
    }
}

#Preview {
    HStack {
        EmojiView(emoji: "😀")
        EmojiView(emoji: "🔥")
        EmojiView(emoji: "🚀")
    }
}
