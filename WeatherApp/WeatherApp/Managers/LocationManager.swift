//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Akha on 27.12.2023.
//

import Foundation
import CoreLocation

// view model для отслеживания местоположения
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager() // location manager загружен в данную переменную (rassmotrett private let)
    
    @Published var location: CLLocationCoordinate2D? // можно CLLocation?
    @Published var isLoading = false
    
    override init(){
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization() // Запрос разрешения
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
    
}
