//
//  NewItemView.swift
//  ToDoList
//
//  Created by Xinyu Qiu on 9/3/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewmodel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size:32))
                .bold()
                .padding(.top, 100)
            
            Form {
                //Title
                TextField("Title", text: $viewmodel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //Due Date
                DatePicker("Due Date", selection: $viewmodel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    
                TLButtonView(
                    title: "Save",
                    backgroundColor: Color.mint
                ){
                    //save
                    if viewmodel.canSave {
                        viewmodel.save()
                        newItemPresented = false
                    } else {
                        viewmodel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewmodel.showAlert){
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or newer"))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
