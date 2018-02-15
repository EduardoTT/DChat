//
//  ChatView.swift
//  MChat
//
//  Created by Eduardo Tolmasquim on 10/02/2018.
//  Copyright © 2018 Fullab. All rights reserved.
//

import UIKit

class ChatView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var tableViewDelegate: ChatTableViewDelegate!
    
    @IBOutlet var textViewDelegate: ChatTextViewDelegate!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var bottomViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bottomViewBottomConstraint: NSLayoutConstraint!
    
    let controller = ChatController()
    
    var shouldHandleKeyboard = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Atendimento"
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100
        self.tableViewDelegate.registerCell(tableView: self.tableView)
        self.tableViewDelegate.controller = self.controller
        
        if self.shouldHandleKeyboard {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
            let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
            self.view.addGestureRecognizer(tap)
        }
        
        self.textViewDelegate.bottomViewHeightConstraint = self.bottomViewHeightConstraint
        self.scrollToBottom()
    }

    init() {
        super.init(nibName: "ChatView", bundle: Bundle(for: ChatView.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    private func setBottomViewPosition(notification: Notification) {
        let curFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let targetFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = targetFrame.origin.y - curFrame.origin.y
        self.bottomViewBottomConstraint.constant += deltaY
        UIView.animate(withDuration: 1.0, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    private func scrollToBottom() {
        if self.controller.threads.isEmpty == false {
            let lastRow = IndexPath(row: self.controller.threads.count - 1, section: 0)
            self.tableView.scrollToRow(at: lastRow, at: .middle, animated: false)
        }
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        self.setBottomViewPosition(notification: notification)
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        self.setBottomViewPosition(notification: notification)
    }
    
    @objc func hideKeyboard() {
        self.textView.resignFirstResponder()
        self.textViewDelegate.setHeight(self.textView)
    }
    
    @IBAction func didTapSend() {
        guard let text = self.textView.text, text != "" else {
            return
        }
        self.hideKeyboard()
        self.controller.createMessage(text: text)
        self.tableView.reloadData()
        self.scrollToBottom()
        self.textView.text = ""
    }
    
}
