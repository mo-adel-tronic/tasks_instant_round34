# 📚 Task 3: Create 3 Features

## 🎯 Problem Description
Your task is to create **3 independent features** in a Flutter/Dart project:
- **User** feature
- **Post** feature  
- **Book** feature

**You can change the specific features** (e.g., Product instead of Book) but you must create exactly 3 distinct features.



## 📝 Notes
- Start with one feature first, then replicate the structure for others
- Focus on architecture rather than complete functionality
- Use abstract classes for repository interfaces
- Keep business logic in the domain layer
- UI components belong in the presentation layer

## 🧩 Example 1: User Feature Structure
```
User/
├── 📁 data/
│   ├── 📁 implements/    
│   ├── 📁 model/         
│   └── 📁 sources/       
│
├── 📁 domain/
│   ├── 📁 entity/        
│   ├── 📁 repository/    
│   └── 📁 usecase/       
│
└── 📁 presentation/      

```

## 🔍 Evaluation Criteria
- **Structure**: Correct Clean Architecture implementation
- **Completeness**: All 3 features with identical structure
- **Separation**: Proper layer separation and dependencies
- **Naming**: Consistent and meaningful naming conventions
