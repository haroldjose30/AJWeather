//
//  Date+formatterToRelative.swift
//  AJPresentation
//
//  Created by Jose Harold on 17/03/2023.
//

extension Date {
    
    func formatterToRelative() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM dd"
        
        let relativeDateFormatter = DateFormatter()
        relativeDateFormatter.timeStyle = .none
        relativeDateFormatter.dateStyle = .medium
        relativeDateFormatter.doesRelativeDateFormatting = true
        
        let datestr = relativeDateFormatter.string(from: self)
        if let _ = datestr.rangeOfCharacter(from: .decimalDigits) {
            return dateFormatter.string(from: self)
        } else {
            return datestr
        }
    }
}
