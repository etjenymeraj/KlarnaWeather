import SwiftUI
import DesignComponents

struct WeatherSearchDataView: View {
    let componentsFactory: ComponentsFactory
    let locations: [WeatherLocation]
    let action: (WeatherLocation) -> Void

    var body: some View {
        List {
            ForEach(locations) { location in
                WeatherSearchRowView(
                    componentsFactory: componentsFactory,
                    name: location.name,
                    country: location.country,
                    state: location.state
                )
                .listRowBackground(Colors.secondaryBackgroundColor)
                .onTapGesture {
                    action(location)
                }
            }
        }
        .scrollContentBackground(.hidden)
    }
}
