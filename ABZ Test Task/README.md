# ABZ Test Task

ABZ Test Task is an iOS application built with Swift and SwiftUI. The app demonstrates modern architecture patterns, reusable components, and best practices in a test assignment format.

---

## Configuration Options

All configuration values are hardcoded and internal to the Swift codebase. However, to customize networking or backend endpoints:

- Modify constants in:
  - `Manager/NetworkManager.swift` – API base URL and request handling.
  - `Helpers/Constants.swift` – Shared strings or keys.

---

## Dependencies

This project uses no external dependency managers (like CocoaPods or SPM) as of now. All functionality is built using Apple native frameworks:

- SwiftUI – UI design
- Combine – Asynchronous event handling
- Foundation / UIKit – Basic system tools and backward compatibility
- AVFoundation – Camera or media usage

If you plan to add third-party libraries:
- Use Swift Package Manager: `File > Add Packages…` in Xcode.
- Or add a `Package.swift` to manage dependencies.

---

## Build Instructions

To build and run the application:

1. Clone the repository or unzip the project.
2. Open Xcode.
3. Navigate to:
   ```
   File > Open...
   ```
   and choose `ABZ Test Task.xcodeproj`.

4. Select a device/simulator.
5. Press `Cmd + R` to run.

Make sure you are running the project on macOS with Xcode 14+ and iOS 15+ simulator or device.

---

## Troubleshooting & Common Issues

| Issue                                 | Solution                                                                 |
|--------------------------------------|--------------------------------------------------------------------------|
| `Build fails: No signing team`       | Go to Signing & Capabilities tab and select your Apple Developer team. |
| SwiftUI views not updating live      | Clean build folder: `Cmd + Shift + K`, then rebuild.                     |
| App crashes on launch                | Confirm valid API endpoints or fix missing Info.plist permissions.      |
| Camera access denied                 | Add `NSCameraUsageDescription` to `Info.plist`.                         |

---

## Project Structure

```
ABZ Test Task/
├── Components/          # Custom reusable views
├── Manager/             # Networking, ImageLoader, etc.
├── Models/              # Codable data models
├── Navigation/          # Custom coordinator/navigation logic
├── Views/               # Screens and view hierarchies
├── Extensions/          # Swift extensions
├── Helpers/             # Constants, utilities
├── Assets.xcassets/     # App icons, colors, images
├── ABZ_Test_TaskApp.swift  # Entry point for SwiftUI app
```

---

## Test task performer

Developed by [Vladyslav Chuvashov].  
Contact: [vladchuvashov@gmail.com]
Phone: [+38 (099) 120 82 44]


