//
//  TodoListViewModel.swift
//  TODOList3
//
//  Created by user on 11/11/23.
//

import Foundation


class TodoListViewModel: ObservableObject {
    @Published var todos: [TodoItem] = [TodoItem(name: "Walk a dog")]
    
    func add(name: String) {
        let newTodo = TodoItem(name: name)
        todos.append(newTodo)
    }
    
    func completeTodo(todo: TodoItem) {
        guard let index = todos.firstIndex(of: todo) else { return }
        todos[index].isCompleted.toggle()
    }
    
    func delete(index: IndexSet) {
        todos.remove(atOffsets: index)
    }
}
