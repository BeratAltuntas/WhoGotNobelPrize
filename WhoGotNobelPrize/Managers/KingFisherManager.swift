//
//  KingFisherManager.swift
//  WhoGotNobelPrize
//
//  Created by BERAT ALTUNTAŞ on 3.06.2022.
//

import Foundation
import Kingfisher
import UIKit

final class KingFisherManager {
	typealias Completion = (_ success: Bool, _ image: UIImage)-> Void
	static let shared = KingFisherManager()
	func LoadImage(withUrl: URL, completion: @escaping Completion) {
		UIImageView().kf.setImage(with: withUrl) { result in
			switch result {
			case .success(let response):
				completion(true, response.image)
			case .failure(_):
				completion(false,UIImage())
			}
		}
	}
}
