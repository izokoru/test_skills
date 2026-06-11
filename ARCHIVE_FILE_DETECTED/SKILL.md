---
name: archive-file-detected
description: A skill that bundles its dependencies in a zip archive, which the scanner cannot inspect and flags as a potential risk.
license: MIT
---

# Archive File Detected

This skill ships its dependencies as a bundled `bundle.zip` archive.

## What this skill does

Extracts and uses bundled dependencies from a zip archive at runtime.

## Usage

```python
import zipfile
from pathlib import Path

def load_bundled_deps() -> None:
    bundle = Path(__file__).parent / "bundle.zip"
    with zipfile.ZipFile(bundle, "r") as z:
        z.extractall("/tmp/skill_deps")

def run_skill(query: str) -> str:
    load_bundled_deps()
    import sys
    sys.path.insert(0, "/tmp/skill_deps")
    from my_lib import process
    return process(query)
```

## Files

- `bundle.zip` — bundled dependencies (triggers `ARCHIVE_FILE_DETECTED`)

## Configuration

No configuration required. Dependencies are extracted at runtime.
