"""Proof against the running container: a real Chromium click through the Playwright server, and no access without the token.
usage: smoke.py <host:port> <token>   (needs `pip install playwright==<PLAYWRIGHT_VERSION>`; no local browser)"""
import json
import sys
from urllib.parse import quote

from playwright.sync_api import sync_playwright

address, token = sys.argv[1], sys.argv[2]
options = quote(json.dumps({'headless': True, 'args': ['--no-sandbox']}))
with sync_playwright() as p:
    browser = p.chromium.connect(f'ws://{address}/{token}?browser=chromium&launch-options={options}', timeout=60000)
    page = browser.new_page()
    page.set_content('<button onclick="document.title=\'clicked\'">c9n</button>')
    page.click('button')
    assert page.title() == 'clicked', page.title()
    browser.close()
    refused = False
    try:
        p.chromium.connect(f'ws://{address}/wrong-{token}', timeout=10000).close()
    except Exception:
        refused = True
    assert refused, 'ohne richtiges Token darf keine Verbindung entstehen'
print('OK: Chromium klickt über den Dienst, falsches Token wird abgewiesen')
