//
//  DatabaseModel.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by han on 29/11/22.
//

import GoogleSignIn
import Firebase

class DatabaseModel: ObservableObject {
    var ref: DatabaseReference! = Database.database().reference()
    func setUserData(email: String, footprint: Int, donation: Int) {
        let newEmail = email.replacingOccurrences(of: ".", with: ",")
        self.ref.child("results").child(newEmail).setValue([
            "footprint": footprint,
            "latest_donation": donation,
            "date": Date.now.formatted(date: .long, time: .shortened)
        ])
    }
}
