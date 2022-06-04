//
//  HomeViewControllerExtensions.swift
//  WhoGotNobelPrize
//
//  Created by BERAT ALTUNTAŞ on 4.06.2022.
//
import UIKit

extension HomeViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		selectedIndex = indexPath.row
		performSegue(withIdentifier: HomeViewControllerConstants.segueIndetifier, sender: self)
	}
}

extension HomeViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		guard let count = viewModel.winners?.count else { return 0 }
		return count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewControllerConstants.tableViewCellIdentifier, for: indexPath)
		if let name = viewModel.winners?[indexPath.row].fullName?.en {
			cell.textLabel?.text = name
		} else if let orgName = viewModel.winners?[indexPath.row].orgName?.en {
			cell.textLabel?.text = orgName
		}
		return cell
	}
	
	
}
