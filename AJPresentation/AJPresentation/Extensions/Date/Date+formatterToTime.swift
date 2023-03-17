//
//  Date+formatterToTime.swift
//  AJPresentation
//
//  Created by Jose Harold on 17/03/2023.
//

extension Date {
    
    func formatterToTime() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: self).lowercased()
    }
}

