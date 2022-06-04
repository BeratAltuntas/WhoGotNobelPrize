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
	@IBOutlet private weak var labelDate: UILabel!
	@IBOutlet private weak var tableView: UITableView!
	
	internal var viewModel: HomeViewModelProtocol! {
		didSet {
			viewModel.delegate = self
		}
	}
	
	internal var selectedIndex = 0
	override func viewDidLoad() {
		self.viewModel = HomeViewModel()
		viewModel.LoadUI()
	}
	override func viewWillAppear(_ animated: Bool) {
		labelDate.text = viewModel.LoadTime()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let laureate = viewModel.winners?[selectedIndex] {
			if segue.identifier == HomeViewControllerConstants.segueIndetifier {
				let targetVC = segue.destination as! DetailViewController
				targetVC.viewModel = DetailViewModel()
				targetVC.selectedLaureate = laureate
			}
		}
	}
}

// MARK: - Extension: HomeViewModelDelegate
extension HomeViewController: HomeViewModelDelegate {
	func ReloadTableView() {
		DispatchQueue.main.async { [weak self] in
			self?.tableView.reloadData()
		}
	}
}
