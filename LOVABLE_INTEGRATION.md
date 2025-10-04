# 🚀 Chef AI - Lovable Backend Integration

## Overview
This guide shows how to integrate your Chef AI React Native app with Lovable for a powerful AI backend with real-time features, database management, and advanced AI capabilities.

## 🎯 What You'll Get

### ✅ **Real AI Features**
- **Voice Recognition** - Process actual voice commands
- **Text-to-Speech** - Voice responses from AI
- **Recipe Recommendations** - ML-powered suggestions
- **Nutrition Analysis** - Real-time meal analysis
- **Image Recognition** - Identify ingredients from photos

### ✅ **Database & Authentication**
- **User Management** - Sign up, login, profiles
- **Recipe Database** - Thousands of real recipes
- **Meal Planning** - Persistent meal plans
- **Shopping Lists** - Cloud-synced lists
- **Cooking Sessions** - Track cooking progress

### ✅ **Real-time Features**
- **Live Updates** - Sync across devices
- **Collaborative Planning** - Share meal plans
- **Progress Tracking** - Real-time cooking guidance

## 🚀 Setup Steps

### 1. Create Lovable Project

1. **Go to [Lovable.dev](https://lovable.dev)**
2. **Create new project**
3. **Choose "React Native" template**
4. **Name it "Chef AI Backend"**

### 2. Connect Supabase

1. **In Lovable settings → Connect Supabase**
2. **Create Supabase project** at [supabase.com](https://supabase.com)
3. **Copy your project URL and API key**

### 3. Database Setup

Run this SQL in your Supabase SQL editor:

```sql
-- Users table
CREATE TABLE users (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255),
  dietary_preferences TEXT[],
  cooking_skill VARCHAR(50),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Recipes table
CREATE TABLE recipes (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  image_url TEXT,
  prep_time INTEGER,
  cook_time INTEGER,
  servings INTEGER,
  difficulty VARCHAR(50),
  cuisine VARCHAR(100),
  category VARCHAR(100),
  ingredients JSONB,
  instructions JSONB,
  nutrition_info JSONB,
  tags TEXT[],
  created_by UUID REFERENCES users(id),
  created_at TIMESTAMP DEFAULT NOW()
);

-- Meal plans table
CREATE TABLE meal_plans (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  date DATE NOT NULL,
  meal_type VARCHAR(50),
  recipe_id UUID REFERENCES recipes(id),
  is_completed BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Shopping lists table
CREATE TABLE shopping_lists (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  name VARCHAR(255),
  items JSONB,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Cooking sessions table
CREATE TABLE cooking_sessions (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  recipe_id UUID REFERENCES recipes(id),
  current_step INTEGER DEFAULT 0,
  completed_steps INTEGER[] DEFAULT '{}',
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  voice_guidance_enabled BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT NOW()
);
```

### 4. Environment Setup

Create `.env` file in your React Native project:

```env
LOVABLE_API_URL=https://your-project.lovable.app
EXPO_PUBLIC_SUPABASE_URL=your_supabase_project_url
EXPO_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
OPENAI_API_KEY=your_openai_api_key
SPOONACULAR_API_KEY=your_spoonacular_api_key
```

### 5. Install Dependencies

```bash
npm install @supabase/supabase-js
npm install axios
```

### 6. Update Your App

Replace your existing `aiService.ts` with the new `lovableApiService.ts` integration.

## 🎯 API Endpoints

### Authentication
- `POST /auth/signup` - User registration
- `POST /auth/login` - User login
- `GET /auth/me` - Get current user

### Recipes
- `GET /recipes` - Get recipes with filters
- `POST /recipes/search` - AI-powered recipe search
- `GET /recipes/recommendations` - Personalized recommendations
- `POST /recipes/by-ingredients` - Find recipes by ingredients

### Meal Planning
- `GET /meal-plans` - Get user's meal plans
- `POST /meal-plans/generate` - AI-generated meal plan
- `PUT /meal-plans/:id` - Update meal plan

### AI Services
- `POST /ai/voice-command` - Process voice commands
- `POST /ai/cooking-guidance` - Get cooking guidance
- `POST /ai/nutrition-analysis` - Analyze meal nutrition

## 🎉 Features You'll Get

### 1. **Real Voice AI**
```typescript
// Process voice commands
const response = await lovableApiService.processVoiceCommand({
  command: "Find me a pasta recipe",
  context: { dietary_preferences: ["vegetarian"] }
});
```

### 2. **Smart Recipe Discovery**
```typescript
// Find recipes by ingredients
const recipes = await lovableApiService.findRecipesByIngredients([
  "chicken", "rice", "garlic"
]);
```

### 3. **AI Meal Planning**
```typescript
// Generate personalized meal plan
const mealPlan = await lovableApiService.generateMealPlan(
  userId, 
  "2024-01-01", 
  7 // days
);
```

### 4. **Real-time Shopping Lists**
```typescript
// Generate shopping list from meal plan
const shoppingList = await lovableApiService.generateShoppingList(
  userId, 
  mealPlanIds
);
```

### 5. **Voice Cooking Guidance**
```typescript
// Get step-by-step cooking help
const guidance = await lovableApiService.getCookingGuidance(
  recipeId, 
  currentStep, 
  "What's next?"
);
```

## 🚀 Next Steps

1. **Set up Lovable project** with Supabase
2. **Copy environment variables** to your React Native app
3. **Replace aiService.ts** with lovableApiService.ts
4. **Test the integration** with real data
5. **Deploy to production** with Lovable hosting

## 💡 Benefits

- **Real AI** instead of mock responses
- **Persistent data** across app sessions
- **User accounts** and personalized experiences
- **Real-time sync** across devices
- **Scalable backend** that grows with your app
- **Professional hosting** with Lovable infrastructure

Your Chef AI app will transform from a demo to a production-ready cooking assistant! 🎉
