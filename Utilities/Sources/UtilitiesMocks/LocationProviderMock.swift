import Foundation
import Combine
import Utilities
import Foundation

public final class LocationProviderMock: LocationProvider {
    public init() {}

    public var stubPermissionGranted = false
    public var permissionGrantedPublisher: AnyPublisher<Bool, Never> {
        Just(stubPermissionGranted).eraseToAnyPublisher()
    }

    public var stubCurrentLocation: UserLocation?
    public var currentLocationPublisher: AnyPublisher<UserLocation, Never> {
        guard let stubCurrentLocation else {
            return Empty<UserLocation, Never>().eraseToAnyPublisher()
        }

        return Just(stubCurrentLocation).eraseToAnyPublisher()
    }

    public var stubLastLocation: UserLocation?
    public var lastLocation: UserLocation? {
        stubLastLocation
    }
}
