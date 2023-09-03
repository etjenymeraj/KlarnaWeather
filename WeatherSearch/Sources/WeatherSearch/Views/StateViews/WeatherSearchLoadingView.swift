import SwiftUI

struct WeatherSearchLoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
            Spacer()
        }
        .padding(.top, 16)
    }
}
