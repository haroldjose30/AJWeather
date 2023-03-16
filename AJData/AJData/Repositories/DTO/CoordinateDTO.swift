//
//  CoordinateDTO.swift
//  AJData
//
//  Created by Jose Harold on 16/03/2023.
//

public struct CoordinateDTO {
    
    
    public let latitude: Float
    public let longitude: Float
    
    public init(
        latitude: Float,
        longitude: Float
    ) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
