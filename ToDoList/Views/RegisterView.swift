//
//  RegisterView.swift
//  ToDoList
//
//  Created by Xinyu Qiu on 9/3/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewmodel = RegisterViewViewModel()
    var body: some View {
        
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "Register",
                           subtitle: "Start organizing todos",
                           angle: -15,
                           backgroundColor: Color.cyan)
                
                
                Form{
                    if !viewmodel.errorMessage.isEmpty{
                        Text(viewmodel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("First Name", text:$viewmodel.firstName)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TextField("Last Name", text:$viewmodel.lastName)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TextField("Email", text:$viewmodel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text:$viewmodel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLButtonView(
                        title: "Create Account",
                        backgroundColor: Color.green){
                            viewmodel.register()
                        }
                    
                }
                .offset(y: -50)
                
                Spacer()
            }
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
