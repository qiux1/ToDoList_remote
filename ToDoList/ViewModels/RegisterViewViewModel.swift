//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Xinyu Qiu on 9/3/23.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject{
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func register() {
        guard validate() else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.inserUserRecord(id: userId)
        }
    }
    
    private func inserUserRecord(id: String){
        let newUser = User(id: id,
                           firstName: firstName,
                           lastName: lastName,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        // Password length is more than 12 characters
        guard password.count > 12 else { return false }
        
        // Check if password contains at least one uppercase character
        if password.range(of: "[A-Z]", options: .regularExpression) == nil {
            return false
        }
        
        // Check if password contains at least one lowercase character
        if password.range(of: "[a-z]", options: .regularExpression) == nil {
            return false
        }

        // Check if password contains at least one numeric value
        if password.range(of: "[0-9]", options: .regularExpression) == nil {
            return false
        }

        // Check if password contains at least one special character
        if password.range(of: "[!@#$%^&*()_+{}|:<>?]", options: .regularExpression) == nil {
            return false
        }

        return true
    }

    
    private func validate() -> Bool {
        errorMessage = ""
        guard !firstName.trimmingCharacters(in: .whitespaces).isEmpty,
                !lastName.trimmingCharacters(in: .whitespaces).isEmpty,
                !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter all fields!"
            return false
        }
        
        guard isValidEmail(email) else {
            errorMessage = "Please enter valid email!"
            return false
        }
        
        guard isValidPassword(password) else {
            errorMessage = "Please enter valid password!"
            return false
        }
        
        return true
    }
}
