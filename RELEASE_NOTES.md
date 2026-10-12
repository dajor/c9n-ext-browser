# c9n-ext-browser 1.0.0

Chromium und Playwright als Erweiterung für c9n. Agenten-Skripte, die einen Browser starten, nutzen ihn über diesen Dienst, sobald die Erweiterung aktiv ist. Verlangt c9n mit Erweiterungs-Schnittstelle 1 (ab c9n 0.9.16).

Der Dienst hat keinen veröffentlichten Anschluss und ist nur unter einem geheimen Pfad erreichbar, den c9n beim Aktivieren erzeugt. Playwright 1.62.0, Chromium aus diesem Paket.

Grenze: Der Browser läuft in einem eigenen Container; Dateien, die ein Skript lokal erwartet (Downloads, Uploads), liegen im Skript-Container, nicht im Browser.
