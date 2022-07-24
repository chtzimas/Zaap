//
//  DependencyInjector.swift
//  Zaap
//
//  Created by Christos Tzimas on 19/7/22.
//

protocol DependencyInjectorProtocol {
    func register<Component>(type: Component.Type, component: Any)
    func resolve<Component>(type: Component.Type) -> Component?
}

final class DependencyInjector: DependencyInjectorProtocol {
    static let shared = DependencyInjector()
    
    var components: [String: Any] = [:]
    
    private init() {}
    
    func register<Component>(type: Component.Type, component: Any) {
        components["\(type)"] = component
    }
    
    func resolve<Component>(type: Component.Type) -> Component? {
        return components["\(type)"] as? Component
    }
}
