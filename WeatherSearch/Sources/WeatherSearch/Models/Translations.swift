struct Translations {
    let title: String
    let buttonTitle: String
    let idleTitle: String
    let idleDescription: String
    let errorTitle: String
    let errorDescription: String
    let emptyTitle: String
    let emptyDescription: String
}

extension Translations {
    static var `default`: Self {
        .init(
            title: "Weather Search",
            buttonTitle: "Close",
            idleTitle: "Start Searching",
            idleDescription: "Tap in the search bar and choose a custom location for weather display",
            errorTitle: "Search Issue",
            errorDescription: "Could not fetch locations, please try again by changing your text",
            emptyTitle: "No Results",
            emptyDescription: "There are no locations for your query, please try again by changing your text"
        )
    }
}
