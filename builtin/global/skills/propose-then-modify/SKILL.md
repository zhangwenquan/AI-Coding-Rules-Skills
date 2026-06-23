---
name: "propose-then-modify"
description: "Ensures code changes are proposed and confirmed before implementation. Invoke when user reports a bug/issue or requests a feature/fix, before making any code changes."
---

# Propose Then Modify

This skill enforces a discipline: always propose a solution and get user confirmation before modifying any code.

## When to Apply

- User reports a bug or issue
- User requests a feature or fix
- User asks for code changes
- Before using Edit/Write tools to modify code

## Workflow

1. **Analyze** - Understand the problem by reading relevant code
2. **Propose** - Provide a clear modification plan with:
   - What files will be changed
   - What the changes will do
   - Why this approach is chosen
3. **Confirm** - Wait for user to approve or request modifications
4. **Implement** - Only after confirmation, make the changes
5. **Verify** - Run tests or compilation to verify success

## What NOT to Do

- Do NOT immediately modify code when user describes a problem
- Do NOT assume you understand the requirement without analysis
- Do NOT skip the proposal step even for "simple" fixes

## Example

**Bad:**
```
User: The button doesn't work
AI: *immediately edits the code*
```

**Good:**
```
User: The button doesn't work
AI: Let me analyze the code first.
    *reads code*
    I found the issue. Here's my proposed fix:
    1. Change X to Y in file Z
    2. Reason: ...
    Do you want me to proceed?
User: Yes, go ahead
AI: *makes the changes*
```
