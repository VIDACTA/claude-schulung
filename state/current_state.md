# Current State — Claude-Schulung

**Stand:** 2026-07-29
**Version:** 1.16.0 (lokal verifiziert; Deploy = Push auf `main`, GitHub Pages)
**Typografie:** deutsche Anführungszeichen vollständig (274 Paare, 0 gerade Zeichen im Text) —
prüfbar mit `.claude/scripts/fix-quotes.ps1 -Path C:\Dev\claude-schulung -Include '*.html'`
**Konsistenz:** 9 Regelgruppen über alle 19 Seiten geprüft, 0 Befunde (Stand 29.07.)
**Mobil geprüft:** 320 / 375 / 414 px über alle 19 Seiten, kein Überlauf (erneut mit v1.7.0)
**Content-Tiefe geprüft:** Audit aller Seiten am 27.07. (6 Reviewer + Gegenprobe), 49 Ergänzungen eingebaut

## Wo wir stehen

- [x] Alle drei Tracks live: Grundlagen (Modul 0–8), Vertiefung (1–2), Aufbau (1–5) + Workbrain-Pitch
- [x] Trainer-Leitfaden (docs/trainer-leitfaden.md)
- [x] **v1.4.0 Überarbeitung:** Raleway selbst gehostet (Google Fonts raus, DSGVO), Favicon,
      deutsche Typografie (Geviertstrich → Halbgeviertstrich), Lernpfad Modul 8 → Vertiefung/Aufbau
      verlinkt, Vertiefung 1 versionsfest formuliert, Text-Fixes (Modul 0, „promptet")
- [x] **v1.5.0 Inhalts-Ausbau:** Prompt-Injection-Abschnitt (Modul 7), Challenge-Variante C
      Bewerber-Kommunikation (Modul 8), Alltagskleidung-Regel (Aufbau 3), Rückfragen-Kniff
      (Modul 2), Websuche-Hinweis + Fortschritts-FAQ (Modul 0), Vertiefungs-Track im
      Trainer-Leitfaden, Querverweis Modul 7 → Vertiefung 1, Homoglyphen-Fix
- [x] **v1.6.0–1.6.3:** Workshop-Eröffnungs-Deck `praesentation.html`, auf der Startseite verlinkt,
      Mobil-Audit (Diagramme lesbar, Touch-Ziele, Wortumbruch)
- [x] **v1.7.0 Content-Ausbau:** 49 geprüfte Ergänzungen aus dem Seiten-Audit – Deck 11 → 15 Folien,
      Modul 8 von Challenge-Liste zu vollem Abschlussmodul, Aufbau 1/4 mit Anwendungsfällen und
      Beispielen, überall Tabellen/FAQ/Übungen statt reiner Aufzählungen
- [x] **v1.8.0 Ampel-Bereinigung:** Grün/Gelb/Rot gilt nur noch dort, wo die Farbe eine Erlaubnis
      oder ein Risiko bewertet (8 Blöcke). Fünf Blöcke, die Fähigkeiten, gleichwertige Alternativen
      oder Prüffragen zeigten, laufen jetzt über das neutrale Muster `.infogrid`/`.infocard`
      (Modul 0, 3, 5, 6, Vertiefung 1). Dazu: Beispiel-Prompt in Modul 0 deckt Schulen und
      Anerkennungsbegleitung ab; fester Tagesablauf aus dem Trainer-Leitfaden entfernt
- [x] **v1.9.0 Farbsprache + Modul 2:** keine Zeitangaben mehr (34 Stellen); 🔴/🟢 nur noch für
      Erlaubnis, Verbot und Pflicht – Qualitätsvergleiche laufen über ✗/✓ (`.callout.nein/.ja`);
      Ampelstreifen der Deck-Folie zurückgeholt; Modul 2 um einen K-A-F-T-Prompt aus dem
      Schulbetrieb und den Abschnitt „eigenen Text verbessern lassen" erweitert
- [x] **v1.10.0 Modul 0/1/7:** Anonymisierungs-Beispiel erkennbar fiktiv (kein realistischer
      Personendatensatz auf der öffentlichen Seite); Ampel-Begründung nachgeschärft („Warum ist das
      so streng?" – Daten verlassen das Haus, Gesundheitsdaten, Name nie nötig, Auskunftspflicht);
      Meldeweg „nicht löschen, melden" schon in Modul 1; Gender-Konstruktion bei den
      Datenschutzbeauftragten geglättet
- [x] **v1.11.0 Ampel präzisiert:** interne Dokumente ohne Personenbezug von Gelb nach Grün, Gelb
      klarer auf „enthält Personenbezug, den du entfernst" zugeschnitten (inkl. indirekter
      Erkennbarkeit); neuer Hinweis, dass Personenbezug und Vertraulichkeit zwei verschiedene
      Prüfungen sind
- [x] **v1.12.0 Modul 3:** Prüf-Hinweis („Wissens-Datei ist keine Garantie", Stichprobe),
      Teilen-Hinweis („wer sieht es danach?"), Ausklapper zur Projekt-Größe („ein Projekt = ein
      Zweck") mit Querverweis auf Vertiefung 1, zwei Projekt-Ideen aus Schulbetrieb und Verwaltung
- [x] **v1.13.0 Modul 4:** Prompt Injection schon im Cowork-Modul (dort wechselt das Risiko die
      Kategorie: Claude *irrt* sich vorher, *handelt* ab hier), Hinweis „wo landet das Ergebnis",
      keine festen Funktionsnamen mehr („geführter Einstieg" statt „Einrichtungsassistent"),
      Ampel-Check ohne vorweggenommene Antwort
- [x] **v1.14.0 Modul 5:** keine Unbedenklichkeits-Erklärung mehr („datenschutzrechtlich unkritisch"
      → IT/Datenschutz entscheiden), Skills mit Ohne-/Mit-Vergleich erklärt statt nur genannt,
      Abgrenzung Projekt-Teilen ↔ IT-Verbindung, Maßstab für die drei Prüffragen
- [x] **v1.15.0 Modul 6 + Typografie:** kein Versprechen mehr auf einen noch nicht existierenden
      Aufbaukurs, Beispieldatei als Word statt Markdown, Querverweis auf Modul 4 — dazu site-weit
      272 Anführungszeichen-Schließer korrigiert (`"` → `“`)
- [x] **v1.16.0 Modul 7 + Konsistenz-Check:** Ampel-Definition in Modul 7 und Deck an Modul 1
      angeglichen (Folgefehler aus v1.11.0), realistische Personendatensätze ersetzt, Ampel-Begründung
      auch im Pflichtmodul, Prompt-Injection-Tonalität mit Modul 4 abgeglichen
- [x] Live: https://vidacta.github.io/claude-schulung/

## Offen / nächste Schritte
- Echte Screenshots aus der Team/Enterprise-Umgebung einsetzen (aktuell beschriftete SVG-Schemata —
  bewusst gewählt, funktioniert; echte Screenshots wären „nice to have").
- Interne Ansprechpartner + Richtlinien-Links in Modul 7 eintragen (nur für interne Version —
  auf der Public-Site bewusst keine Personennamen).
- Feedback der ersten Schulung einarbeiten; ggf. Aufbaukurs Claude Code.

## Geklärte Entscheidungen

- **Projekte teilen** (Dominik, 29.07.): innerhalb der eigenen Abteilung erlaubt, darüber hinaus
  vorher abstimmen — Datenschutz gilt unverändert, weil geteilte Projekte die Wissens-Dateien mitteilen
- **Keine Zeitangaben** auf der Site und im Leitfaden (29.07.): kein Tagesablauf, keine
  Modul-/Übungsminuten — das Tempo hängt an der Gruppe
- **Ampelfarben** nur für Erlaubnis, Verbot und Pflicht; Qualitätsvergleiche über ✗/✓

- Zielgruppe: reine Nicht-Techniker · Sprache: Deutsch · Plan im Haus: Team/Enterprise
- Navigation: Seite pro Modul · Stack: statisches HTML/CSS/JS, kein Build-Step
- Repo public (Org-Plan kann keine privaten Pages) → keine Personennamen/Interna auf der Site
- Fonts: selbst gehostet aus @fontsource (SIL OFL), Subsets latin + latin-ext, Gewichte 400–800
- Modell-Aussagen in Inhalten versionsfest halten (kein Fest-Nageln an Modellnamen)
