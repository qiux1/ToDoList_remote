//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Xinyu Qiu on 9/3/23.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewmodel = ToDoListViewViewModel()
    @FirestoreQuery var items: [ToDoListItem]
    //we need it for firestore to observe entry for specific path
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(items) {item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button{
                                viewmodel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                                    .foregroundColor(Color.red)
                            }
                        }
                }
                .listStyle(PlainListStyle())
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
        ToDoListView(userId: "Di8Wbdkur7ZJVrZc2mYIaZ9hJF52")
    }
}
