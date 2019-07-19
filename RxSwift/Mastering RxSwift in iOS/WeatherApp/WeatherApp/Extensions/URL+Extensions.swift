import Foundation

extension URL {
    static func urlForWeatherAPI(city: String) -> URL? {
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=fb7272e5443d789547a333b4145acb4f&units=imperial")
    }
}
