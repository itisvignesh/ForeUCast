//
//  ForeCastCell.swift
//  ForeUCast
//
//  Created by Vigneshwaran Murugesan on 28/05/23.
//

import SwiftUI

struct ForeCastCellView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var day : Daily
    var body: some View {
            VStack{
                Group{
                    HStack{
                        VStack(alignment: .center){
                            Text(DateUtils.dayStringOfTimestamp(timeStamp: day.dt))
                                .font(.system(size:18,weight: .bold, design: .rounded))
                            
                            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(day.weather[0].icon)@2x.png"))
                                .scaledToFit()
                                .frame(width: 50,height:50)
                                .padding(-10)

                            Text(day.weather[0].main)
                                .font(.system(.footnote))
                                .fontWeight(.bold)
                        }
                        VStack{
                            HStack{
                                
                                Text(day.summary)
                                    .font(.system(.subheadline,design: .rounded,weight: .semibold))
                                    .padding(.leading,10)
                                HStack{
                                    Image(systemName: "cloud.heavyrain.fill")
                                    Text("\(Int(day.pop*100))%")
                                                   
                                }
                                    

                            }
                            VStack {
                                HStack{
                                    Text("Min:\(Int(day.temp.min)) °C")
                                        .font(.system(.subheadline,design: .rounded))
                                        .foregroundColor(.blue)
                                    Spacer()
                                    Text("Max:\(Int(day.temp.max))°C").font(.system(.subheadline,design: .rounded))
                                        .foregroundColor(.red)
                                }
                                HStack{
                                    Spacer().frame(height:8)
                                        .background(LinearGradient(colors: [.blue,.red],startPoint: .leading,endPoint: .trailing))
                                        .clipShape(Capsule())
                                }
                            }
                        }
                    }
                }
                
                .padding(10)
        }

        .cornerRadius(15)
    }
}

struct ForeCastCell_Previews: PreviewProvider {
    static var previews: some View {
        ForeCastCellView(day: .constant(Daily(dt: 1, sunrise: 1, sunset: 1, moonrise: 1, moonset: 1, moonPhase: 1, summary: "1", temp: Temp(day: 1, min: 1, max: 1, night: 1, eve: 1, morn: 1), feelsLike: FeelsLike(day: 1, night: 2, eve: 2, morn: 2), pressure: 1, humidity: 1, dewPoint: 1, windSpeed: 1, windDeg: 1, windGust: 1, weather: [], clouds: 1, pop: 1, uvi: 1)))
    }
}
