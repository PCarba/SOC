import os
import json

# Optional: integrate with your LLM provider.
# Keep it human-in-the-loop.

def summarize(alert: dict) -> str:
    # Placeholder implementation to keep repo functional without external deps
    title = alert.get('rule', {}).get('description') or alert.get('title') or 'Security alert'
    src = alert.get('data', {}).get('srcip') or alert.get('source', {}).get('ip')
    dst = alert.get('data', {}).get('dstip') or alert.get('destination', {}).get('ip')
    return f"{title}. Source={src}, Destination={dst}. Review associated logs and confirm severity."

if __name__ == '__main__':
    import sys
    if len(sys.argv) != 2:
        print('Usage: python3 llm_alert_summary.py <alert.json>')
        raise SystemExit(1)
    with open(sys.argv[1], 'r', encoding='utf-8') as f:
        alert = json.load(f)
    print(summarize(alert))
