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
    func setUserData(email: String, name: String, footprint: Int, donation: Int) {
        let newEmail = email.replacingOccurrences(of: "[\\.\\$\\[\\]\\#]", with: ",", options: .regularExpression)
        self.ref.child("results").child(newEmail).setValue([
            "name": name,
            "footprint": footprint,
            "latest_donation": donation,
            "date": Date.now.formatted(date: .long, time: .shortened)
        ])
    }
    func setAnonymousData(footprint: Int, donation: Int) {
        self.ref.child("results").child(String(NSDate().timeIntervalSince1970).replacingOccurrences(of: ".", with: ",")).setValue([
            "footprint": footprint,
            "latest_donation": donation,
            "date": Date.now.formatted(date: .long, time: .shortened)
        ])
    }
}
