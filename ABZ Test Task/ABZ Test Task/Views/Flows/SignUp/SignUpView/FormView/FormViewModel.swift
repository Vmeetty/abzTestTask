//
//  FormViewModel.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/10/25.
//

import Foundation
import Combine

class FormViewModel: ObservableObject {
    @Published var name = FieldState()
    @Published var email = FieldState()
    @Published var phone = FieldState()
    @Published var photo = FieldState()

    func markAllTouched() {
        name.wasTouched = true
        email.wasTouched = true
        phone.wasTouched = true
        photo.wasTouched = true
    }

    var nameError: String? {
        if !name.wasTouched { return nil }
        return name.isEmpty ? "Required field" : nil
    }

    var emailError: String? {
        if !email.wasTouched { return nil }
        if email.isEmpty { return "Required field" }
        if !email.value.isValidEmail { return "Invalid email format" }
        return nil
    }

    var phoneError: String? {
        if !phone.wasTouched { return nil }
        return phone.isEmpty ? "Required field" : nil
    }
    
    var photoError: String? {
        if !photo.wasTouched { return nil }
        return photo.isEmpty ? "Required field" : nil
    }

    var isFormValid: Bool {
        !name.isEmpty && !email.isEmpty && email.value.isValidEmail && !phone.isEmpty
    }
}
