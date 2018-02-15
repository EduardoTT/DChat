//
//  ChatTextViewDelegate.swift
//  MChat
//
//  Created by Eduardo Tolmasquim on 14/02/2018.
//  Copyright © 2018 Fullab. All rights reserved.
//

import Foundation
import UIKit

class ChatTextViewDelegate: NSObject, UITextViewDelegate {
    
    var bottomViewHeightConstraint: NSLayoutConstraint?
    
    func setHeight(_ textView: UITextView) {
        let height = textView.contentSize.height
        if height < 60 {
            self.bottomViewHeightConstraint?.constant = 60
        } else if height < 150 {
            self.bottomViewHeightConstraint?.constant = height + 20
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.setHeight(textView)
    }
    
}
