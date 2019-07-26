//
//  SettingsProvider.swift
//  doit
//
//  Copyright © 2019 Depromeet. All rights reserved.
//

extension UserDefaults {
    // Basic values
    subscript<T>(key: String) -> T? {
        get {
            return value(forKey: key) as? T
        }
        set {
            set(newValue, forKey: key)
        }
    }
    
    // Enums
    subscript<T: RawRepresentable>(key: String) -> T? {
        get {
            if let rawValue = value(forKey: key) as? T.RawValue {
                return T(rawValue: rawValue)
            }
            return nil
        }
        set {
            set(newValue?.rawValue, forKey: key)
        }
    }
}

class SettingsProvider {
    
    static let shared = SettingsProvider()
    
    var isUserLoggedIn: Bool {
        get { return UserDefaults.standard[#function] ?? false }
        set { UserDefaults.standard[#function] = newValue }
    }
    
    var memberId: Int {
        get { return UserDefaults.standard[#function] ?? 0 }
        set { UserDefaults.standard[#function] = newValue }
    }
    
    var memberName: String {
        get { return UserDefaults.standard[#function] ?? "" }
        set { UserDefaults.standard[#function] = newValue }
    }
    
    var memberProfileImageUrl: String {
        get { return UserDefaults.standard[#function] ?? "" }
        set { UserDefaults.standard[#function] = newValue }
    }
}

