//
//  HomeScreen.swift
//  EcosystemFrontEnd
//
//  Created by Christopher Lee on 11/11/19.
//  Copyright © 2019 Christopher Lee. All rights reserved.
//

import Cocoa
import AVFoundation
import AVKit

class HomeScreenViewController: NSViewController {

	//MARK: - Properties
	
	private let backgroundMoviePlayerView: AVPlayerView = {
		let view = AVPlayerView()
		let layer = AVPlayerLayer(player: view.player)
		layer.videoGravity = AVLayerVideoGravity.resizeAspectFill
		view.translatesAutoresizingMaskIntoConstraints = false
		view.controlsStyle = .none
		view.updatesNowPlayingInfoCenter = false
		view.player = AVPlayer(url: Bundle.main.url(forResource: "Background", withExtension: ".mov")!)
		view.layer?.addSublayer(layer)
		return view
	}()
	
	private let titleTextView: NSTextView = {
		let view = NSTextView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.string = "MI Ecosystem Project"
		view.textColor = Colors.textColor
		view.font = NSFont(name: Fonts.sourceSansPro, size: 50)
		view.backgroundColor = .clear
		view.isEditable = false
		view.isSelectable = false
		view.alignment = .center
		view.wantsLayer = true
		view.layer?.backgroundColor = Colors.buttonBackgroundColor.withAlphaComponent(0.5).cgColor
		view.layer?.masksToBounds = false
		view.layer?.cornerRadius = 30
		return view
	}()
	
//	let buttonsCollectionText: [String] = ["Start", "Load", "Settings", "Credits"]
//
//	let buttonsCollection: NSCollectionView = {
//		let layout = NSCollectionViewFlowLayout()
//		let collection = NSCollectionView(frame: NSRect(x: 0, y: 0, width: 0, height: 0))
//		collection.translatesAutoresizingMaskIntoConstraints = false
//		collection.collectionViewLayout = layout
//		collection.wantsLayer = true
//		collection.backgroundColors = [.clear]
//		collection.isSelectable = true
//		return collection
//	}()
	
	private let startButton: NSButton = {
		let button = NSButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		let attributes: [NSAttributedString.Key: Any] = [
			.font: NSFont(name: Fonts.sourceSansProLight, size: 30)!,
			.foregroundColor: Colors.textColor
		]
		button.attributedTitle = NSAttributedString(string: "Start", attributes: attributes)
		button.state = .off
		button.isBordered = false
		button.action = #selector(startSimulation)
		button.wantsLayer = true
		button.layer?.backgroundColor = Colors.buttonBackgroundColor.withAlphaComponent(0.50).cgColor
		button.layer?.masksToBounds = false
		button.layer?.cornerRadius = 25
		button.bezelStyle = .smallSquare
		return button
	}()
	
	private let loadButton: NSButton = {
		let button = NSButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		let attributes: [NSAttributedString.Key: Any] = [
			.font: NSFont(name: Fonts.sourceSansProLight, size: 30)!,
			.foregroundColor: Colors.textColor
		]
		button.attributedTitle = NSAttributedString(string: "Load", attributes: attributes)
		button.state = .off
		button.isBordered = false
		button.action = #selector(startSimulation)
		button.wantsLayer = true
		button.layer?.backgroundColor = Colors.buttonBackgroundColor.withAlphaComponent(0.50).cgColor
		button.layer?.masksToBounds = false
		button.layer?.cornerRadius = 25
		button.bezelStyle = .smallSquare
		return button
	}()
	
	private let settingsButton: NSButton = {
		let button = NSButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		let attributes: [NSAttributedString.Key: Any] = [
			.font: NSFont(name: Fonts.sourceSansProLight, size: 30)!,
			.foregroundColor: Colors.textColor
		]
		button.attributedTitle = NSAttributedString(string: "Settings", attributes: attributes)
		button.state = .off
		button.isBordered = false
		button.action = #selector(startSimulation)
		button.wantsLayer = true
		button.layer?.backgroundColor = Colors.buttonBackgroundColor.withAlphaComponent(0.50).cgColor
		button.layer?.masksToBounds = false
		button.layer?.cornerRadius = 25
		button.bezelStyle = .smallSquare
		return button
	}()
	
