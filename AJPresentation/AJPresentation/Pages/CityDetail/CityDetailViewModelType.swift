//
//  CityDetailViewModelType.swift
//  AJPresentation
//
//  Created by Jose Harold on 17/03/2023.
//

import MapKit
import AJDomain

public protocol CityDetailViewModelType: ObservableObject {
    
    var mapRegion: MKCoordinateRegion { get set }
    var locations: [Location] { get set }
    var city: CityModel? { get set }
}
