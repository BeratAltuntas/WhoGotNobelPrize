//
//  ViewController.swift
//  WhoGotNobelPrize
//
//  Created by BERAT ALTUNTAŞ on 28.05.2022.
//

import UIKit
enum HomeViewControllerConstants {
	static let segueIndetifier = ""
	static let tableViewCellIdentifier = ""
}

// MARK: - HomeViewController
final class HomeViewController: UIViewController {
	internal var viewModel: HomeViewModelProtocol! {
		didSet {
			viewModel.delegate = self
		}
	}
	override func viewDidLoad() {
		viewModel.FetchData()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == HomeViewControllerConstants.tableViewCellIdentifier {
			let targetVC = segue.destination as! DetailViewController
			targetVC.viewModel = DetailViewModel()
		}
	}
}

// MARK: - Extension: HomeViewModelDelegate
extension HomeViewController: HomeViewModelDelegate {
	
}
