## Task 2: Maximize Equal Ribbon Length

### Problem Description
You are given:
- A list of integers `a`, where each `a[i]` is the length of a ribbon
- An integer `k` representing the required number of ribbons

Your goal is to determine the maximum integer length `L` such that you can obtain at least `k` ribbons of length `L` by cutting the given ribbons. You may cut ribbons into as many pieces as needed. Leftover pieces can be discarded. Ribbons cannot be joined together.

### Output
- Return the maximum possible integer length `L` such that at least `k` ribbons of length `L` can be produced.

### Notes
- Only integer lengths are allowed for `L`.
- You can discard any leftover pieces after cutting.
- You cannot combine pieces from different ribbons.

### Example 1
**Input:**
```dart
a = [5, 2, 7, 4, 9]
k = 5
```

**Output:**
```dart
4
```

**Explanation:** One way to make 5 ribbons of length 4:
- Cut the ribbon of length 5 into `4 + 1` (discard 1)
- Cut the ribbon of length 7 into `4 + 3` (discard 3)
- Use the existing ribbon of length 4
- Cut the ribbon of length 9 into `4 + 4 + 1` (discard 1)
- Discard the ribbon of length 2

It is not possible to obtain 5 ribbons of any length greater than 4.

### Example 2
**Input:**
```dart
a = [1, 2, 3, 4, 9]
k = 6
```

**Output:**
```dart
2
```

**Explanation:** One way to make 6 ribbons of length 2:
- Cut `9` into `2 + 2 + 2 + 2 + 1` (use four 2s)
- Cut `4` into `2 + 2` (use two 2s)
- Ignore `1`, `2`, and `3` as they are not needed further

While a fractional length like `2.25` could produce 6 ribbons in theory, only integer lengths are allowed. Therefore, the answer is `2`.

### Approach Hint (Optional)
- To check if a candidate length `L` is feasible, compute `sum(a[i] ~/ L)` and verify it is at least `k`.
- The optimal solution can be found efficiently using binary search on `L` in the range `[1, max(a)]`.

### Test Cases
```dart
// Test Case 1
solution([5, 2, 7, 4, 9], 5) → 4

// Test Case 2
solution([1, 2, 3, 4, 9], 6) → 2

// Test Case 3
solution([5, 5, 5], 4) → 2

// Test Case 4
solution([2, 3, 5], 7) → 1

// Test Case 5
solution([100], 1) → 100
```