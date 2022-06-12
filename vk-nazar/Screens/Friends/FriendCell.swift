//
//  FriendCell.swift
//  vk-nazar
//
//  Created by Artur Igberdin on 12.06.2022.
//

import UIKit
import SDWebImage

final class FriendCell: UITableViewCell {
    
    static let identifier = "FriendCell"
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        //imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true //Маскируй по границам (отрендерить границы)
        
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0 //снимаем ограничение на количество строк
        label.lineBreakMode = .byWordWrapping //перенос по словам
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public
    func configure(_ friend: Friend) {
        nameLabel.text = friend.name
        photoImageView.image = friend.image
    }
    
    
    //MARK: - Private methods
    private func setupViews() {
        
        contentView.addSubview(photoImageView)
        contentView.addSubview(nameLabel)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            photoImageView.widthAnchor.constraint(equalToConstant: 50),
            photoImageView.heightAnchor.constraint(equalToConstant: 50),
            photoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: photoImageView.rightAnchor, constant: 20),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
}
