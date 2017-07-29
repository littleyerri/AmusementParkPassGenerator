//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Gerardo Zayas on 7/29/17.
//  Copyright © 2017 Little Yerri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            // Guests
            // Create Guest = Classic
//            let classic = try Guest(as: .classic, with: nil)
//            classic.check(for: AreaAccess.kitchen)
//            classic.check(for: RideAccess.accessRides)
            
            // Create Guest = VIP
//            let vip = try Guest(as: .vip, with: nil)
//            vip.check(for: DiscountAccess.food20)
//            vip.check(for: RideAccess.skipLines)
            
            // Failing test for freeChild since birthday is missing
//            let freeChild = try Guest(as: .freeChild, with: Profile(freeChildBirthday: nil))
            
            // Employees
            var profile = Profile(employeeWith: "Gerardo",
                                  lastName: "Zayas",
                                  street: "100 Rolling Oak Dr",
                                  city: "Easley", state: "SC",
                                  zip: 29642, birthday: nil)
            
            // Create Employee = Food Services
//            let foodService = try Employee(as: .foodService, with: profile)
//            foodService.check(for: AreaAccess.maintenance)
//            foodService.check(for: DiscountAccess.merchandise25)
            
            // Create Employee = Maintenance
//            let maintenance = try Employee(as: .maintenance, with: profile)
//            maintenance.check(for: AreaAccess.maintenance)
//            maintenance.check(for: AreaAccess.kitchen)
            
            profile.firstName = ""
            
            // Other
//            profile.state  = nil
//            profile.street = ""
//            profile.city   = nil
            
            // Create Employee = Ride Services
            let rideService = try Employee(as: .maintenance, with: profile)
            rideService.check(for: AreaAccess.office)
            rideService.check(for: RideAccess.accessRides)
            
            profile.firstName = "Manager"
            
//            let manager = try Employee(as: .manager, with: profile)
//            manager.check(for: AreaAccess.office)
//            manager.check(for: DiscountAccess.food25)
            
        } catch ProfileError.Invalid(let data, let type) {
            print("Error, \(type) was missing \(data).")
        } catch {
            print("Unknown error has occured.")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

