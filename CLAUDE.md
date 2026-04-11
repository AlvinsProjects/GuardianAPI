# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

GuardianAPI is a SwiftUI iOS app that fetches and displays news articles from [The Guardian's public API](https://open-platform.theguardian.com/). Users pick a news category on a start screen, then browse the top 40 articles (newest first) with thumbnails, publication dates, and links to the full articles.

## Build & Run

Xcode-based project; no Swift Package Manager dependencies.

```bash
# Build for iOS Simulator
xcodebuild -project GuardianAPI.xcodeproj -scheme GuardianAPI -destination 'platform=iOS Simulator,name=iPhone 16' build

# Run a single test
xcodebuild test -project GuardianAPI.xcodeproj -scheme GuardianAPI -destination 'platform=iOS Simulator,name=iPhone 16' -only-testing:GuardianAPITests/SomeTestClass
```

Use `gcp "message"` (shell alias) to stage, commit, and push in one step.

## Architecture

**Entry point:** `GuardianAPIApp.swift` → `StartView`

**Data flow:**
1. `StartView` — `Form`-based picker lets the user choose a category (`World News`, `General News`, `UK News`, `Cricket`, `Tennis`, `Rugby`, `Olympics`). Navigates to `ContentView(apiUrlCategory:)`.
2. `ContentView` — owns `@State private var vm = ArticleListViewModel()`. Switches on `vm.loadState` (.loading / .loaded / .failed). Provides `.task`, `.refreshable`, and `.searchable` modifiers.
3. `ArticleListViewModel` — defined as a nested `@Observable @MainActor` class inside a `ContentView` extension (`ViewModel/ArticleListViewModel.swift`). Holds `articles`, `loadState`, `loadError`, and `filterText`. `filteredArticles` applies `localizedStandardContains` filtering. `loadArticles(apiUrlStrings:)` is the async fetch entry point. `getApiUrl(category:)` maps a category string to a full Guardian API URL (base URL, API key, query params, and `show-fields` are all assembled here).
4. `ArticleRow` — pure display view; receives the `vm` and renders `vm.filteredArticles` using `ForEach(enumerated())`.
5. `LoadFailedView` — shown on `.failed` state; uses `ContentUnavailableView` with a `Button("Retry")` that calls the async retry closure.

**Models** (`Start Files/Article.swift`):
- `GuardianResponse` → `ResponseDetails` → `[Article]` — mirrors the Guardian API JSON envelope.
- `Article` has custom `CodingKeys` (e.g., `sectionId` → `sectionID`). `webPublicationDate` is decoded as `Date` using `.iso8601` strategy.
- `Fields` holds `thumbnail` (`String?` — not guaranteed by the API), `headline`, and `shortURL` (all optional). `Fields` has custom `CodingKeys` to map `shortURL → "shortUrl"`.
- `Article.type` is a plain `String`. Do not replace it with a restrictive enum — the Guardian API returns many content types (`"article"`, `"liveblog"`, `"gallery"`, `"interactive"`, etc.) and an enum that doesn't cover all of them will cause the entire page to fail to decode.

**Colors** (`Start Files/StartColors.swift`): Named `Color` extensions (`colBlue`, `darkBlue`, `colLightYellow`, etc.) used throughout views.

## Key Conventions

- The API key is stored as a plain string literal inside `getApiUrl(category:)`. Do not move it to a plist or config file without discussion.
- To add a new news category, add the string to the `category` array in `StartView` **and** add a matching `case` in the `getApiUrl` switch.
- `ArticleListViewModel` is intentionally scoped as a nested type of `ContentView`; reference it as `ContentView.ArticleListViewModel` from other views (as `ArticleRow` does).
- The app forces dark mode (`preferredColorScheme(.dark)`) in both `StartView` and `ContentView`.
