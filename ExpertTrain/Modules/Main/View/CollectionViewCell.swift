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
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.text = "Description Description Description"
        return label
    }()
    
    private let colorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.text = "red"
        return label
    }()
    
    private let likesCountLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17, weight: .medium)
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
        return stackView
    }()
    
    private let bottomLabelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
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

    // MARK: - Private methods
    
    private func setupUI() {
        backgroundColor = .blue
        
        bottomLabelsStackView.addArrangedSubviews(colorLabel, likesCountLabel)
        labelsStackView.addArrangedSubviews(descriptionLabel, bottomLabelsStackView)
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
