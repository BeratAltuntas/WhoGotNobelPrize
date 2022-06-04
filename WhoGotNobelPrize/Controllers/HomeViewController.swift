//
//  ViewController.swift
//  WhoGotNobelPrize
//
//  Created by BERAT ALTUNTAŞ on 28.05.2022.
//

import UIKit
enum HomeViewControllerConstants {
	static let segueIndetifier = "winnerDetailSegue"
	static let tableViewCellIdentifier = "winnersTableViewCell"
}

// MARK: - HomeViewController
final class HomeViewController: UIViewController {
	internal var viewModel: HomeViewModelProtocol! {
		didSet {
			viewModel.delegate = self
		}
	}
	@IBOutlet private weak var tableView: UITableView!
	override func viewDidLoad() {
		self.viewModel = HomeViewModel()
		viewModel.LoadUI()
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
	var titleUI: String {
		get {
			self.title!
		}
		set(value) {
			self.title = value
		}
	}
	
	func ReloadTableView() {
		DispatchQueue.main.async { [weak self] in
			self?.tableView.reloadData()
		}
	}
}
