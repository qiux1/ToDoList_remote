//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Xinyu Qiu on 9/3/23.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func login(){
        guard validate() else {
            return
        }
        
        //try log in
        Auth.auth().signIn(withEmail: email, link: password)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailPattern)
        return emailPredicate.evaluate(with: email)
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        //check if the email and password is empty, if so ret
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill in all fields!"
            return false
        }
        
        //email@foo.com
        guard isValidEmail(email) else {
            errorMessage = "Please enter a valid email!"
            return false
        }
        
        print("Called")
        return true
    }
}
