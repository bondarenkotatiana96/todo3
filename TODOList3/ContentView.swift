//
//  ContentView.swift
//  TODOList3
//
//  Created by user on 11/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = TodoListViewModel()
    @State var name = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("", text: $name)
                    .onSubmit {
                        viewModel.add(name: name)
                        name = ""
                    }
                    .padding(.all)
                    .border(.black)
                List {
                    ForEach(viewModel.todos) { todo in
                        HStack {
                            Text(todo.name)
                            Spacer()
                            Button {
                                viewModel.completeTodo(todo: todo)
                            } label: {
                                Image(systemName: todo.isCompleted ? "checkmark" : "square")
                            }
                            
                        }
                    }
                    .onDelete(perform: viewModel.delete(index:))
                }
            }
            .navigationTitle("My todo list")
            .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
