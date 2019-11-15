//
//  ButtonCell.swift
//  EcosystemFrontEnd
//
//  Created by Christopher Lee on 11/14/19.
//  Copyright © 2019 Christopher Lee. All rights reserved.
//

import Cocoa

class ButtonCell: NSCollectionViewItem {
	
	let button: NSButton = {
		let button = NSButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.state = .off
		button.isBordered = false
//		button.action = #selector(start)
		button.wantsLayer = true
		button.layer?.backgroundColor = Colors.buttonBackgroundColor.withAlphaComponent(0.50).cgColor
		button.layer?.masksToBounds = false
		button.layer?.cornerRadius = 25
		button.bezelStyle = .smallSquare
		return button
	}()
	
	let text: NSTextView = {
		let view = NSTextView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.isEditable = false
		view.isSelectable = false
		view.font = NSFont(name: Fonts.sourceSansProLight, size: 30)
		view.textColor = Colors.textColor
		return view
	}()
	
	override func loadView() {
		
		self.view = NSView()
		self.view.wantsLayer = true
		self.view.addSubview(button)
		
		button.widthAnchor.constraint(equalToConstant: 300).isActive = true
		button.heightAnchor.constraint(equalToConstant: 50).isActive = true
		button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
	}
	
	override var isSelected: Bool {
		didSet {
			button.layer?.backgroundColor = isSelected ? NSColor.red.cgColor : .clear
		}
	}
	
	func setHighlight(selected: Bool) {
	  button.layer?.backgroundColor = isSelected ? NSColor.red.cgColor : .clear
	}
	
	
	@objc private func start() {
		print("touched")
		print(button.title)
	}
}


