//
//  Configuraion.swift
//  RepositoryDemo
//
//  Created by Hadži Lazar Pešić on 7/3/19.
//  Copyright © 2019 Lazar Pešić. All rights reserved.
//

import Foundation

struct Configuration {
    
    fileprivate let configuration: ApplicationConfiguration
    
    init (configuration: ApplicationConfiguration = Configuration.currentConfiguration) {
        self.configuration = configuration
    }
    
}

extension Configuration: ApplicationConfiguration {
    
    var domain: String {
        return configuration.domain
    }
    
}

extension Configuration {
    
    static var isDevelopment: Bool {
        return current == .Development
    }
    
    static var isStaging: Bool {
        return current == .Staging
    }
    
    static var isRelease: Bool {
        switch current {
        case .Development, .Staging:
            return false
        case .Release:
            return true
        }
    }
    
    static var current: ConfigurationType {
        guard let infoDictionary = Bundle.main.infoDictionary,
            let configurationName = infoDictionary["Configuration"] as? String,
            let buildConfiguration = ConfigurationType(rawValue: configurationName) else { return .Release}
        
        return buildConfiguration
    }
    
}

fileprivate extension Configuration {
    
    static var currentConfiguration: ApplicationConfiguration {
        
        switch current {
            
        case .Development:
            return DevelopmentConfiguration()
            
        case .Staging:
            return StagingConfiguration()
            
        case .Release:
            return ReleaseConfiguration()
        }
        
    }
    
}
