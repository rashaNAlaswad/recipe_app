# Recipe App

A modern Flutter application for browsing and discovering recipes from [TheMealDB](https://www.themealdb.com/). Built with clean architecture principles and featuring a beautiful iOS-style Cupertino design.

## Features

- 🍽️ **Browse Categories**: Explore recipes organized by meal categories
- 🔍 **Search Meals**: Search for recipes by name
- 📱 **Meal Details**: View detailed recipe information including ingredients and step-by-step instructions

## Video

https://github.com/user-attachments/assets/6437e894-45cf-4fd0-986c-f4c30189579f



## Getting Started

### Prerequisites

- Flutter SDK 3.10.1 or higher
- Dart SDK 3.10.1 or higher

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd recipe_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## API

This app uses [TheMealDB API](https://www.themealdb.com/api.php) - a free, open recipe database.

Base URL: `https://www.themealdb.com/api/json/v1/1`

### Endpoints Used
- `/categories.php` - Get all meal categories
- `/filter.php?c={category}` - Get meals by category
- `/search.php?s={query}` - Search meals by name
- `/lookup.php?i={mealId}` - Get meal details by ID

## Project Structure

```
lib/
├── core/
│   ├── helper/          # Helper utilities
│   ├── network/         # Network configuration, API clients, error handling
│   ├── router/          # App routing configuration
│   ├── storage/         # Local storage utilities
│   ├── theme/           # App theme configuration
│   └── widgets/         # Reusable widgets (error, loading)
├── features/
│   ├── categories/      # Category browsing feature
│   ├── home/            # Home screen
│   ├── meal_details/    # Meal detail feature
│   └── search/          # Search feature
├── main.dart            # App entry point
└── recipe_app.dart      # Main app widget
```
