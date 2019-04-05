//
//  Property.swift
//  zap-challenge-viper
//
//  Created by Renato Medina on 01/04/19.
//  Copyright © 2019 Renato Medina. All rights reserved.
//

import Foundation

public struct Property: Codable {
    
    var id: String
    var listingStatus: String
    var createdAt: String
    var updatedAt: String
    var listingType: String
    var usableAreas: Int
    var parkingSpaces: Int?
    var bathrooms: Int
    var bedrooms: Int
    var images: [String]
    var owner: Bool
    var pricingInfos: PricingInfos
    var address: Address
}

public struct Address: Codable {
    
    var city: String
    var neighborhood: String
    var geoLocation: GeoLocation
}

public struct GeoLocation: Codable {
    
    var precision: String
    var location: Location
}

public struct Location: Codable {
    
    var lon: Double
    var lat: Double
}

public enum BusinessType: String, Codable {
    
    case rental = "RENTAL"
    case sale = "SALE"
}

public enum Period: String, Codable {
    
    case monthly = "MONTHLY"
}

public struct PricingInfos: Codable {
    
    var period: Period?
    var yearlyIptu: String?
    var price: String
    var rentalTotalPrice: String?
    var businessType: BusinessType
    var monthlyCondoFee: String?
}
