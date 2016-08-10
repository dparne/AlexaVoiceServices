//
//  AVSApiCommunicator.swift
//  AlexaVoiceServices
//
//  Created by Dinesh Reddy Parne on 8/10/16.
//  Copyright © 2016 Dinesh Parne. All rights reserved.
//

import Foundation
import ReactiveCocoa

public protocol AlexaVoiceServicesApiCommunicator {
    
    func send(event: AlexaVoiceServicesEvent) -> SignalProducer<AlexaVoiceServicesDirective, AlexaVoiceServicesException>
}