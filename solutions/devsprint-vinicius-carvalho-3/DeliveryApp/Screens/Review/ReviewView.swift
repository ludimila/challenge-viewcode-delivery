//
//  RatingView.swift
//  DeliveryApp
//
//  Created by Ludimila da bela cruz on 22/07/22.
//

import UIKit

final class ReviewView: UIView  {
        
    private let starImageView: UIImageView = {
        let image = UIImage(systemName: "star.fill")
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = false
        imageView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        imageView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        imageView.tintColor = .black
        return imageView
    }()

    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let reviewCountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var starStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = .zero
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(starImageView)
        stack.addArrangedSubview(starImageView2)

        
        return stack
    }()
    
    private lazy var reviewStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(scoreLabel)
        stack.addArrangedSubview(starStackView)
        stack.addArrangedSubview(reviewCountLabel)
        return stack
    }()
    
    convenience init() {
        self.init(frame: .zero)
        setup()
    }
    
    func updateView(with review: Reviews) {
        scoreLabel.text = String(review.score)
        reviewCountLabel.text = String(review.count) + " avaliações"
    }
}

extension ReviewView: ViewCode {
    func setupSubviews() {
        addSubview(reviewStackView)
    }
    
    func setupConstraints() {
        setupReviewStackViewConstraints()
    }
    
    func setupReviewStackViewConstraints() {
        NSLayoutConstraint.activate([
            reviewStackView.heightAnchor.constraint(equalToConstant: 100),
            reviewStackView.widthAnchor.constraint(equalToConstant: 340),
            reviewStackView.bottomAnchor.constraint(equalTo: centerYAnchor),
            reviewStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
}
