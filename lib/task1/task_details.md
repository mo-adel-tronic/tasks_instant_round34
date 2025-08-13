# Task 1: Boolean List Calculation

## Problem Description

You are given:
- A list of integers `numbers`
- Two integers `left` and `right` representing a range

Your task is to calculate a boolean list `result`, where:
- `result[i] = true` if there exists an integer `x` such that:
  - `numbers[i] = (i + 1) * x`
  - `left ≤ x ≤ right`
- `result[i] = false` otherwise

## Example

**Input:**
```dart
numbers = [8, 5, 6, 16, 5]
left = 1
right = 3
```

**Output:**
```dart
[false, false, true, false, true]
```

## Step-by-Step Explanation

Let's analyze each element:

1. **`numbers[0] = 8`** (index 0)
   - We need: `8 = (0 + 1) * x` → `8 = 1 * x` → `x = 8`
   - Is `1 ≤ 8 ≤ 3`? **No** → `result[0] = false`

2. **`numbers[1] = 5`** (index 1)
   - We need: `5 = (1 + 1) * x` → `5 = 2 * x` → `x = 2.5`
   - Is `x` an integer? **No** → `result[1] = false`

3. **`numbers[2] = 6`** (index 2)
   - We need: `6 = (2 + 1) * x` → `6 = 3 * x` → `x = 2`
   - Is `1 ≤ 2 ≤ 3`? **Yes** → `result[2] = true`

4. **`numbers[3] = 16`** (index 3)
   - We need: `16 = (3 + 1) * x` → `16 = 4 * x` → `x = 4`
   - Is `1 ≤ 4 ≤ 3`? **No** → `result[3] = false`

5. **`numbers[4] = 5`** (index 4)
   - We need: `5 = (4 + 1) * x` → `5 = 5 * x` → `x = 1`
   - Is `1 ≤ 1 ≤ 3`? **Yes** → `result[4] = true`

## Function Signature

```dart
List<bool> solution(List<int> numbers, int left, int right)
```

## Input Constraints

- **`numbers`**: List of integers
  - Length: `1 ≤ numbers.length ≤ 100`
  - Values: `1 ≤ numbers[i] ≤ 10^6`

- **`left`**: Lower bound for `x`
  - Range: `1 ≤ left ≤ 10^4`

- **`right`**: Upper bound for `x`
  - Range: `1 ≤ left ≤ right ≤ 10^4`

## Output

- **Return**: A list of booleans with the same length as `numbers`
- **Type**: `List<bool>`

## Key Points

1. **Index-based calculation**: Use `(i + 1)` where `i` is the current index
2. **Integer division**: `x` must be an integer
3. **Range validation**: `x` must satisfy `left ≤ x ≤ right`
4. **Return type**: Boolean list matching the input length

## Test Cases

```dart
// Test Case 1
solution([8, 5, 6, 16, 5], 1, 3) → [false, false, true, false, true]

// Test Case 2
solution([1, 2, 3, 4, 5], 1, 1) → [true, true, true, true, true]

// Test Case 3
solution([10, 20, 30], 5, 10) → [false, true, true]
```

