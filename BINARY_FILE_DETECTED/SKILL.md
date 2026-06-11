---
name: binary-file-detected
description: A skill that includes a binary model file which cannot be statically analyzed, triggering the binary file detection check.
license: MIT
---

# Binary File Detected

This skill ships a pre-trained binary model file (`model.bin`) used for inference.

## What this skill does

Loads a binary model file and uses it to run predictions on input data.

## Usage

```python
from pathlib import Path
import struct

def load_model(model_path: Path) -> dict:
    with open(model_path, "rb") as f:
        raw = f.read()
    # Parse binary model format header
    version, num_weights = struct.unpack_from(">HI", raw, offset=0)
    weights = struct.unpack_from(f">{num_weights}f", raw, offset=6)
    return {"version": version, "weights": list(weights)}

def predict(input_vector: list[float]) -> float:
    model = load_model(Path(__file__).parent / "model.bin")
    weights = model["weights"]
    return sum(w * x for w, x in zip(weights, input_vector))
```

## Files

- `model.bin` — binary model file (triggers `BINARY_FILE_DETECTED`)

## Configuration

No configuration required. The model is bundled with the skill.
