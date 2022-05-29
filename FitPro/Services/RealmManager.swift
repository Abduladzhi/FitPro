//
//  RealmManager.swift
//  FitPro
//
//  Created by Abduladzhi on 28.05.2022.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    
    private init() {}
    
    let localeRealm = try! Realm()
    
    func saveWorkOutModel(model: WorkoutModel) {
        try! localeRealm.write({
            localeRealm.add(model)
        })
    }
    
}
