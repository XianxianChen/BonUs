//
//  HealthStore.swift
//  FamMe
//
//  Created by C4Q on 12/12/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import HealthKit

class HealthStore {
    static let shared = HealthStore()
    let store = HKHealthStore()
    
    func requestAuthorization(_ completionHandler: @escaping (Bool?, Error?) -> Void) {
        var shareTypes = Set<HKSampleType>()
        var readType = Set<HKSampleType>()
        print(self.store)
        store.requestAuthorization(toShare: shareTypes , read: readType) { (bool, error) in
            completionHandler(bool, error)
        }
    }
    
    func nonEscape() {
        
    }
}
