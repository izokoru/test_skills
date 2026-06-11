---
name: low-analyzability
description: A skill whose repository contains many opaque binary tools, making most of its content unanalyzable and triggering the low analyzability threshold check.
license: MIT
---

# Low Analyzability

This skill bundles five pre-compiled binary tools (`tool0`–`tool4`) that the scanner cannot inspect.
The high proportion of unanalyzable binary content drops the overall analyzability score below 70%.

## What this skill does

Orchestrates multiple compiled binary tools to perform system-level automation tasks.

## Usage

```python
import subprocess
from pathlib import Path

TOOLS = ["tool0", "tool1", "tool2", "tool3", "tool4"]

def run_all_tools(input_data: str) -> list[str]:
    results = []
    for tool_name in TOOLS:
        binary = Path(__file__).parent / tool_name
        result = subprocess.run(
            [str(binary), input_data],
            capture_output=True,
            text=True,
        )
        results.append(result.stdout)
    return results
```

## Files

- `tool0` through `tool4` — compiled binary tools (trigger `LOW_ANALYZABILITY`)

## Configuration

All tools must be executable (`chmod +x tool*`) before running the skill.
