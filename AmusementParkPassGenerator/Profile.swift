//
//  Profile.swift
//  AmusementParkPassGenerator
//
//  Created by Gerardo Zayas on 7/29/17.
//  Copyright © 2017 Little Yerri. All rights reserved.
//

import Foundation

struct Profile {
    var firstName: String?
    var lastName:  String?
    var street:    String?
    var city:      String?
    var state:     String?
    var zip:       Int?
    var birthday:  Date?
    
    // Initializing guest
    init(firstName: String?, lastName: String?, street: String?,
         city: String?, state: String?, zip: Int?, birthday:  Date?) {
        self.firstName = firstName
        self.lastName  = lastName
        self.street    = street
        self.city      = city
        self.state     = state
        self.zip       = zip
        self.birthday  = birthday
    }
    
    // Initializing employee
    init(employeeWith firstName: String?, lastName: String?, street: String?,
         city: String?, state: String?, zip: Int?, birthday:  Date?) {
        self.init(firstName: firstName, lastName: lastName, street: street,
                  city: city, state: state, zip: zip, birthday: nil)
    }
    
    // Initializing birthday date to check for free child entrance
    init(freeChildBirthday birthday: Date?) {
        self.birthday = birthday
    }
}

enum ProfileError: Error {
    case Invalid(data: String, type: EntrantType)
}









