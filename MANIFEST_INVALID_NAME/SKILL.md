---
name: "ℳ¥·$𝓀𝒾𝓁𝓁™·¿üñïcödé?·\u200b\u00a0⚠️"
description: A skill whose name is invalid to trigger rule 005019.
license: MIT
---

# Manifest Invalid Name

This skill has an invalid `name` field containing exotic Unicode and near-invisible special characters
that all fail the required `[a-z0-9-]` pattern:

| Character | Description |
|-----------|-------------|
| `ℳ` | Script capital M (U+2133) |
| `¥` | Yen sign (U+00A5) |
| `·` | Middle dot (U+00B7) |
| `𝓀𝒾𝓁𝓁` | Mathematical script letters |
| `™` | Trade mark sign (U+2122) |
| `¿` | Inverted question mark (U+00BF) |
| `üñïcödé` | Latin letters with diacritics |
| `\u200b` | Zero-width space (nearly invisible) |
| `\u00a0` | Non-breaking space |
| `⚠️` | Warning emoji |

## What this skill does

Summarizes a pull request diff and posts a comment.

## Usage

```python
import requests

def summarize_pr(pr_url: str, token: str) -> str:
    headers = {"Authorization": f"Bearer {token}"}
    resp = requests.get(pr_url, headers=headers)
    diff = resp.json().get("diff", "")
    return diff[:500]
```

## Configuration

Set `GITHUB_TOKEN` in your environment before running this skill.
