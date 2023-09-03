struct PlaceholderWeatherViewModel {}

extension PlaceholderWeatherViewModel: WeatherViewModel {
    var name: String {
        "............"
    }
    
    var conditionTitle: String {
        "......"
    }
    
    var conditionDescription: String {
        "......"
    }
    
    var shouldShowCondition: Bool {
        true
    }
    
    var actualTemp: String {
        "......"
    }
    
    var minTemp: String {
        "......"
    }
    
    var maxTemp: String {
        "......"
    }
    
    var humidity: String {
        "......"
    }
    
    var windSpeed: String {
        "......"
    }
    
    var sunrise: String {
        "......"
    }
    
    var sunset: String {
        "......"
    }
    
    
}
