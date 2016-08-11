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

public class AlexaVoiceServices: AlexaVoiceServicesProtocol {
 
    private var (_eventSignal,_eventListener) = Signal<AlexaVoiceServicesEvent, NoError>.pipe()
    private var (_directiveProvider, _directiveObserver) = Signal<AlexaVoiceServicesDirective, NoError>.pipe()
    private let config: AlexaVoiceServicesConfiguration
    private let apiCommunicator: AlexaVoiceServicesApiCommunicator
    
    public var eventListener: Observer<AlexaVoiceServicesEvent, NoError> {
        get {
            return _eventListener
        }
    }
    
    public var directiveProvider: Signal<AlexaVoiceServicesDirective, NoError> {
        get {
            return _directiveProvider
        }
    }
    
    public init(config: AlexaVoiceServicesConfiguration,
         apiCommunicator: AlexaVoiceServicesApiCommunicator) {
        //1st phase of init
        self.config = config
        self.apiCommunicator = apiCommunicator
        //2nd phase of init
        setupEventSignal()
    }
    
    func setupEventSignal() {
        _eventSignal.observeNext({[weak self] avsEvent in
            self?.apiCommunicator.send(avsEvent).startWithSignal({ (signal, disposable) in
                signal.observeNext({[weak self] (directive) in
                    self?._directiveObserver.sendNext(directive)
                })
            })
        })
    }
}