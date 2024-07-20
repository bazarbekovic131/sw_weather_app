//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Akha on 27.12.2023.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5){
                    Text(weather.location.name).bold().font(.title)
                    
                    Text("Today is \(Date().formatted(.dateTime.day().month().hour().minute()))").fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "sun.max").font(.system(size: 40))
                            Text(weather.current.condition.text)
                        }.frame(width: 100, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.current.temp_c.roundDecimals(to: 0) + "°C").font(.system(size: 100)).fontWeight(.bold).padding()
                    }
                    
                    Spacer().frame(height: 10)
                
                    Image("shymkent_city").resizable().imageScale(.small).aspectRatio(CGSize(width: 300, height: 300), contentMode: .fit)
                    Spacer()
                    
                    
                    
                }.frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather Now").bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Feels Like", value: (weather.current.feelslike_c.roundDecimals(to: 0) + "°"))
                        Spacer()
                        WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.current.wind_kph.roundDecimals(to: 0) + "k/h"))
                    }
                    HStack {
                        WeatherRow(logo: "humidity", name: "Humidity", value: (String(weather.current.humidity) + "%"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Precipitation", value: (weather.current.precip_mm.roundDecimals(to: 0) + "mm"))
                    }
                    
                }.frame(maxWidth: .infinity, alignment: .leading).padding().padding(.bottom, 20).foregroundColor(Color(hue: 0.695, saturation: 0.920, brightness: 0.35)).background(.white).cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.695, saturation: 0.920, brightness: 0.35))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
