//
//  Employee.swift
//  AmusementParkPassGenerator
//
//  Created by Gerardo Zayas on 7/29/17.
//  Copyright © 2017 Little Yerri. All rights reserved.
//

import Foundation

extension Employee {
    var areaAccess: [AreaAccess] {
        var areas: [AreaAccess]
        
        switch type {
        case .foodService:
            areas = [.amusement, .kitchen]
        case .rideService:
            areas = [.amusement, .control]
        case .maintenance:
            areas = [.amusement, .kitchen, .maintenance, .control]
        case .manager:
            areas = [.amusement, .kitchen, .maintenance, .office, .control]
        }
        
        return areas
    }
    
    var discountAccess: [DiscountAccess] {
        var discounts: [DiscountAccess]
        
        switch type {
        case .foodService, .maintenance, .rideService:
            discounts = [.food15, .merchandise25]
        case .manager:
            discounts = [.food25, .merchandise25]
        }
        
        return discounts
    }
    
    var rideAccess: [RideAccess] {
        var rides: [RideAccess]
        
        switch type {
        case .foodService, .maintenance, .rideService, .manager:
            rides = [.accessRides]
        }
        
        return rides
    }
}

class Employee: EmployeeEntrant {
    var type:    EmployeeType
    var profile: Profile
    
    init(as type: EmployeeType, with profile: Profile) throws {
        guard profile.firstName != nil && profile.firstName != "" else {
            throw ProfileError.Invalid(data: "first name", type: type)
        }
        
        guard profile.lastName != nil && profile.lastName != "" else {
            throw ProfileError.Invalid(data: "last name", type: type)
        }
        
        guard profile.street != nil && profile.street != "" else {
            throw ProfileError.Invalid(data: "street", type: type)
        }
        
        guard profile.city != nil && profile.city != "" else {
            throw ProfileError.Invalid(data: "city", type: type)
        }
        
        guard profile.state != nil && profile.state != "" else {
            throw ProfileError.Invalid(data: "state", type: type)
        }
        
        guard profile.zip != nil else {
            throw ProfileError.Invalid(data: "zip code", type: type)
        }
        
        self.type    = type
        self.profile = profile
    }
    
    func check(for access: Access) {
        if let access = access as? AreaAccess {
            if areaAccess.contains(access) {
                print("Access Granted \(access)!")
            } else {
                print("Access Denied \(access)!")
            }
        }
        
        if let access = access as? DiscountAccess {
            if discountAccess.contains(access) {
                print("Access Granted for \(access)!")
            } else {
                print("Access Denied for \(access)!")
            }
        }
        
        if let access = access as? RideAccess {
            if rideAccess.contains(access) {
                print("Access Granted \(access)!")
            } else {
                print("Access Denied \(access)!")
            }
        }
    }
}









