//
//  UserItemRow.swift
//  ABZ Test Task
//
//  Created by Vlad Chuvashov on 5/9/25.
//

import SwiftUI

struct UserItemRow: View {
    let user: UserItem

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            if let urlString = user.photo, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 70, height: 70)
                .clipShape(Circle())
            } else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.title3)
                    .multilineTextAlignment(.leading)
                
                Text(user.position)
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top, 4)
                
                if let email = user.email {
                    Text(email)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .padding(.top, 1)
                }
                
                if let phone = user.phone {
                    Text(phone)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.top, 1)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
    }
}

#Preview {
    UserItemRow(user: UserItem(id: 20, name: "Aiden Bergnaum", email: "west.howell@oreilly.com", phone: "+380996443156", position: "Designer", positionId: 4, registrationTimestamp: 1604494937, photo: "https://frontend-test-assignment-api.abz.agency/images/users/5fa2a6598fe0b20.jpeg"))
}
