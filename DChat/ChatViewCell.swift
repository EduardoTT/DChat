//
//  ChatViewCell.swift
//  MChat
//
//  Created by Eduardo Tolmasquim on 10/02/2018.
//  Copyright © 2018 Fullab. All rights reserved.
//

import UIKit

class ChatViewCell: UITableViewCell {

    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet var rightTrailingConstraint: NSLayoutConstraint!
    @IBOutlet var leftTrailingConstraint: NSLayoutConstraint!
    @IBOutlet var rightLeadingConstraint: NSLayoutConstraint!
    @IBOutlet var leftLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var messageBackgroundView: UIView!
    
    @IBOutlet weak var messageLabelLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageLabelTrailingConstraint: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    func configure(name: String?, message: String, time: Date?, position: Position, messageBackgroundColor: UIColor) {
        
        if let name = name {
            self.nameLabel.text = name
            self.nameView.isHidden = false
        } else {
            self.nameView.isHidden = true
        }
        
        if let time = time {
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "pt_BR")
            formatter.dateFormat = "HH:mm dd 'de' MMMM 'de' yyyy"
            self.timeLabel.text = formatter.string(from: time)
            self.timeView.isHidden = false
        } else {
            self.timeView.isHidden = true
        }
        
        switch position {
        case .left:
            self.nameLabel.textAlignment = .left
            self.messageLabel.textAlignment = .left
            self.timeLabel.textAlignment = .left
            self.messageLabel.backgroundColor = .white
            self.messageLabel.textColor = .gray
            self.nameLabel.textColor = .blue
            self.leftLeadingConstraint?.isActive = true
            self.leftTrailingConstraint?.isActive = true
            self.rightLeadingConstraint?.isActive = false
            self.rightTrailingConstraint?.isActive = false
            self.messageLabelLeadingConstraint.constant = 8
            if messageBackgroundColor == .clear {
                self.messageLabelLeadingConstraint.constant = 0
            }
        case .right:
            self.nameLabel.textAlignment = .right
            self.messageLabel.textAlignment = .right
            self.timeLabel.textAlignment = .right
            self.messageLabel.backgroundColor = .blue
            self.messageLabel.textColor = .white
            self.leftLeadingConstraint?.isActive = false
            self.leftTrailingConstraint?.isActive = false
            self.rightLeadingConstraint?.isActive = true
            self.rightTrailingConstraint?.isActive = true
            self.messageLabelTrailingConstraint.constant = 8
            if messageBackgroundColor == .clear {
                self.messageLabelTrailingConstraint.constant = 0
            }
        }
        
        self.messageLabel.text = message
        self.messageBackgroundView.backgroundColor = messageBackgroundColor
        
    }
    
    enum Position {
        case left, right
    }
}
