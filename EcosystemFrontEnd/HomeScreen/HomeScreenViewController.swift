//
//  HomeScreen.swift
//  EcosystemFrontEnd
//
//  Created by Christopher Lee on 11/11/19.
//  Copyright © 2019 Christopher Lee. All rights reserved.
//

import Cocoa

class HomeScreenViewController: NSViewController {

	//MARK: - Properties
	
	private let backgroundImageView: NSImageView = {
		let view = NSImageView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.image = NSImage(named: "Background")
		view.imageAlignment = .alignCenter
//        view.imageScaling = .NSScaleToFit
		return view
	}()
	
	//MARK: - Inits
	
    convenience init() {
        self.init(nibName: "HomeScreen", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		configureUI()
		
    }
	
	//MARK: - Functions
	
	private func configureUI() {
        if let bounds = NSScreen.main?.visibleFrame {
            self.view.widthAnchor.constraint(lessThanOrEqualToConstant: bounds.width).isActive = true
            self.view.heightAnchor.constraint(lessThanOrEqualToConstant: bounds.height).isActive = true
            view.setFrameSize(bounds.size)
        }
		
		[backgroundImageView].forEach { view.addSubview($0) }

        backgroundImageView.leftAnchor.constraint(lessThanOrEqualTo: view.leftAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(lessThanOrEqualTo: view.rightAnchor).isActive = true
        backgroundImageView.topAnchor.constraint(lessThanOrEqualTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor).isActive = true
		
	}
	
}
