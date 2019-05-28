//
//  HomeTableViewCell.swift
//  TravelApp
//
//  Created by Sebastian Strus on 2019-05-19.
//  Copyright © 2019 Sebastian Strus. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.setCellShadow()
        return view
    }()
    
    let pictureImageView: CustomImageView = {
        var iv = CustomImageView()
        iv.layer.cornerRadius = 28
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.borderWidth = 2
        iv.layer.borderColor = UIColor.mainBlue.cgColor
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        //label.text = "Panama"
        label.textColor = .mainBlue
        label.font = AppFonts.LIST_CELL_FONT
        return label
    }()
    
    let candidatesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = "4"
        label.textColor = UIColor.mainBlue
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let candidatesIV: UIImageView = {
        var iv = UIImageView(image: UIImage(named: "candidate_icon"))
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.tintColor = UIColor.mainBlue
        return iv
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2019.06.23-2019.06.17"
        label.textAlignment = .left
        label.textColor = .darkGray
        label.font = AppFonts.LIST_CELL_FONT2
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(cellView)
        backgroundColor = UIColor.white
        selectionStyle = .none
        cellView.addSubview(pictureImageView)
        
        cellView.setAnchor(top: topAnchor,
                           leading: leadingAnchor,
                           bottom: bottomAnchor,
                           trailing: trailingAnchor,
                           paddingTop: 4,
                           paddingLeft: 8,
                           paddingBottom: 4,
                           paddingRight: 8)
        
        pictureImageView.setAnchor(top: nil,
                                   leading: cellView.leadingAnchor,
                                   bottom: nil,
                                   trailing: nil,
                                   paddingTop: 8,
                                   paddingLeft: 8,
                                   paddingBottom: 8,
                                   paddingRight: 8,
                                   width: 56,
                                   height: 56)
        pictureImageView.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        pictureImageView.backgroundColor = UIColor.orange
        
        cellView.addSubview(titleLabel)
        titleLabel.setAnchor(top: cellView.topAnchor,
                             leading: pictureImageView.trailingAnchor,
                             bottom: nil,
                             trailing: cellView.trailingAnchor,
                             paddingTop: 8,
                             paddingLeft: 8,
                             paddingBottom: 0,
                             paddingRight: 8,
                             width: 0,
                             height: 30)
        
        cellView.addSubview(dateLabel)
        dateLabel.setAnchor(top: titleLabel.bottomAnchor,
                                leading: titleLabel.leadingAnchor,
                                bottom: nil,
                                trailing: nil,
                                paddingTop: 0,
                                paddingLeft: 0,
                                paddingBottom: 0,
                                paddingRight: 0,
                                width: 160,
                                height: 22)
        
        cellView.addSubview(candidatesIV)
        candidatesIV.setAnchor(top: nil,
                               leading: nil,
                               bottom: cellView.bottomAnchor,
                               trailing: cellView.trailingAnchor,
                               paddingTop: 0,
                               paddingLeft: 0,
                               paddingBottom: 8,
                               paddingRight: 8,
                               width: 24,
                               height: 24)
        
        cellView.addSubview(candidatesLabel)
        candidatesLabel.setAnchor(top: nil,
                               leading: nil,
                               bottom: candidatesIV.bottomAnchor,
                               trailing: candidatesIV.leadingAnchor,
                               paddingTop: 0,
                               paddingLeft: 0,
                               paddingBottom: 0,
                               paddingRight: 4,
                               width: 48,
                               height: 22)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(imageName: String, date: String, numberCandidates: Int, title: String) {
        pictureImageView.image = UIImage(named: imageName)
        dateLabel.text = date
        candidatesLabel.text = "\(numberCandidates)"
        titleLabel.text = title
    }
}
