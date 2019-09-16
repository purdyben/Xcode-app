//
//  Launcher.swift
//  testApp
//
//  Created by Ben Purdy on 6/12/19.
//  Copyright © 2019 Ben Purdy. All rights reserved.
//

import Foundation
class Launcher{
    var Team: teamObject!
    
    
    func makeTeamObject(teamName: String){
        Team = teamObject(name: teamName)
    }
    
}
