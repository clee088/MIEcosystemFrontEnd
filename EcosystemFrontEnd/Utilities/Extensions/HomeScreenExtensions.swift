//
//  HomeScreenExtensions.swift
//  EcosystemFrontEnd
//
//  Created by Christopher Lee on 11/14/19.
//  Copyright © 2019 Christopher Lee. All rights reserved.
//

import Cocoa

extension HomeScreenViewController: NSCollectionViewDelegate, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
		return 4
	}
	
	func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
		return NSSize(width: buttonsCollection.frame.width, height: 50)
	}
	
	func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, insetForSectionAt section: Int) -> NSEdgeInsets {
		return NSEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}
	
	func collectionView(_ collectionView: NSCollectionView, didChangeItemsAt indexPaths: Set<IndexPath>, to highlightState: NSCollectionViewItem.HighlightState) {
		guard let indexPath = indexPaths.first,
		let item = collectionView.item(at: indexPath) as? ButtonCell else {
			return
		}

		item.button.layer?.backgroundColor = Colors.buttonBackgroundColor.withAlphaComponent(0.75).cgColor

	}

	func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
		guard let indexPath = indexPaths.first else {
		  return
		}
		guard let item = buttonsCollection.item(at: indexPath) else {
		  return
		}
		(item as! ButtonCell).setHighlight(selected: true)

		
//		item.button.layer?.backgroundColor = Colors.buttonBackgroundColor.withAlphaComponent(0.75).cgColor
		print(item.title)

	}
	
	func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
		let item = buttonsCollection.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "item"), for: indexPath) as? ButtonCell
		
		let attributes: [NSAttributedString.Key: Any] = [
			.font: NSFont(name: Fonts.sourceSansProLight, size: 30)!,
			.foregroundColor: Colors.textColor
		]
		item?.button.attributedTitle = NSAttributedString(string: buttonsCollectionText[indexPath.item], attributes: attributes)
//		item?.text.string = buttonsCollectionText[indexPath.item]
		
		return item ?? NSCollectionViewItem()
	}
	
	
}
