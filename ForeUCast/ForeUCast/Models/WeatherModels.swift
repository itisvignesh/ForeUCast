//
//  WeatherModels.swift
//  ForeUCast
//
//  Created by Vigneshwaran Murugesan on 31/05/23.
//

import Foundation

//Empty Constructors were added to load the preview data.
// MARK: - DailyForecast
struct DailyForecast: Codable {
    let lat, lon: Double
    let timezone: String
    let timezoneOffset: Int
    let current: Current
    let daily: [Daily]

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, daily
    }
    init() {
        lat = 0
        lon = 0
        timezone = ""
        timezoneOffset = 0
        current = Current()
        daily = [Daily]()
    }
}

// MARK: - Current
struct Current: Codable {
    let dt, sunrise, sunset: Int
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let dewPoint, uvi: Double
    let clouds, visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
    }
    init() {
        dt = 0
        sunrise = 0
        sunset = 0
        temp = 0
        feelsLike = 0
        pressure = 0
        humidity = 0
        dewPoint = 0
        uvi = 0
        clouds = 0
        visibility = 0
        windSpeed = 0
        windDeg = 0
        weather =  [Weather()]
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
    init() {
        id = 0
        main = ""
        description = ""
        icon = ""
    }
}

// MARK: - Daily
struct Daily: Codable, Identifiable {
    var id = UUID()
    let dt : Double
    let sunrise, sunset, moonrise: Int
    let moonset: Int
    let moonPhase: Double
    let summary: String
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure, humidity: Int
    let dewPoint, windSpeed: Double
    let windDeg: Int
    let windGust: Double
    let weather: [Weather]
    let clouds: Int
    let pop, uvi: Double

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case summary, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, clouds, pop, uvi
    }
}

// MARK: - FeelsLike
struct FeelsLike: Codable {
    let day, night, eve, morn: Double
}

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}


//// MARK: - Configuration
//struct Configuration: Codable {
//    let cod: String
//    let message, cnt: Int
//    let list: [ForeCast]
//    let city: City
//}
//
//// MARK: - City
//struct City: Codable {
//    let id: Int
//    let name: String
//    let coord: Coord
//    let country: String
//    let population, timezone, sunrise, sunset: Int
//}
//
//// MARK: - Coord
//struct Coord: Codable {
//    let lat, lon: Double
//}
//
//// MARK: - List
//struct ForeCast: Codable {
//    let dt: Int
//    let main: WeatherProperties
////    let weather: [Weather]
//    let clouds: Clouds
//    let wind: Wind
//    let visibility : Int
//    let pop: Float
//    let sys: Sys
//    let dtTxt: String
//
//    enum CodingKeys: String, CodingKey {
//        case dt, main, clouds, wind, visibility, pop, sys
//        case dtTxt = "dt_txt"
//    }
//}
//
//// MARK: - Clouds
//struct Clouds: Codable {
//    let all: Int
//}
//
//// MARK: - WeatherProperties
//struct WeatherProperties: Codable {
//    let temp, feelsLike, tempMin, tempMax: Double
//    let pressure, seaLevel, grndLevel, humidity: Int
//    let tempKf: Double
//
//    enum CodingKeys: String, CodingKey {
//        case temp
//        case feelsLike = "feels_like"
//        case tempMin = "temp_min"
//        case tempMax = "temp_max"
//        case pressure
//        case seaLevel = "sea_level"
//        case grndLevel = "grnd_level"
//        case humidity
//        case tempKf = "temp_kf"
//    }
//}
//
//// MARK: - Sys
//struct Sys: Codable {
//    let pod: Pod
//}
//
//enum Pod: String, Codable {
//    case d = "d"
//    case n = "n"
//}
//
//// MARK: - Weather
//struct Weather: Codable {
//    let id: Int
//    let main: MainEnum
//    let description: Description
//    let icon: String
//}
//
//enum Description: String, Codable {
//    case brokenClouds = "broken clouds"
//    case clearSky = "clear sky"
//    case fewClouds = "few clouds"
//    case scatteredClouds = "scattered clouds"
//}
//
//enum MainEnum: String, Codable {
//    case clear = "Clear"
//    case clouds = "Clouds"
//}
//
//// MARK: - Wind
//struct Wind: Codable {
//    let speed: Double
//    let deg: Int
//    let gust: Double
//}
