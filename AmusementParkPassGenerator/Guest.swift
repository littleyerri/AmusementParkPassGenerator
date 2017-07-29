//
//  Guest.swift
//  AmusementParkPassGenerator
//
//  Created by Gerardo Zayas on 7/29/17.
//  Copyright © 2017 Little Yerri. All rights reserved.
//

import Foundation

extension Guest {
    var areaAccess: [AreaAccess] {
        var areas: [AreaAccess]
        
        switch type {
        case .classic, .vip, .freeChild:
            areas = [.amusement]
        }
        
        return areas
    }
    
    var discountAccess: [DiscountAccess]? {
        var discounts: [DiscountAccess]?
        
        switch type {
        case .classic, .freeChild:
            discounts = nil
        case .vip:
            discounts = [.food10, .merchandise20]
        }
        
        return discounts
    }
    
    var rideAccess: [RideAccess] {
        var rides: [RideAccess]
        
        switch type {
        case .classic, .freeChild:
            rides = [.accessRides]
        case .vip:
            rides = [.accessRides, .skipLines]
        }
        
        return rides
    }
}

class Guest: GuestEntrant {
    var type: GuestType
    var profile: Profile?
    
    init(as type: GuestType, with profile: Profile?) throws {
        if type == .freeChild {
            guard profile?.birthday != nil else {
                throw ProfileError.Invalid(data: "birthday", type: type)
            }
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
            if let discount = discountAccess {
                if discount.contains(access) {
                    print("Access Granted for \(access)!")
                } else {
                    print("Access Denied for \(access)!")
                }
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









