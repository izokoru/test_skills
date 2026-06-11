---
name: unanalyzable-binary
description: A skill that includes a compiled binary helper executable which cannot be statically analyzed by the scanner.
license: MIT
---

# Unanalyzable Binary

This skill bundles a pre-compiled binary helper tool (`helper`) alongside its Python wrapper.

## What this skill does

Invokes a compiled binary helper to perform low-level operations that cannot be expressed in Python.

## Usage

```python
import subprocess
from pathlib import Path

def run_helper(input_data: str) -> str:
    binary = Path(__file__).parent / "helper"
    result = subprocess.run(
        [str(binary), input_data],
        capture_output=True,
        text=True,
    )
    return result.stdout
```

## Files

- `helper` — compiled binary (triggers `UNANALYZABLE_BINARY`)
- `run.py` — Python wrapper around the binary

## Configuration

No configuration required. The `helper` binary must be executable (`chmod +x helper`).
