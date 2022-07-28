//
//  RestaurantDetails.swift
//  DeliveryAppChallenge
//
//  Created by Rodrigo Borges on 27/10/21.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {

    private let deliveryApi = DeliveryApi()

    private let restaurantDetailsView: RestaurantDetailsView = {
        let restaurantDetailsView = RestaurantDetailsView()
        return restaurantDetailsView
    }()

    private let reviewView: ReviewView = {
        let reviewView = ReviewView()
        return reviewView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = restaurantDetailsView
        self.view = reviewView
    }

    override func viewDidLoad() {
        navigationItem.title = "Restaurant Detail"
        fetchRestaurantDetails()
    }
    
    func fetchRestaurantDetails() {
        deliveryApi.fetchRestaurantDetails { [weak self] restaurantDetails in
            
            guard let restaurantDetails = restaurantDetails else { return }
            
            DispatchQueue.main.async {
                self?.restaurantDetailsView.updateView(with: restaurantDetails)
                self?.reviewView.updateView(with: restaurantDetails.reviews)
            }
        }
    }
}
