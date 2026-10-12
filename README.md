# c9n-ext-browser

Chromium und Playwright als optionale Erweiterung für c9n (Web-Agenten).

Diese Erweiterung wird getrennt vom c9n-Kern gebaut und hat **eine eigene Version** (Tags `v<version>`, Datei `VERSION`).
Sie läuft als eigener Dienst und wird in c9n unter *Einstellungen → Erweiterungen* aktiviert, aktualisiert,
ausgeschaltet und entfernt. Jedes Release enthält ein Image-Archiv, `extension.json` und `SHA256SUMS`;
c9n prüft Prüfsumme, Image-Kennung, Version und Verträglichkeit, bevor es etwas startet.

## Aufbau
- `Dockerfile`, `serve.sh`: Node, Playwright 1.62.0, Chromium; Playwright-Server auf Port 9300 unter `/<Token>` (Token: `C9N_EXT_TOKEN`).
- `scripts/smoke.py`: Beweis gegen den laufenden Container: echter Chromium-Klick, falsches Token wird abgewiesen.
- `scripts/package.py`: schreibt `extension.json` und `SHA256SUMS`.
- `.github/workflows/release.yml`: baut, prüft, verpackt; Modus `publish` veröffentlicht das Release.

## Neue Version
`VERSION` und `RELEASE_NOTES.md` (erste Zeile `# c9n-ext-browser <Version>`) ändern, dann den Workflow *Release* mit Modus `publish` starten.
Die Playwright-Version muss zur Version im c9n-Image passen (`deploy/workers/skills-requirements.lock`).
