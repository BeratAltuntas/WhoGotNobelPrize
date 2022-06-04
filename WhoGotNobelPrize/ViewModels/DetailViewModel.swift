//
//  DetailViewModel.swift
//  WhoGotNobelPrize
//
//  Created by BERAT ALTUNTAŞ on 29.05.2022.
//

import Foundation

// MARK: - DetailViewProtocol
protocol DetailViewProtocol {
	var delegate: DetailViewDelegate? { get set }
	func LoadUI(url: String)
}

// MARK: - DetailViewDelegate
protocol DetailViewDelegate: AnyObject {
	func LoadImageView(imageData: Data)
	func LoadUIAttiributes()
}

// MARK: - DetailViewModel
final class DetailViewModel {
	weak var delegate: DetailViewDelegate?
	
	func ParseStringToUrl(string: String)-> String {
		if let range: Range<String.Index> = string.range(of: "img src") {
			let index: Int = string.distance(from: string.startIndex, to: range.lowerBound)
			let halfOfHtml = string.dropFirst(index)
			
			if let rangeOfImg: Range<String.Index> = halfOfHtml.range(of: "\" ") {
				let indexOfLast: Int = halfOfHtml.distance(from: halfOfHtml.startIndex, to: rangeOfImg.upperBound)
				var imgUrl = halfOfHtml.dropLast(halfOfHtml.count - indexOfLast)
				imgUrl = imgUrl.dropFirst(9)
				imgUrl = imgUrl.dropLast(2)
				return String(imgUrl)
			}
		}
		return ""
	}
	func FetchLaureateImage(url: String) {
		
		NetworkManager.shared.FetchData(endPoint: url) { [weak self] success, response in
			if success {
				if let imageUrl = URL(string: (self?.ParseStringToUrl(string: response))!) {
					KingFisherManager.shared.LoadImage(withUrl: imageUrl) { [weak self]successKF, image in
						if successKF {
							guard let data = image.pngData() else { return }
							self?.delegate?.LoadImageView(imageData: data)
						}
					}
				}
			}
		}
	}
}

// MARK: - Extension: DetailViewProtocol
extension DetailViewModel: DetailViewProtocol {
	func LoadUI(url: String) {
		FetchLaureateImage(url: url)
		delegate?.LoadUIAttiributes()
	}
}
