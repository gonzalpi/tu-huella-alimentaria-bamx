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
        let startTime = Date.now
        let newEmail = email.replacingOccurrences(of: "[\\.\\$\\[\\]\\#]", with: ",", options: .regularExpression)
        self.ref.child("results").child(newEmail).setValue([
            "name": name,
            "footprint": footprint,
            "latest_donation": donation,
            "date": Date.now.formatted(date: .long, time: .shortened)
        ]) { _, _ in
            print("Send user data duration:", String(Date.now.timeIntervalSince(startTime)))
        }
    }
    func setAnonymousData(footprint: Int, donation: Int) {
        let startTime = Date.now
        self.ref.child("results").child(String(NSDate().timeIntervalSince1970).replacingOccurrences(of: ".", with: ",")).setValue([
            "footprint": footprint,
            "latest_donation": donation,
            "date": Date.now.formatted(date: .long, time: .shortened)
        ]) { _, _ in
            print("Send anonymous data duration:", String(Date.now.timeIntervalSince(startTime)))
        }
    }
}
