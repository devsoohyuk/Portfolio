//
//  RealmDB.swift
//  Portfolio
//
//  Created by 홍수혁 on 2020/04/06.
//  Copyright © 2020 홍수혁. All rights reserved.
//

import UIKit
import RealmSwift

class SignIn: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    @objc dynamic var email = ""
}

class RealmDB: NSObject {
    
    let signIn = SignIn()
    let realm = try! Realm()
    
    override init() {
        super.init()
        print("path =  \(Realm.Configuration.defaultConfiguration.fileURL!)")
//        self.save()
        self.search()
//        self.delete()
        
        // 2세 이상의 정보를 가져오기
//        let realm = try! Realm()
//        let puppies = realm.objects(SignIn.self).filter("age > 2")
//        print(puppies)
    }
    
    /*
     *  저장
     */
    func save() {
        signIn.name = "Realm Test"
        signIn.age = 100
        signIn.email = "dokrip2@gmail.com"
        
        try? realm.write {
            realm.add(signIn)
        }
    }
    
    /*
     *  삭제
     */
    func delete() {
        signIn.name = "Realm Test"
        signIn.age = 100
        signIn.email = "dokrip2@gmail.com"
        
        try! realm.write {
            realm.delete(realm.objects(SignIn.self).filter("name=%@", signIn.name))
        }
    }
    
    /*
     *  조회
     */
    func search() {
        let result = realm.objects(SignIn.self)
        
        print(result.sorted(byKeyPath: "name", ascending: true))
        print(result.filter("age == 100"))
        
//        for item in result {
//            print("name = \(item.name)")
//            print("name = \(item.age)")
//            print("name = \(item.email)")
            
//            if let firstSignin = realm.objects(SignIn.self).filter("name = '\(item.name)'").first {
//                print("seccess")
//                print("name = \(item.name)")
//                print("name = \(item.age)")
//                print("name = \(item.email)")
//            }
//        }
    }
    
    /*
     *  수정
     */
//    func update() {
//        if let firstSignin = realm.objects(SignIn.self).filter("name = '\()'").first {
//            try? realm.write {
//                firstSignin.name = "aaaaaa"
//            }
//        }
//    }
}
