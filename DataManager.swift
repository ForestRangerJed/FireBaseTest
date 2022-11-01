//
//  DataManager.swift
//  FireBaseTest
//
//  Created by Jared Eldridge on 10/31/22.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var candy: [Candy] = []
    
    init() {
        fetchcandy()
    }
    
    func fetchcandy() {
        candy.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Candy")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    
                    let candy = Candy(id: id, name: name)
                    self.candy.append(candy)
                }
            }
        }
    }
    
    func addCandy(candyName: String) {
        let db = Firestore.firestore()
        let ref = db.collection("Candy").document(candyName)
        ref.setData(["name": candyName, "id": 10]){ error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        fetchcandy()
    }
}
