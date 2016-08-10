//
//  AlexaVoiceServices.swift
//  AlexaVoiceServices
//
//  Created by Dinesh Reddy Parne on 8/10/16.
//  Copyright © 2016 Dinesh Parne. All rights reserved.
//

import Foundation
import ReactiveCocoa
import Result

class AlexaVoiceServices: AlexaVoiceServicesProtocol {
 
    private var (_eventSignal,_eventListener) = Signal<AlexaVoiceServicesEvent, NoError>.pipe()
    private var (_directiveProvider, _directiveObserver) = Signal<AlexaVoiceServicesDirective, NoError>.pipe()
    private let config: AlexaVoiceServicesConfiguration
    
    var eventListener: Observer<AlexaVoiceServicesEvent, NoError> {
        get {
            return _eventListener
        }
    }
    
    var directiveProvider: Signal<AlexaVoiceServicesDirective, NoError> {
        get {
            return _directiveProvider
        }
    }
    
    init(config: AlexaVoiceServicesConfiguration) {
        //1st phase of init
        self.config = config
        //2nd phase of init
        setupEventSignal()
    }
    
    func setupEventSignal() {
        _eventSignal.observeNext({ avsEvent in
            
        })
    }
}