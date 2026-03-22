import SwiftUI
import UIKit

/// Renders emoji as UIImage for display. Uses high-resolution rendering (font size 1024)
/// then scales down for simulator and device compatibility.
struct EmojiView: View {
    let emoji: String
    var size: CGFloat = 44

    var body: some View {
        if let image = emojiToImage(emoji) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)
        } else {
            Text(emoji)
                .font(.system(size: size * 0.85))
        }
    }

    private func emojiToImage(_ emoji: String) -> UIImage? {
        guard !emoji.isEmpty else { return nil }
        let nsString = emoji as NSString
        let font = UIFont.systemFont(ofSize: 1024)
        let stringAttributes: [NSAttributedString.Key: Any] = [.font: font]
        let imageSize = nsString.size(withAttributes: stringAttributes)
        guard imageSize.width > 0, imageSize.height > 0 else { return nil }

        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        UIColor.clear.set()
        UIRectFill(CGRect(origin: .zero, size: imageSize))
        nsString.draw(at: .zero, withAttributes: stringAttributes)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

#Preview {
    HStack {
        EmojiView(emoji: "\u{1F600}")
        EmojiView(emoji: "\u{1F525}")
        EmojiView(emoji: "\u{1F680}")
    }
}
