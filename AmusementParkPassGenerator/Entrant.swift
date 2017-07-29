//
//  Entrant.swift
//  AmusementParkPassGenerator
//
//  Created by Gerardo Zayas on 7/29/17.
//  Copyright © 2017 Little Yerri. All rights reserved.
//

import Foundation

protocol Entrant {
    var areaAccess: [AreaAccess] { get }
    var rideAccess: [RideAccess] { get }
    
    func check(for access: Access)
}

protocol EmployeeEntrant: Entrant {
    var type: EmployeeType { get }
    var discountAccess: [DiscountAccess] { get }
    var profile: Profile { get set }
}

protocol GuestEntrant: Entrant {
    var type: GuestType { get }
    var discountAccess: [DiscountAccess]? { get }
    var profile: Profile? { get set }
}

protocol EntrantType {
    // Empty protocol to create an overall Entrant Type
}

enum EmployeeType: EntrantType {
    case foodService
    case rideService
    case maintenance
    case manager
}

enum GuestType: EntrantType {
    case classic
    case vip
    case freeChild
}









