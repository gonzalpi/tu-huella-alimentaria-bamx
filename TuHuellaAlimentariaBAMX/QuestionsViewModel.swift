//
//  QuestionsViewModel.swift
//  TuHuellaAlimentariaBAMX
//
//  Created by han on 24/11/22.
//

import Foundation
import FirebaseDatabase

final class QuestionsViewModel: ObservableObject {
    @Published var questions: [QuestionType] = []
    
    private lazy var databasePath: DatabaseReference? = {
        let ref = Database.database().reference().child("questions")
        return ref
    }()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    func listentoRealtimeDatabase() {
        guard let databasePath = databasePath else {
            return
        }
        databasePath
            .observe(.childAdded) { [weak self] snapshot in
                guard
                    let self = self,
                    var json = snapshot.value as? [String: Any]
                else {
                    return
                }
                json["id"] = snapshot.key
                do {
                    let questionsData = try JSONSerialization.data(withJSONObject: json)
                    let question = try self.decoder.decode(QuestionType.self, from: questionsData)
                    self.questions.append(question)
                } catch {
                    print("an error occurred", error)
                }
            }
    }
    
    func stopListening() {
        databasePath?.removeAllObservers()
    }
}
