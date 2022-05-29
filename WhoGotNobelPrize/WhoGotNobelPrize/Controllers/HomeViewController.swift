//
//  ViewController.swift
//  WhoGotNobelPrize
//
//  Created by BERAT ALTUNTAŞ on 28.05.2022.
//

import UIKit

// MARK: - HomeViewController
final class HomeViewController: UIViewController {
	internal var viewModel: HomeViewModelProtocol! {
		didSet {
			viewModel.delegate = self
		}
	}
}

// MARK: - Extension: HomeViewModelDelegate
extension HomeViewController: HomeViewModelDelegate {
	
}