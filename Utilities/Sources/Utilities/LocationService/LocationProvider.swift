import CoreLocation
import Combine

public protocol LocationProvider {
    var permissionGrantedPublisher: AnyPublisher<Bool, Never> { get }
    var currentLocationPublisher: AnyPublisher<UserLocation, Never> { get }
    var lastLocation: UserLocation? { get }
}

public final class LocationProviderImp: NSObject {
    private let locationManager: CLLocationManager
    private let currentLocationSubject = PassthroughSubject<UserLocation, Never>()
    private let permissionGrantedSubject = PassthroughSubject<Bool, Never>()

    init(locationManager: CLLocationManager) {
        self.locationManager = locationManager
        super.init()
      
        configure()
    }

    public convenience override init() {
        self.init(locationManager: CLLocationManager())
    }

    private func configure() {
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.delegate = self
    }

    private func updateAuthorizationStatus(_ status: CLAuthorizationStatus) {
        guard status != .notDetermined else {
            requestUserAuthorization()
            return
        }

        let granted = permissionsGranted(status)
        permissionGrantedSubject.send(granted)
        fetchLastLocationIfAvailable()
    }

    private func requestUserAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }

    private func permissionsGranted(_ status: CLAuthorizationStatus) -> Bool {
        status == .authorizedWhenInUse || status == .authorizedAlways
    }

    private func fetchLastLocationIfAvailable() {
        locationManager
            .location
            .map(UserLocation.init)
            .map(currentLocationSubject.send)
    }
}

// MARK: LocationProvider

extension LocationProviderImp: LocationProvider {
    public var permissionGrantedPublisher: AnyPublisher<Bool, Never> {
        permissionGrantedSubject.eraseToAnyPublisher()
    }

    public var currentLocationPublisher: AnyPublisher<UserLocation, Never> {
        currentLocationSubject.eraseToAnyPublisher()
    }

    public var lastLocation: UserLocation? {
        locationManager
            .location
            .map(UserLocation.init)
    }
}

// MARK: CLLocationManagerDelegate

extension LocationProviderImp: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations
            .last
            .map(UserLocation.init)
            .map(currentLocationSubject.send)
    }

    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Swift.Error) {
        guard let clErr = error as? CLError else {
            return
        }

        switch clErr.code {
        case CLError.denied:
            permissionGrantedSubject.send(false)
        default:
            break
        }
    }

    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        updateAuthorizationStatus(status)
    }
}
