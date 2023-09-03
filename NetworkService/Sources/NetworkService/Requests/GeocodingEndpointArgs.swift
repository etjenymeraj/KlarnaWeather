public struct GeocodingEndpointArgs {
    let name: String
    let limit: Int

    public init(
        name: String,
        limit: Int = 10
    ) {
        self.name = name
        self.limit = limit
    }
}
