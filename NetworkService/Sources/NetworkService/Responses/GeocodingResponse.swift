public struct GeocodingResponse {
    public let name: String
    public let latitude: Double
    public let longitude: Double
    public let country: String
    public let state: String?

    public init(
        name: String,
        latitude: Double,
        longitude: Double,
        country: String,
        state: String?
    ) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.country = country
        self.state = state
    }
}

extension GeocodingResponse: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(forKey: .name)
        latitude = try container.decode(forKey: .latitude)
        longitude = try container.decode(forKey: .longitude)
        country = try container.decode(forKey: .country)
        state = try container.decodeIfPresent(forKey: .state)
    }
}

extension GeocodingResponse {
    enum CodingKeys: String, CodingKey {
        case name
        case latitude = "lat"
        case longitude = "lon"
        case country
        case state
    }
}
