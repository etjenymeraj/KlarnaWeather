struct GeocodingEndpoint: Endpoint {
    let args: GeocodingEndpointArgs
    
    init(args: GeocodingEndpointArgs) {
        self.args = args
    }
  
    var path: String {
        "/geo/1.0/direct"
    }

    var method: Method {
        .get
    }

    var parameters: [String: String] {
        [
            "q": args.name,
            "limit": String(args.limit),
            "appid": APIConstants.key
        ]
    }
}
