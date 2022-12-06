import CoreLocation
import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    var coord: Coord
    var weather: [Weather]
    var base: String
    var main: Main
    var visibility: Int
    var wind: Wind
    var clouds: Clouds
    var dt: Int
    var sys: Sys
    var timezone, id: Int
    var name: String
    var cod: Int
}
// MARK: - Clouds
struct Clouds: Codable {
    var all: Int
}
// MARK: - Coord
struct Coord: Codable {
    var lon, lat: Double
}
// MARK: - Main
struct Main: Codable {
    var temp, feelsLike, tempMin, tempMax: Double
    var pressure, humidity: Int
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}
// MARK: - Sys
struct Sys: Codable {
    var type, id: Int
    var country: String
    var sunrise, sunset: Int
}
// MARK: - Weather
struct Weather: Codable {
    var id: Int
    var main, weatherDescription : String
    var icon: String
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
// MARK: - Wind
struct Wind: Codable {
    var speed: Double
    var deg: Int
}

var weather:Welcome?
func getCurrentWeather(url:String, completion: @escaping (Welcome)->())
{
    let session = URLSession(configuration: .default)
    session.dataTask(with:URL(string:url)!) {(data, _, err) in
        if err != nil {
            return
        }
        DispatchQueue.main.async{
            do {
                weather = try JSONDecoder().decode(Welcome.self, from:data!)
                completion(weather!)
            }
            catch{
                print("not found")
            }
        }
    }
    .resume()
}

let apiKey:String = "84840a1a3abfab0af05209f7ea8b3224"
var location: String = ""

func setLocationStringForWeather(location: String)->String
{
    return
        "https://api.openweathermap.org/data/2.5/weather?q=\(location)&appid=\(apiKey)&units=metric"
}
