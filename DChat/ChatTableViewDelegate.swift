//
//  ChatTableViewDelegates.swift
//  MChat
//
//  Created by Eduardo Tolmasquim on 10/02/2018.
//  Copyright © 2018 Fullab. All rights reserved.
//

import Foundation
import UIKit

class ChatTableViewDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var controller: ChatController?
    
    let cellName = "ChatViewCell"
    
    func registerCell(tableView: UITableView) {
        tableView.register(UINib(nibName: cellName, bundle: Bundle(for: ChatViewCell.self)), forCellReuseIdentifier: cellName)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller?.threads.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let controller = self.controller else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellName) as? ChatViewCell else {
            return UITableViewCell()
        }
        let thread = controller.threads[indexPath.row]
        let position: ChatViewCell.Position = (thread.name == "Eu") ? .right : .left
        let color: UIColor = (thread.name == "Eu") ? .blue : .clear
        var time:Date? = thread.time
        var name:String? = thread.name
        if controller.threads.count > indexPath.row + 1 {
            let nextThread = controller.threads[indexPath.row + 1]
            if nextThread.name == thread.name {
                time = nil
            }
        }
        if indexPath.row > 0 {
            let lastThread = controller.threads[indexPath.row - 1]
            if lastThread.name == thread.name {
                name = nil
            }
        }
        cell.configure(name: name, message: thread.message, time: time, position: position, messageBackgroundColor: color)
        return cell
    }
}
