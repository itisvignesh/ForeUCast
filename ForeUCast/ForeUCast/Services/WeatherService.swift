//
//  WeatherService.swift
//  ForeUCast
//
//  Created by Vigneshwaran Murugesan on 31/05/23.
//

import Foundation
import Combine

struct NetworkError: Error {
  let initialError: String
  let backendError: BackendError?
}

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
enum Params : String {
    case APPID = "appid"
    case LAT = "lat"
    case LON = "lon"
    case UNITS = "units"
    case EXCLUDE = "exclude"
}

protocol WeatherServiceProtocol {
    func getForeCastFor(lattitude: String, longitude : String) -> AnyPublisher<DailyForecast,Error>
}


class WeatherService :  WeatherServiceProtocol {
    private let APIEndPont : String = "https://api.openweathermap.org/data/3.0/onecall"
    private let AppID : String = "6ca6d5d12c3ef236bac65e85507e3f78"
    private var urlSession : URLSession

    public static var shared : WeatherService {
        let urlsession = URLSession.init(configuration: .default)
        return WeatherService(urlSession: urlsession)
    }
    private init(urlSession : URLSession) {
        self.urlSession = urlSession
    }
    
    func getForeCastFor(lattitude: String, longitude : String) -> AnyPublisher<DailyForecast,Error> {
//        var requestPath = URL(string: APIEndPont + "forecast/daily")
        var requestPath = URL(string: APIEndPont)
            requestPath?.append(queryItems:
            [URLQueryItem(name: Params.APPID.rawValue, value: AppID),
             URLQueryItem(name: Params.LAT.rawValue, value: lattitude),
             URLQueryItem(name: Params.LON.rawValue, value: longitude),
             URLQueryItem(name: Params.UNITS.rawValue, value: "metric"),
             URLQueryItem( name: Params.EXCLUDE.rawValue, value: "minutely,hourly,alerts")
            ]);
            
        return urlSession.dataTaskPublisher(for: requestPath!)
            .tryMap({ responseData -> Data in
                guard let httpResponse = responseData.response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                        throw   URLError(.badServerResponse)
                }
                return responseData.data
            })
            .decode(type: DailyForecast.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()

    }
    
}