	private let creditsButton: NSButton = {
		let button = NSButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		let attributes: [NSAttributedString.Key: Any] = [
			.font: NSFont(name: Fonts.sourceSansProLight, size: 30)!,
			.foregroundColor: Colors.textColor
		]
		button.attributedTitle = NSAttributedString(string: "Credits", attributes: attributes)
		button.state = .off
		button.isBordered = false
		button.action = #selector(startSimulation)
		button.wantsLayer = true
		button.layer?.backgroundColor = Colors.buttonBackgroundColor.withAlphaComponent(0.50).cgColor
		button.layer?.masksToBounds = false
		button.layer?.cornerRadius = 25
		button.bezelStyle = .smallSquare
		return button
	}()
	
	//MARK: - Inits
	
    convenience init() {
        self.init(nibName: "HomeScreen", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		configureUI()
		
    }
	
	//MARK: - Constraints
	
	private func configureUI() {
		
        if let bounds = NSScreen.main?.visibleFrame {
			self.view.widthAnchor.constraint(greaterThanOrEqualToConstant: bounds.width * 0.66).isActive = true
			self.view.heightAnchor.constraint(greaterThanOrEqualToConstant: bounds.height * 0.66).isActive = true
            self.view.widthAnchor.constraint(lessThanOrEqualToConstant: bounds.width).isActive = true
            self.view.heightAnchor.constraint(lessThanOrEqualToConstant: bounds.height).isActive = true
            view.setFrameSize(bounds.size)
			
			backgroundMoviePlayerView.widthAnchor.constraint(equalToConstant: bounds.width).isActive = true
			backgroundMoviePlayerView.heightAnchor.constraint(equalToConstant: bounds.height).isActive = true

        }
		
		[backgroundMoviePlayerView, titleTextView, startButton, loadButton, settingsButton, creditsButton].forEach { view.addSubview($0) }

		backgroundMoviePlayerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
		
		backgroundMoviePlayerView.layer?.frame = self.backgroundMoviePlayerView.frame
		backgroundMoviePlayerView.player?.play()
		backgroundMoviePlayerView.player?.actionAtItemEnd = .none
		NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.backgroundMoviePlayerView.player?.currentItem, queue: .main) { [weak self] _ in
			self?.backgroundMoviePlayerView.player?.seek(to: .zero)
			self?.backgroundMoviePlayerView.player?.play()
		}
		
		titleTextView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		titleTextView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
		titleTextView.widthAnchor.constraint(equalToConstant: 500).isActive = true
		titleTextView.heightAnchor.constraint(equalToConstant: 75).isActive = true
		
		startButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		startButton.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: 50).isActive = true
		startButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
		startButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

		loadButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		loadButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 50).isActive = true
		loadButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
		loadButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

		settingsButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		settingsButton.topAnchor.constraint(equalTo: loadButton.bottomAnchor, constant: 50).isActive = true
		settingsButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
		settingsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

		creditsButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		creditsButton.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: 50).isActive = true
		creditsButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
		creditsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

	}
	
	//MARK: - Functions
	
//	private func createImageArray(total: Int, imagePrefix: String) -> [NSImage] {
//
//		var imageArray: [NSImage] = []
//
//		for imageCount in 0..<total {
//			let imageName: String = "\(imagePrefix)-\(imageCount).png"
//			let image = NSImage(named: imageName)!
//
//			imageArray.append(image)
//		}
//		return imageArray
//	}
	
	@objc private func startSimulation() {
		
		print("Starting...")
		
	}
	
	
	
}
