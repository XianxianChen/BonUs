//
//  User.swift
//  FamMe
//
//  Created by C4Q on 1/7/19.
//  Copyright © 2019 C4Q. All rights reserved.
//

import Foundation
import RealmSwift
// dynamic means each object must be available at run time
//The dynamic keyword is a declaration modifier that you can apply to either function or variable declarations. You may see this when using libraries like NewRelic or something similar for app analytics. What dynamic does is tells the runtime to use dynamic dispatch over static dispatch for the function or variables modified. It also implicitly adds the @objc attribute to the variable or function declaration.
//Basically, if you know that a certain function or property will be interfered/replaced/swizzled by someone at runtime, then it's a good idea to mark it dynamic. If you don't, you could get a crash from the compiler devirtualizing access/inlining implementations (this is an optimization you get for free) to your functions, even though other code is trying to use runtime magic that doesn't play well with those optimizations.
@objcMembers class User: Object {
     dynamic var email: String = ""
     private var password: String = ""
    var name: String = ""
   // var DOB: String
    var id: String = ""
    var age = RealmOptional<Int>()
    var phone: String? = nil
    
    convenience init(email: String,  password: String, name: String, id: String, age: Int?,  phone: String?) {
        self.init()
        self.email = email
        self.password = password
        self.name = name
       // self.DOB = DOB
        self.id = id
        self.age.value = age
        self.phone = phone
    }
}
