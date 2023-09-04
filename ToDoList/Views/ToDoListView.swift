//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Xinyu Qiu on 9/3/23.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewmodel = ToDoListViewViewModel()
    private let userId: String
    
    init(userId: String){
        self.userId = userId
        
    }
    
    var body: some View {
        NavigationView {
            VStack{
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button{
                    //add new to do list item
                    viewmodel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewmodel.showingNewItemView){
                NewItemView(newItemPresented: $viewmodel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "")
    }
}
