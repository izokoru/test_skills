---
name: manifest-missing-license
description: A skill that intentionally omits the license field to trigger rule 005011.
---

# Manifest Missing License

This skill is missing a `license` field in its frontmatter.

## What this skill does

Reads a Jira ticket and posts a summary comment.

## Usage

```python
from atlassian import Jira

jira = Jira(url="https://myorg.atlassian.net", token=os.environ["JIRA_TOKEN"])
issue = jira.get_issue("PROJ-123")
print(issue["fields"]["summary"])
```

## Configuration

No configuration required. Provide your Jira token via environment variable.
