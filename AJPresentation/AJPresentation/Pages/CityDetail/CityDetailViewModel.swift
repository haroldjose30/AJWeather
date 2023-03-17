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

    public var city: CityModel
    @Published public var mapRegion: MKCoordinateRegion
    public var locations: [Location]
    
    public init(
        city: CityModel
    ) {
        self.city = city
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

public struct Location: Identifiable {
    public let id = UUID()
    public let name: String
    public let coordinate: CLLocationCoordinate2D
}
