//
//  CollectionViewCell.swift
//  ExpertTrain
//
//  Created by CT4TuEI3 on 09.06.2025.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 2
        label.text = "Description"
        return label
    }()
    
    private let likesCountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.text = "30 likes"
        label.textAlignment = .right
        return label
    }()
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private let labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8.0
        return stackView
    }()
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    // MARK: - Configure
    
    func configure(_ photo: MainModel?) {
        guard let photo else { return }
        imageView.imageFrom(urlString: photo.urls.thumb)
        descriptionLabel.text = photo.displayDescription
        descriptionLabel.textColor = UIColor(hex: photo.color)
        likesCountLabel.text = "\(photo.likes) 👍"
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        backgroundColor = .systemBackground
        
        labelsStackView.addArrangedSubviews(descriptionLabel, likesCountLabel)
        mainStackView.addArrangedSubviews(imageView, labelsStackView)
        contentView.addSubviews(mainStackView)
        
        setupConstraints()
    }
}

// MARK: - Constraints

private
extension CollectionViewCell {
    func setupConstraints() {
        mainStackView.layout {
            $0.topAnchor.constraint(equalTo: contentView.topAnchor)
            $0.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
            $0.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            $0.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        }
    }
}
