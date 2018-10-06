//
//  main.swift
//  Practice
//
//  Created by Leandro Wauters on 10/5/18.
//  Copyright © 2018 Leandro Wauters. All rights reserved.
//

import Foundation



let outcome = Int.random(in: 0...5)
switch outcome {
case 0:
    print("Today will be a nice day")
case 1:
    print("Today is going to suck")
case 2:
    print("Today you'll find a new friend")
case 3:
    print("Today you'll find love")
case 4:
    print("Today you'll find a enemy")
default:
    print("Today you'll find happiness")

}
