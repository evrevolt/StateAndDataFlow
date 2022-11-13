//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Геннадий Ведерников on 13.11.2022.
//

import SwiftUI

class DataManager {
    
    static let shared = DataManager()
    
    @AppStorage("user") private var username: String?
    
    private init () {}
    
    
}
