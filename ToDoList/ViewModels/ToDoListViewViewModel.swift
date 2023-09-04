//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Xinyu Qiu on 9/3/23.
//
import FirebaseFirestore
import Foundation

//list of items view
class ToDoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId : String
    init(userId: String){
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: item id to delete
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
