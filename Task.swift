//
//  Task.swift
//  TaskManedger
//
//  Created by Илья Рехтин on 02.09.2022.
//

import Foundation

final class Task: Compose {
    
    var name: String
    private var subTask = [Compose]()
    
    init( name: String) {
        self.name = name
    }
    
    func showContent() -> [Compose] {
        subTask
    }
    
    func addComponent(c: Compose) {
        self.subTask.append(c)
    }
    
    func deleteComponent(at index: Int) {
        self.subTask.remove(at: index)
    }
    
    func contentCount() -> Int {
        return self.subTask.count
    }
    
}
