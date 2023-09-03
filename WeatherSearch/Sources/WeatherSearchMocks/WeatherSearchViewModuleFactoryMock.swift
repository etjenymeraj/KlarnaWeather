import WeatherSearch
import SwiftUI

public class WeatherSearchViewModuleFactoryMock: WeatherSearchViewModuleFactory {
    public init() {}

    public private(set) var didCallMake = false
    public func make(delegate: WeatherSearchModuleDelegate?) -> some View {
        didCallMake = true
        return EmptyView()
    }
}
