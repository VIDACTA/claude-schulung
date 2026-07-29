# Claude-Schulung

**🌐 Live: <https://vidacta.github.io/claude-schulung/>**

Interne Schulung für **VIDACTA-Mitarbeiter mit wenig bis keiner Vorerfahrung** zu:

- **Claude Desktop** – die Chat-App im Alltag
- **Cowork** – der Agenten-Modus, echte Aufgaben delegieren
- **Claude Code** – geführter Ausblick für Datei-/Ordner-Arbeit

**Zielgruppe:** reine Nicht-Techniker (Marketing, Vertrieb, Verwaltung, GF).
**Format:** durchklickbare Selbstlern-Site + Grundlage für Live-Workshop + Hands-on-Übungen.

## Aufbau

- `index.html` – Startseite mit Modul-Übersicht (Grundlagen + Aufbau)
- `modul-*.html` – Grundlagen, eine Seite je Modul (9 Module: 0–8)
- `aufbau-*.html` – Aufbau-Track Kreativ/Marketing (5 Module: Chrome-Extension, Connectors, Higgsfield, ElevenLabs, Meta/Google Ads)
- `vertiefung-*.html` – Vertiefungs-Track (2 Module: „Wie Claude wirklich funktioniert" – KI-Grundwissen, Kontext, Context Rot/„Dumb Zone" mit Chart, Halluzinationen · „Claude Desktop voll ausnutzen" – Projekte, Artefakte, Routinen, Anpassen, Geplant)
- `style.css` – gemeinsames Design (VIDACTA-Markenfarben, Raleway)
- `app.js` – Fortschritt, Copy-Buttons, aufklappbare Boxen, Theme
- `docs/trainer-leitfaden.md` – Leitfaden für den Live-Workshop
- `implementation_plan.md` – Design-/Planungsdokument
- `konsistenz-check.ps1` – Prüfscript, siehe unten

## Nach jeder inhaltlichen Änderung prüfen

Die Seiten verweisen aufeinander und wiederholen dieselben Definitionen – vor allem die
🚦 Datenschutz-Ampel, die in Modul 1, Modul 7 **und** im Eröffnungs-Deck steht. Wer eine Seite
ändert, macht damit leicht eine andere inkonsistent. Deshalb:

```bash
powershell -ExecutionPolicy Bypass -File .\konsistenz-check.ps1
```

Prüft 9 Regelgruppen über alle Seiten: keine Zeitangaben · deutsche Anführungszeichen und deren
Paarigkeit · keine realistischen Personendatensätze (**das Repo ist public**) · zurückgenommene
Aussagen · Gender-Formen · versionsfeste Modell-Aussagen · tote Links und Anker · Ampelfarben nur
für Erlaubnis/Risiko · deckungsgleiche Ampel-Definitionen. Ziel ist „0 Befunde".

Für die Typografie zusätzlich (Trockenlauf, schreibt nichts):

```bash
powershell -ExecutionPolicy Bypass -File C:\Dev\.claude\scripts\fix-quotes.ps1 -Path . -Include '*.html'
```

## Lokal ansehen

Kein Build-Step nötig – `index.html` im Browser öffnen. Für saubere Navigation empfohlen:

```bash
python -m http.server 8000
```

Dann `http://localhost:8000` öffnen.

## Deployment

GitHub Pages aus dem `main`-Branch (Repo `VIDACTA/claude-schulung`). Kein Build.

## Status

Live und vollständig: Grundlagen (0–8), Aufbau-Track (5) und Vertiefungs-Track (2). Details siehe
`CHANGELOG.md` und `state/current_state.md`. Offen: echte Screenshots statt Platzhalter.
