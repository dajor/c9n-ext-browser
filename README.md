# c9n-ext-browser

Chromium und Playwright als optionale Erweiterung für c9n (Web-Agenten).

Diese Erweiterung wird getrennt vom c9n-Kern gebaut und hat **eine eigene Version** (Tags `v<version>`).
Sie läuft als eigener Dienst und wird in c9n unter *Einstellungen → Erweiterungen* aktiviert, aktualisiert,
deaktiviert und entfernt. Jedes Release enthält ein Image-Archiv, `extension.json` und eine Prüfsumme;
c9n prüft Prüfsumme, Version und Verträglichkeit, bevor es etwas startet.

Inhalt: Chromium mit Playwright-Server.

Status: angelegt, noch ohne Release. Der Inhalt zieht aus dem c9n-Image hierher um.
