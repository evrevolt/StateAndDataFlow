//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import Foundation
import SwiftUI

class UserManager: ObservableObject {
    
    //@AppStorage("isRegister") var isRegister = false
    
    @Published var isRegister = UserDefaults.standard.bool(forKey: "isRegister")
    
    @AppStorage("username") var name = ""
    
}
