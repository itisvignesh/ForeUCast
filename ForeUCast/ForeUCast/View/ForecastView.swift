//
//  ContentView.swift
//  ForeUCast
//
//  Created by Vigneshwaran Murugesan on 27/05/23.
//

import SwiftUI
import Combine

struct ForecastView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var weatherVM = WeatherViewModel()
    var body: some View {

        VStack {
            VStack {
                Text(weatherVM.weather.timezone)
                    .font(.system(size: 30))
                    .fontDesign(.rounded)
                    .fontWeight(.heavy)
                    .foregroundColor(.blue)
                HStack{
                    Spacer()
                    ZStack {
                        //Show Progressview as the data is loading
                        if(weatherVM.loading){
                            ProgressView()
                                .padding(-40)
                        }else{
                            //If the data is not being loaded show refresh icon
                            Image("ic_refresh")
                                .padding(-40)
                                .onTapGesture {
                                    weatherVM.loading = true
                                    weatherVM.fetchForecast()
                                }
                            }
                    }
                }
                    Text("Now")
                        .font(.system(size: 20,weight: .bold, design: .rounded))
                        .foregroundColor(.green)
                        
                HStack{
                    VStack{
                        AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(weatherVM.weather.current.weather[0].icon)@2x.png"))
                            .aspectRatio(contentMode: .fit)
                            .padding(.vertical,-20)
                        Text(weatherVM.weather.current.weather[0].main)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        HStack{
                            Image(systemName: "cloud.heavyrain.fill")
                            Text("\(Int(weatherVM.weather.current.dewPoint))%")
                                           
                        }
                        Text("\(Int(weatherVM.weather.current.temp))°C")
                            .font(.system(size: 40))
                            .fontDesign(.rounded)
                            .fontWeight(.bold)
                        Text("Feels like \(Int(weatherVM.weather.current.feelsLike))°C")
                    }
                    
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Max: 28°C").font(.subheadline).fontWeight(.bold)
                            .foregroundColor(.red)
                        Text("Min: 10°C").font(.subheadline).fontWeight(.light)
                            .foregroundColor(.blue)
                    }
                }
            }
            //Adding bottom line for the current weather to distinguish it from the forecasts
            .background(
                
                Color(UIColor.systemBackground).shadow(color: Color.gray, radius: 5, x: 0, y: 0).mask(Rectangle().padding(.bottom, -5))
            )


            // Forecast cells other than today
            //Currently the forecast list shows a repeatation of today which has to fixed in the api or in webservice parser.
                List ($weatherVM.dailyForecastList){ day in
                    ForeCastCellView(day: day)
                    
                }
                .listStyle(.plain) // To hide the header which adds a extra space at the top.

        }
        
        .task {
            weatherVM.fetchForecast()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
    }
}
