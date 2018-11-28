//
//  DBManager.swift
//  Cars
//
//  Created by Msheikh on 11/28/18.
//  Copyright © 2018 Msheikh. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager <T>{
    private var   database:Realm
//    static let   sharedInstance = DBManager()
    private init() {
        database = try! Realm()
    }
    func getDataFromDB<T:Object>() ->   Results<T> {
        let results: Results<T> =   database.objects(T.self)
        return results
    }
    
    func addData<T:Object>(object: T)   {
        try! database.write {
            database.add(object, update: true)
            print("Added new object")
        }
    }
  
    func deleteAllFromDatabase()  {
        try!   database.write {
            database.deleteAll()
        }
    }
 
    func deleteFromDb<T:Object>(object: T)   {
        try!   database.write {
            database.delete(object)
        }
    }
}
