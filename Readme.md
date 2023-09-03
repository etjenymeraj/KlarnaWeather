# General

The app is built using SwiftUI and Combine and is separated into 5 modules: 2 screens 
(currentWeather, WeatherSearch), networking (Network Service) UI components (Design Components), 
Common methods (Utilities). This allows for faster build time, code encapsulation, separated tests 
and reusability. The app follows the MVVM pattern. MVVM is a good candidate for SwiftUI due to its 
reactive nature. Furthermore I make use of repositories for the network code. Finally a test plan
is added that contains all the tests from different packages.

## Package Structure

Each package is divided in 2 targets. Main and Mocks. This separation allows us to import only mocks 
for tests in other packages and not every file. In a real app we could divide it into more 
targets for example "Interface" for all public classes. 

## Language features
I have made use of the following:
- Using protocols not only for view Model dependencies but also for the view model itself in case
we add snapshot tests for example. 
- Not every view model needs to be a class, such as the case when they are read me only.
- When using structs the custom init needs to be in an extension so that we preserve the memberwise
init. 
- Extensions in the networking service to highlight the power of optionals.
- Factory and builder design patterns. 
- Combine features inside mocks to make testing easier. 
- Codable to make json parsing easier. 

## User Interface

This project highlights some of the most beautiful features of SwiftUI. Building components in 4 ways
1) Custom Views 2) View Builders 3) View Modifiers 4) Styles. Each has their use case. Client consumes
just one factory with all components.  
  
## Features

The app follows a minimalistic design with a clean design.
- Location permission handling even when changing it in settings back and forth
- Toast to go directly to settings when denying and dismissal on swipe down gesture
- Light/dark mode toggle
- Changing temperature unit and region from settings support
- Current weather on app launch, with shimmering effect on loading state
- Different location search with debounce in case of fast typing
- Forecast react on location change, Error cases handling

## Testing

Both features have been fully tested as well as the networking service. In the features module I have used
the builder pattern. In the netowrking static var for mocking. API client has a mock which checks if the
right codable type is passed and the API requests test this functionality.
  
## Simplifications

The following simplifications were made to speed up development:
- Not everything has a protocol and is mocked for example, design components. 
- Calling current weather module factory directly in the main app. 
- Using colours and images from system rather than custom ones.
- Having a static image in current weather module. Ideally we would load it async and create our own 
version of cached async since SwiftUI doesn't offer it out of the box.
- Opting out of constant location updates since this is not a ride hailing app.
- Not real time update when changing temperature unit from setting

## Product Roadmap

If i would be extending this application I would work on the following features:
- Show 24 hour weather forecast
- Allow for changing images depending on weather condition
- Save preferred locations for easy access
- Notifications in case of emergency weather in user location
- Rain precipitation shown on map

  
