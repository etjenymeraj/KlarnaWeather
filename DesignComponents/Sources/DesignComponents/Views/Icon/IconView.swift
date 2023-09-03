import SwiftUI

struct IconView: View {
    var image: Image
    var width: Double
    var height: Double
    var color: Color?

    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: width, height: height)
            .foregroundColor(color)
    }
}
