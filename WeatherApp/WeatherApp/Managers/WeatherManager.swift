//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Akha on 27.12.2023.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "http://api.weatherapi.com/v1/current.json?key=744c23751c324b0795d63200232712&q=\(latitude),\(longitude)&aqi=no") else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Failed to fetch data")}
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}

// Response Body initially fetched from https://www.weatherapi.com/api-explorer.aspx and variables have these names
struct ResponseBody: Decodable {
    var location: LocationResponse
    var current: WeatherResponse
    
    struct LocationResponse: Decodable{
        var name: String
        var region: String
        var country: String
        var lat: Double
        var lon: Double
        var tz_id: String
        var localtime: String
    }
    struct WeatherResponse: Decodable{
        var temp_c: Double
        var condition: ConditionResponse
        var wind_kph: Double
        var wind_dir: String
        var pressure_mb: Double
        var precip_mm: Double
        var humidity: Int
        var feelslike_c: Double
        var vis_km: Double
        var uv: Double
    }
    struct ConditionResponse: Decodable {
        var text: String
    }
}
