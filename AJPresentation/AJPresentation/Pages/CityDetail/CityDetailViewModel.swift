//
//  CityDetailViewModel.swift
//  AJPresentation
//
//  Created by Jose Harold on 17/03/2023.
//

import Foundation
import AJDomain
import Combine
import MapKit

public class CityDetailViewModel: CityDetailViewModelType, ObservableObject {

    @Published public var city: CityModel? {
        didSet {
            guard let city else {
                return
            }
            
            self.mapRegion = MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: CLLocationDegrees(city.latitude),
                    longitude: CLLocationDegrees(city.longitude)
                ),
                span: MKCoordinateSpan(
                    latitudeDelta: 0.03,
                    longitudeDelta: 0.03
                )
            )
            self.locations = []
            self.locations.append(
                Location(
                    name: city.name,
                    coordinate: CLLocationCoordinate2D(
                        latitude: CLLocationDegrees(city.latitude),
                        longitude: CLLocationDegrees(city.longitude)
                    )
                )
            )
        }
    }
    
    @Published public var mapRegion: MKCoordinateRegion
    @Published public var locations: [Location] = []
    
    public init() {
        self.mapRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: CLLocationDegrees(0),
                longitude: CLLocationDegrees(0)
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.03,
                longitudeDelta: 0.03
            )
        )
    }
}

public struct Location: Identifiable {
    public let id = UUID()
    public let name: String
    public let coordinate: CLLocationCoordinate2D
}
