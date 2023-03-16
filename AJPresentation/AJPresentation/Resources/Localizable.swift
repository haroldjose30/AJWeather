//
//  Localizable.swift
//  AJPresentation
//
//  Created by Jose Harold on 13/03/2023.
//

import Foundation

enum Localizable {
    static let loading: String = localizedString("loading_message", default: "Loading...")
    static let genericError: String = localizedString("generic_error_message", default: "oops something went wrong.")
    static let retry: String = localizedString("retry_button_title", default: "Retry")
    static let emptyDate: String = localizedString("empty_date", default: "oops, no weather info was found, try another city.")
    static let reload: String = localizedString("reload_button_title", default: "Reload data")
}

func localizedString(_ key: String, default defaultValue: String) -> String {
    
    let localized = Bundle.main.localizedString(forKey: key, value: nil, table: nil)
    var defaultValueMuttable = defaultValue
#if DEBUG
    //Show Not Localized string
    defaultValueMuttable = "*\(defaultValue)*"
#endif
    return localized == key ? defaultValueMuttable : localized
}
