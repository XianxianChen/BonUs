//
//  CalendarVars.swift
//  FamMe
//
//  Created by C4Q on 9/25/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
let date = Date()
let calendar = Calendar.current

let dayIndex = calendar.component(.day, from: date)  // currentDay
let weekdayIndex = calendar.component(.weekday, from: date)  // currentWeekday
var monthIndex = calendar.component(.month, from: date) - 1
var year = calendar.component(.year, from: date)


// for printing purpose

let f = DateFormatter()
let weekdays = f.weekdaySymbols!

