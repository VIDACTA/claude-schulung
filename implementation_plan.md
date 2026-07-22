# Implementation Plan — Claude-Schulung für VIDACTA-Mitarbeiter

> Interne Schulung: **Claude Desktop, Cowork & Code** für Mitarbeiter mit ~0 Vorerfahrung.
> Format: durchklickbare **GitHub-Pages-Site** (Selbstlernen) + Grundlage für **Live-Workshop** + **Hands-on-Übungen**.
> Zielgruppe: **reine Nicht-Techniker** (Marketing, Vertrieb, Verwaltung, GF).

## Status
- [x] Brainstorming (Zielgruppe, Format, Umfang, Ablage geklärt)
- [] Design-Genehmigung durch Dominik  ← **wir sind hier**
- [ ] Projekt-Init (Doku-Struktur, Git)
- [ ] Site-Gerüst (HTML/CSS/JS)
- [ ] Inhalte je Modul
- [ ] Hands-on-Übungen
- [ ] Trainer-Leitfaden für Live-Workshop
- [ ] Deploy auf GitHub Pages

---

## 1. Leitprinzipien

1. **Angst nehmen, nicht Features zeigen.** Anfänger blockieren aus Unsicherheit („Was, wenn ich was kaputt mache?" / „Darf ich das hochladen?"). Jedes Modul beginnt mit einem echten, ungefährlichen Erfolgserlebnis.
2. **Reihenfolge = Desktop → Cowork → Code.** 90 % des Nutzens für Nicht-Techniker liegt in Desktop + Cowork. Code ist bewusst ein **geführter Ausblick**, kein Dev-Kurs.
3. **Alles an VIDACTA-Aufgaben.** Keine abstrakten Beispiele — echte Aufgaben aus Marketing/Verwaltung/Vertrieb.
4. **DSGVO als roter Faden, nicht als Anhang.** VIDACTA verarbeitet sensible Daten (Bewerber, teils Gesundheitsbezug). Datenschutz-Regeln kommen früh und werden in jeder Übung mitgedacht.
5. **Selbsterklärend + Trainer-tauglich.** Die Site funktioniert allein (Selbstlernen) UND als Folien-Ersatz im Live-Workshop.

## 2. Umgang mit dem Zielkonflikt (Nicht-Techniker + „vollständig inkl. Code")

Claude Code wird **nicht** als Entwickler-Training behandelt. Stattdessen:
- Konzept erklären („das Werkzeug für Dateien/Ordner auf deinem Rechner")
- **eine** geführte, ungefährliche Aufgabe (z. B. „Claude Code fasst alle PDFs in einem Ordner zusammen")
- klare Grenze: kein Terminal-Deepdive, kein Git, kein Deployment
- Weiterlern-Pfad für die, die mehr wollen

## 3. Curriculum (Module)

| # | Modul | Kern-Lernziel | Hands-on-Übung (VIDACTA) |
|---|---|---|---|
| **0** | **Willkommen & Grundlagen** | Was ist Claude, was kann/kann er nicht, Login, welche Version | Ersten Chat starten, sich vorstellen lassen |
| **1** | **Claude Desktop Basics** | Oberfläche, Chats, Projekte, Dateien hochladen | E-Mail an Bewerber freundlich umformulieren |
| **2** | **Gut prompten** | Kontext/Rolle/Beispiele/Iterieren; häufige Fehler | Stellenanzeige aus Stichpunkten erzeugen |
| **3** | **Projekte & Wissen** | Projekte als Wissensspeicher, Dateien als Kontext | VIDACTA-FAQ-Projekt anlegen, Fragen stellen |
| **4** | **Cowork — der Agenten-Modus** | Was ist ein Agent, `setup-cowork`, Aufgaben delegieren | Mehrstufig: Recherche → Tabelle → Kurzbericht |
| **5** | **Skills & Connectors (leicht)** | Was Skills/Plugins/Connectors sind, sicher verbinden | Google-Drive-Connector verstehen (konzeptuell) |
| **6** | **Claude Code — geführter Ausblick** | Wann brauche ich das, was ist der Unterschied | 1 geführte Datei-Aufgabe, ungefährlich |
| **7** | **Sicherheit, DSGVO & VIDACTA-Regeln** | Was darf rein/nicht rein, Halluzinationen prüfen, Policy | Checkliste „Darf ich das hochladen?" anwenden |
| **8** | **Abschluss-Challenge** | Alles kombinieren, Selbstvertrauen | Reale Aufgabe End-to-End + Selbst-Check |

> Reihenfolge bewusst: Datenschutz (Modul 7) kommt inhaltlich früh als „Ampel-Regel" in Modul 1 vor und wird in Modul 7 vertieft — nicht erst am Ende zum ersten Mal.

## 4. Technische Umsetzung

- **Stack:** statisches HTML/CSS/JS, **kein Build-Step** (Muster wie `urlaubsplaner`).
- **Struktur:** eine `index.html` (Landing + Modul-Navigation) + ein Abschnitt/Seite je Modul (Single-Page mit Anker-Navigation *oder* Seite pro Modul — Entscheidung s. offene Fragen).
- **Design:** VIDACTA-Markenfarben (Navy `#0c1c48`, Blau `#154e84`, Sky `#74bfe4`), Raleway, hell/dunkel-tauglich, mobil lesbar. Kein AI-Slop (keine Gradient-Texte, keine Glassmorphism-Deko).
- **Komponenten:** Fortschritts-Anzeige, aufklappbare „Tipp/Achtung"-Boxen, Copy-Buttons für Beispiel-Prompts, „Übung"-Karten, Screenshot-Platzhalter.
- **Hosting:** GitHub Pages (Repo `VIDACTA/claude-schulung`), intern teilbar per Link.

## 5. Projekt-Artefakte (VIDACTA-Doku-Struktur)

`PROJECT_META.json`, `README.md`, `CHANGELOG.md`, `state/current_state.md`, `logs/session_log.md`
(via `project-init`-Workflow) + `docs/trainer-leitfaden.md` für den Live-Workshop.

## 6. Genutzte Skills/Ressourcen

- **`setup-cowork`** (Anthropic) — geführtes Cowork-Setup, direkt in Modul 4 verlinkt/eingebettet.
- **`impeccable` / `taste-skill`** — für ein sauberes, nicht-templatehaftes Site-Design.
- **`vidacta-knowledge-base`** — Quelle für fachlich korrekte VIDACTA-Beispiele in den Übungen.
- **`project-init`** — Aufsetzen der Doku-Struktur.

## 7. Geklärte Entscheidungen

- ✅ **Claude-Plan:** Team/Enterprise → volles Programm (Cowork, Connectors, Admin-Kontrolle) wird gezeigt.
- ✅ **Navigation:** Seite pro Modul.
- ✅ **Sprache:** komplett Deutsch.

## 8. Noch offen (kann auch während/nach dem Bau geklärt werden)

1. **Screenshots:** Platzhalter setzen und ihr liefert echte Screenshots — oder ich mache welche aus der App? *(Vorschlag: Platzhalter zuerst, echte Screenshots später einsetzen.)*
2. **Live-Workshop-Dauer:** Halbtag / Ganztag / mehrere Sessions? (Bestimmt Umfang des Trainer-Leitfadens.)

---

*Erstellt im Brainstorming. Nächster Schritt nach Genehmigung: `project-init` + Site-Gerüst.*
