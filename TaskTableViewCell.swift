//
//  TaskTableViewCell.swift
//  TaskManedger
//
//  Created by Илья Рехтин on 03.09.2022.
//

import SnapKit
import UIKit

final class TaskTableViewCell: UITableViewCell {
    
    static let reuseID = "task"
    
    var descroptionLabel: UILabel! = {
        let lable = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        lable.font = UIFont(name: "Avenir", size: 22)
        return lable
    }()
    
    var subTaskCountLabel: UILabel! = {
        let lable = UILabel(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        lable.font = UIFont(name: "Avenir", size: 17)
        return lable
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurationCell(_ description: String, subTaskCount: Int) {
        self.addSubview(self.descroptionLabel)
        self.descroptionLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(2)
            make.right.left.equalToSuperview().inset(5)
            make.height.equalTo(30)
        }
        self.addSubview(self.subTaskCountLabel)
        self.subTaskCountLabel.snp.makeConstraints { make in
            make.top.equalTo(self.descroptionLabel.snp.bottom).inset(2)
            make.bottom.equalToSuperview().inset(2)
            make.left.right.equalToSuperview().inset(5)
        }
        self.descroptionLabel.text = description
        self.subTaskCountLabel.text = "Кол - во подзадач: \(subTaskCount)"
    }
    
    
}
