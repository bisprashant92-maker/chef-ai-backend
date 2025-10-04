# Chef AI - Lovable Backend Integration Guide

## 🚀 Setting Up Lovable Backend for Chef AI

### Step 1: Create Lovable Project
1. Go to [Lovable.dev](https://lovable.dev)
2. Create a new project
3. Choose "React Native" or "Web App" template
4. Name it "Chef AI Backend"

### Step 2: Supabase Integration
1. In Lovable project settings → Connect Supabase
2. Create Supabase project at [supabase.com](https://supabase.com)
3. Get your project URL and API key

### Step 3: Database Schema Setup

#### Users Table
```sql
CREATE TABLE users (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255),
  dietary_preferences TEXT[],
  cooking_skill VARCHAR(50),
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

#### Recipes Table
```sql
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
```

#### Meal Plans Table
```sql
CREATE TABLE meal_plans (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  date DATE NOT NULL,
  meal_type VARCHAR(50), -- breakfast, lunch, dinner, snack
  recipe_id UUID REFERENCES recipes(id),
  is_completed BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW()
);
```

#### Shopping Lists Table
```sql
CREATE TABLE shopping_lists (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id UUID REFERENCES users(id),
  name VARCHAR(255),
  items JSONB, -- [{name, quantity, is_checked, category}]
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT NOW()
);
```

#### Cooking Sessions Table
```sql
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

### Step 4: API Endpoints

#### Authentication
- POST `/auth/signup` - User registration
- POST `/auth/login` - User login
- POST `/auth/logout` - User logout
- GET `/auth/me` - Get current user

#### Recipes
- GET `/recipes` - Get recipes with filters
- GET `/recipes/:id` - Get specific recipe
- POST `/recipes/search` - AI-powered recipe search
- GET `/recipes/recommendations` - Get personalized recommendations
- POST `/recipes/by-ingredients` - Find recipes by available ingredients

#### Meal Planning
- GET `/meal-plans` - Get user's meal plans
- POST `/meal-plans/generate` - AI-generated meal plan
- PUT `/meal-plans/:id` - Update meal plan
- DELETE `/meal-plans/:id` - Delete meal plan

#### Shopping Lists
- GET `/shopping-lists` - Get user's shopping lists
- POST `/shopping-lists` - Create new shopping list
- POST `/shopping-lists/generate` - Generate from meal plan
- PUT `/shopping-lists/:id` - Update shopping list

#### AI Services
- POST `/ai/voice-command` - Process voice commands
- POST `/ai/cooking-guidance` - Get cooking guidance
- POST `/ai/nutrition-analysis` - Analyze meal nutrition
- POST `/ai/ingredient-recognition` - Recognize ingredients from image

### Step 5: Environment Variables
```env
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_supabase_anon_key
OPENAI_API_KEY=your_openai_api_key
SPOONACULAR_API_KEY=your_spoonacular_api_key
```

### Step 6: Integration with React Native App
1. Install Supabase client in React Native
2. Update API service to use Lovable endpoints
3. Add authentication flow
4. Connect real-time features
