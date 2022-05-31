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
	override func viewDidLoad() {
		FetchData()
	}
	func FetchData() {
		NetworkManager.shared.fetchData(endPoint: Config.laureateUrl, type: LaureatesModel?.self) { response in
			switch response {
			case .success(let result):
				print(result.laureates?.first?.familyName?.en)
				break
			case .failure(let error):
				print(error)
			}
		}
	}
}

// MARK: - Extension: HomeViewModelDelegate
extension HomeViewController: HomeViewModelDelegate {
	
}
