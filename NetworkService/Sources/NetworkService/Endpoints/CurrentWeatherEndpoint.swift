struct CurrentWeatherEndpoint: Endpoint {
    let args: CurrentWeatherEndpointArgs
    
    init(args: CurrentWeatherEndpointArgs) {
        self.args = args
    }

    var path: String {
        "/data/2.5/weather"
    }
  
    var method: Method {
        .get
    }
  
    var parameters: [String: String] {
        [
            "lat": String(args.latitude),
            "lon": String(args.longitude),
            "appid": APIConstants.key,
            "units": unit.rawValue
        ]
    }

    private enum Unit: String {
        case metric, imperial, standard
    }

    private var unit: Unit {
        if args.unitTemperature == .celsius {
            return .metric
        } else if args.unitTemperature == .fahrenheit {
            return .imperial
        } else {
            return .standard
        }
    }
}
