//
//  ForecastViewModel.swift
//  ForeUCast
//
//  Created by Vigneshwaran Murugesan on 31/05/23.
//

import Foundation
import Combine

extension ForecastView {

    class WeatherViewModel : ObservableObject {
        @Published var weather = DailyForecast()
        @Published var dailyForecastList = [Daily]()
        @Published var loading : Bool = false
        private var cancellableSet: Set<AnyCancellable> = []
        
        /// Subscriber alternative method to read the forecast data
        func fetchForecast(){
            WeatherService.shared.getForeCastFor(lattitude: "43.392228834037745", longitude: "-80.41154810568482")
                .receive(on: RunLoop.main)
                .sink { error in
                    print(error)
                } receiveValue: { forecastList in
                    self.weather = forecastList
                    self.dailyForecastList = forecastList.daily
                    self.loading = false
                }
                .store(in: &cancellableSet)

        }
        
        
    }
}
