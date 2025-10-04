# Chef AI - AI-Powered Cooking Assistant

A comprehensive React Native mobile application that provides AI-powered cooking assistance with voice interaction, recipe discovery, meal planning, and grocery list management.

## Features

### 🎯 Core Features
- **AI Voice Assistant**: Interactive voice commands for cooking guidance
- **Recipe Discovery**: Find recipes by ingredients, cuisine, or dietary preferences
- **Meal Planning**: Weekly meal organization with calendar integration
- **Shopping Lists**: Automated grocery list generation from meal plans
- **Step-by-Step Cooking Guidance**: Voice-guided cooking instructions
- **Dietary Preferences**: Support for vegan, vegetarian, gluten-free, and other diets

### 📱 App Sections
1. **Home**: Daily recipe picks, trending recipes, voice assistant
2. **Search**: Recipe discovery with voice search and categories
3. **Meal Plan**: Calendar-based meal planning and organization
4. **Shopping**: Smart grocery list management
5. **Profile**: User preferences and app settings

### 🎤 Voice Features
- Voice recipe search
- Cooking step guidance
- Meal planning assistance
- Shopping list management
- Natural language processing for cooking commands

## Installation

### Prerequisites
- Node.js (v16 or higher)
- React Native CLI
- Android Studio (for Android development)
- Xcode (for iOS development)
- iOS Simulator or Android Emulator

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd chef-ai
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **iOS Setup**
   ```bash
   cd ios
   pod install
   cd ..
   ```

4. **Run the application**
   
   For iOS:
   ```bash
   npm run ios
   ```
   
   For Android:
   ```bash
   npm run android
   ```

## Project Structure

```
src/
├── screens/           # Main app screens
│   ├── HomeScreen.tsx
│   ├── SearchScreen.tsx
│   ├── MealPlanScreen.tsx
│   ├── ShoppingScreen.tsx
│   ├── ProfileScreen.tsx
│   ├── RecipeDetailScreen.tsx
│   └── VoiceAssistantScreen.tsx
├── styles/           # Theme and styling
│   └── theme.ts
├── services/         # API and business logic
│   └── aiService.ts
├── utils/           # Utility functions
│   └── voiceService.ts
└── components/      # Reusable components
```

## Key Technologies

- **React Native**: Cross-platform mobile development
- **React Navigation**: Screen navigation and routing
- **React Native Voice**: Voice recognition
- **React Native TTS**: Text-to-speech
- **React Native Calendars**: Calendar integration
- **React Native Paper**: UI components
- **Linear Gradient**: Gradient backgrounds
- **Vector Icons**: Icon library

## Configuration

### Voice Recognition Setup

1. **Android**: Add microphone permission to `AndroidManifest.xml`
2. **iOS**: Add microphone usage description to `Info.plist`
3. Configure voice recognition language and settings in `voiceService.ts`

### API Configuration

1. Update the API endpoint in `aiService.ts`
2. Add your API key for recipe and AI services
3. Configure mock data for development

## Usage

### Voice Commands
- "Find me a pasta recipe"
- "Help me cook this dish"
- "Plan my meals for the week"
- "Add ingredients to my shopping list"
- "What's the next step?"

### Recipe Features
- Browse recipes by category and cuisine
- Filter by dietary preferences
- Save favorite recipes
- Get cooking guidance with voice instructions

### Meal Planning
- Create weekly meal plans
- Drag and drop meal organization
- Generate shopping lists from meal plans
- Track cooking progress

## Development

### Running Tests
```bash
npm test
```

### Linting
```bash
npm run lint
```

### Building for Production

**Android:**
```bash
cd android
./gradlew assembleRelease
```

**iOS:**
```bash
cd ios
xcodebuild -workspace ChefAI.xcworkspace -scheme ChefAI -configuration Release
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions, please contact the development team or create an issue in the repository.

## Future Enhancements

- [ ] Advanced AI recipe generation
- [ ] Nutrition tracking and analysis
- [ ] Social features and recipe sharing
- [ ] Integration with smart kitchen devices
- [ ] Offline mode support
- [ ] Multi-language support
- [ ] Recipe scaling and conversion
- [ ] Cooking timer integration
- [ ] Photo recognition for ingredients
- [ ] Personalized meal recommendations

## Acknowledgments

- Design inspiration from modern cooking apps
- React Native community for excellent libraries
- AI and voice recognition technologies
- Open source recipe databases
