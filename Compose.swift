//
//  Task.swift
//  TaskManedger
//
//  Created by Илья Рехтин on 02.09.2022.
//

import Foundation

protocol Compose {
    var name: String {get set}
    
    func addComponent(c: Compose)
    func deleteComponent(at index: Int)
    func contentCount() -> Int
    func showContent() -> [Compose]
}
