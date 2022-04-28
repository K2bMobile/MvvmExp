//
//  PersonFollowingTableViewCell.swift
//  MvvmExp
//
//  Created by suresh k on 27/04/22.
//

import UIKit

class PersonFollowingTableViewCell: UITableViewCell {

    static let identifier = "PersonFollowingTableViewCell"
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(userImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(button)
        contentView.clipsToBounds = true
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    func configure(with viewModel: PersonFollowingTableViewCellViewModel){
        nameLabel.text = viewModel.name
        usernameLabel.text = viewModel.userName
        userImageView.image = viewModel.image
        if viewModel.currentlyFollowing{
            button.setTitle("Unfollow", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        }else{
            button.setTitle("Follow", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .link
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let imagewidth = contentView.frame.size.height-10
        userImageView.frame = CGRect(x: 5, y: 5, width:imagewidth , height: imagewidth)
        nameLabel.frame = CGRect(x: imagewidth + 10, y: 0, width: contentView.frame.size.width-imagewidth, height: contentView.frame.size.height/2)
        usernameLabel.frame = CGRect(x: imagewidth + 10, y: contentView.frame.size.height/2, width: contentView.frame.size.width-imagewidth, height: contentView.frame.size.height/2)
        button.frame = CGRect(x: contentView.frame.size.width-120, y: 0, width: 110, height: contentView.frame.size.height-20)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
