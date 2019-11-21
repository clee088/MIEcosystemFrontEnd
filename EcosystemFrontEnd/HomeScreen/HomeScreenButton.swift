//
//  Home Screen Buttons.swift
//  EcosystemFrontEnd
//
//  Created by Christopher Lee on 11/20/19.
//  Copyright © 2019 Christopher Lee. All rights reserved.
//

import Cocoa

class HomeScreenButton: NSButton {
	
	var mouseIsOver: Bool = false
	
	override init(frame: NSRect) {
		super.init(frame: frame)
		
		configureButton()
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configureButton() {
		
//		self.cell = HomeScreenButtonCell()
		self.state = .off
		self.isBordered = false
		self.wantsLayer = true
		self.layer?.backgroundColor = Colors.buttonBackgroundColor.withAlphaComponent(0.50).cgColor
		self.layer?.masksToBounds = false
		self.layer?.cornerRadius = 25
		self.bezelStyle = .smallSquare
		
	}
	
}

class HomeScreenButtonCell: NSButtonCell {
	
//	override func draw(withFrame cellFrame: NSRect, in controlView: NSView) {
//		super.draw(withFrame: cellFrame, in: HomeScreenViewController().view)
//
////		self.bezelStyle = .smallSquare
//
//	}
	
	override func highlight(_ flag: Bool, withFrame cellFrame: NSRect, in controlView: NSView) {
		
		if self.isHighlighted == false {
			self.backgroundColor = Colors.buttonBackgroundColor.withAlphaComponent(0.75)
			self.isHighlighted = true
		}
		else {
			self.backgroundColor = .clear
			self.isHighlighted = false
		}
	}
	
}
