# HAXOR News 📰

A modern iOS app for browsing Hacker News stories with a sleek, native SwiftUI interface.

## Features ✨

- **Modern UI Design** - Clean, card-based interface with smooth animations
- **Real-time Search** - Filter stories as you type
- **Smart Sorting** - Sort by popularity, recency, or top-rated stories
- **Pull-to-Refresh** - Swipe down to get the latest stories
- **Native Web Viewer** - Built-in browser for reading full articles
- **Share Integration** - Share articles directly from the app
- **Responsive Design** - Optimized for all iPhone screen sizes

## Screenshots 📱
https://ibb.co/CpDG6zC1
https://ibb.co/Xx3y8tPc
https://ibb.co/YBHWTsS1
https://ibb.co/1f8PrMtQ
https://ibb.co/dw6G7vL9



## Architecture 🏗️

The app follows SwiftUI best practices with a clean, modular architecture:

### Models
- `PostData.swift` - Data models for Hacker News API response
- `NetworkManager.swift` - Handles API calls and data management

### Views
- `ContentView.swift` - Main screen with story list and navigation
- `DetailView.swift` - Article detail view with embedded web browser
- `ModernPostCard.swift` - Custom card component for story display
- `ModernSearchBar.swift` - Enhanced search input with focus states
- `ModernLoadingView.swift` - Animated loading indicator
- `SortPillView.swift` - Interactive sorting buttons
- `WebView.swift` - WKWebView wrapper for article viewing

## API Integration 🔌

The app uses the [Hacker News API](https://hn.algolia.com/api) to fetch:
- Front page stories
- Story metadata (points, title, URL, timestamp)
- Real-time updates

## Installation 🚀

1. Clone the repository:
```bash
git clone https://github.com/Ezepue/haxor-news-ios.git
```
2. Open `HAXOR News.xcodeproj` in Xcode

3. Build and run the app on your device or simulator

## Requirements

- iOS 16.0+
- Xcode 14.0+
- Swift 5.7+

## Key Components

### NetworkManager
Handles all API communication with proper error handling and loading states:
- Async/await pattern for modern Swift concurrency
- Published properties for reactive UI updates
- Refresh functionality for pull-to-refresh

### Modern UI Components
- **Search Bar**: Focus states, clear button, smooth animations
- **Sort Pills**: Interactive buttons with selection states
- **Post Cards**: Clean typography, metadata display, hover effects
- **Loading States**: Animated indicators for better UX

### Navigation
- SwiftUI NavigationStack for iOS 16+ compatibility
- Proper back navigation and state management
- Share functionality with native iOS share sheet

## Performance Optimizations

- LazyVStack for efficient list rendering
- Optimized image loading and caching
- Minimal API calls with smart refresh logic
- Smooth 60fps animations throughout

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Future Enhancements

- Dark mode support
- Offline reading capability
- Favorite stories
- Comment viewing
- Push notifications for trending stories
- iPad optimization
- Custom themes

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Hacker News for the amazing content
- Algolia for the powerful search API
- Apple for the fantastic SwiftUI framework

## Contact

**Chukwuebuka Ezepue** - [@Franciszepue](https://twitter.com/FrancisEzepue)

**Project Link**: [https://github.com/Ezepue/haxor-news-ios](https://github.com/Ezepue/haxor-news-ios)

---

Built with ❤️ using SwiftUI
