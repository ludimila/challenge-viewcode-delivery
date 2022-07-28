//
//  RatingView.swift
//  DeliveryApp
//
//  Created by Ludimila da bela cruz on 22/07/22.
//

import UIKit

final class ReviewView: UIView  {

    var scoreLabel: UILabel {
        let label = UILabel()
        label.text = "4,8 ★★★★★"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.numberOfLines = .zero
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    var countLabel: UILabel {
        let label = UILabel()
        label.text = "35100 avaliações"
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .lightGray
        label.numberOfLines = .zero
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    lazy var reviewStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 60
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(scoreLabel)
        stack.addArrangedSubview(countLabel)
        
        return stack
    }()
    
    convenience init() {
        self.init(frame: .zero)
        setup()
    }
    
    func updateView(with review: Reviews) {
        scoreLabel.text = "texto"
        countLabel.text = "texto"
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
