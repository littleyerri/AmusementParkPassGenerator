//
//  Access.swift
//  AmusementParkPassGenerator
//
//  Created by Gerardo Zayas on 7/29/17.
//  Copyright © 2017 Little Yerri. All rights reserved.
//

import Foundation

typealias percent = Int

protocol Access {
    // Empty protocol to create an overall Access Type.
}

enum AreaAccess: Access {
    case amusement
    case kitchen
    case control
    case maintenance
    case office
}

enum RideAccess: Access {
    case accessRides
    case skipLines
}

enum DiscountAccess: Access {
    case food10
    case food15
    case food20
    case food25
    case merchandise10
    case merchandise15
    case merchandise20
    case merchandise25
}








