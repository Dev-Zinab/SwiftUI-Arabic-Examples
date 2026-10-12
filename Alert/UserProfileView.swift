//
//  Alert.swift
//  MyApp
//
//  Created by Zinab  on 12/10/2026.
//

import SwiftUI

struct UserProfileView: View {
    // MARK: - المتغيرات
    @State private var username = "زينب"
    @State private var followers = 0
    @State private var tempName = ""
    
    // متغيرات التنبيهات
    //1
    @State private var showFollowAlert = false
    @State private var showEditAlert = false
    @State private var showLogoutAlert = false
    
    var body: some View {
        VStack(spacing: 30) {
            
            // 1. صورة الحساب والبيانات
            VStack(spacing: 12) {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 90))
                    .foregroundStyle(
                        .linearGradient(colors: [.blue, .cyan],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing)
                    )
                    .shadow(color: .blue.opacity(0.3), radius: 10, y: 5)
                Text(username)
                    .font(.title.bold())
                
                Text("المتابعين: \(followers)")
                    .font(.headline)
                    .foregroundStyle(.secondary)
            }
            .padding(.top, 40)
            
            
            
            
            // 2. أزرار التفاعل
            VStack(spacing: 15) {
                Button {
                    followers += 1
                    if followers == 3 {
                        showFollowAlert = true
                    }
                } label: {
                    Label("متابعة", systemImage: "person.badge.plus")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .alert("🎉مبرووووك!", isPresented: $showFollowAlert){
                    Button("تم", role: .cancel){
                        // لو عندي اكشن معين نضيفه داخل الزر لو تبغا بس تنبيه بدون فعل امر معين اتركه فاضي
                    }
                } message: {
                    Text("وصلت ٣ متابعين")
                }
                
                
                Button {
                    tempName = username
                    showEditAlert = true
                    
                } label: {
                    Label("تعديل الاسم", systemImage: "pencil")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                .alert("تعديل اسم الحساب",isPresented: $showEditAlert){
                    TextField("اسمك الجديد🤓",text: $tempName)
                    Button ("حفظ", role:.confirm){
                        if !tempName.isEmpty {
                            username = tempName
                        }}
                    Button("الالغاء",role: .cancel){}
                    
                    
                } message: {
                    Text("سيظهر هذا الاسم لجميع المتابعين في ملفك")
                }
                
                
                
            }
            .padding(.horizontal, 40)
            
            Spacer()
            
            // 3. زر تسجيل الخروج
            Button(role: .destructive) {
                showLogoutAlert = true
            } label: {
                Label("تسجيل الخروج", systemImage: "rectangle.portrait.and.arrow.right")
            }
            .buttonStyle(.borderless)
            .padding(.bottom, 40)
            .alert("هل ترغب بتسجيل الخروج؟؟",isPresented: $showLogoutAlert){
                Button("خروج",role:.destructive){
                    //كود تسجيل الخروج هنا
                    followers = 0
                    username = "ضيف"
                    tempName = ""
                }
                Button("الغاء",role: .cancel){}
            } message: {
                Text("متأكد تبغا تخرج من التطبيق؟؟")
            }
        }
    }
}

#Preview {
    UserProfileView()
}
