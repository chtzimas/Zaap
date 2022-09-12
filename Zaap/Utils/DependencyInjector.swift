//
//  DependencyInjector.swift
//  Zaap
//
//  Created by Christos Tzimas on 19/7/22.
//

final class DependencyInjector {
    static let shared = DependencyInjector()
    
    var container: [String: Any] = [:]
    
    private init() {}
    
    func buildDependencies() {
        DependencyInjector.shared.register(type: UserWebRepository.self, component: UserWebRepository(urlSession: .shared))
        DependencyInjector.shared.register(type: UserService.self, component: UserService(userWebRepository: DependencyInjector.shared.resolve(type: UserWebRepository.self)!))
        DependencyInjector.shared.register(type: SignInViewModel.self, component: SignInViewModel())
        DependencyInjector.shared.register(type: SignUpViewModel.self, component: SignUpViewModel(userService: DependencyInjector.shared.resolve(type: UserService.self)!))
    }
    
    private func register<Component>(type: Component.Type, component: Any) {
        container["\(type)"] = component
    }
    
    func resolve<Component>(type: Component.Type) -> Component? {
        return container["\(type)"] as? Component
    }
}
