# Learnings: Präsentationstechnik (HTML-Decks)

> **Migriert am 2026-08-05 aus dem Workspace-Brain** (`.claude/brain/learnings/gotchas.md`,
> Kategorie „HTML Präsentationen", plus eine Lesson aus `lessons-learned.md`). Diese Gotchas
> sind beim Bau dieses Repos entstanden und leben jetzt hier — bei Änderungen an Slides,
> Swipe-Navigation oder Copy-Buttons zuerst hier nachsehen.

## Warum überhaupt HTML statt PowerPoint

**Session:** 2026-06-16 · **Kontext:** CapCut & Riverside Workshop
**Erkenntnis:** Single-File HTML-Präsentationen (CSS + JS) sind portabler als PowerPoint:
versionierbar (Git), sofort im Browser teilbar (GitHub Pages), keine Software-Abhängigkeit.
Besonders für Entwickler-/Tech-Workshops ideal. Aber: Mobile-Responsiveness erfordert
sorgfältige Touch-Event-Behandlung (Swipe vs. Scroll) — genau dafür die Gotchas unten.

## Slide-Navigation & Animation

### Slide-Animationen: `isAnimating`-Lock verursacht Glitches bei schnellem Swipen

**Problem:** Ein Boolean-Lock (`isAnimating = true` für 500ms) blockiert den nächsten Slide-Wechsel. Bei schnellem Swipen überlagern sich die Cleanup-Timeouts und hinterlassen stale inline-Styles.
**Lösung:** Lock entfernen. Stattdessen: `cleanupAllSlides()` vor jeder neuen Animation + `clearTimeout()` für pending Cleanups. Animation auf 300ms reduzieren.

### Mobile Swipe vs. Scroll-Konflikt

**Problem:** `overflow-y: auto` auf Slides (für scrollbaren Content) kollidiert mit horizontaler Swipe-Erkennung. Content driftet horizontal, schwarzer Rand erscheint.
**Lösung:**
1. `overflow-x: hidden` auf Slides
2. `touchmove` Handler der horizontal vs. vertikal unterscheidet (dx > dy × 1.5)
3. `e.preventDefault()` nur bei horizontalen Swipes (`{ passive: false }`)
4. `scrollTop = 0` Reset bei jedem Slide-Wechsel

### `translateX`-Animation auf Mobile → schwarzer Rand

**Problem:** Slide-Wechsel mit `translateX(40px)` / `translateX(-40px)` erzeugt auf Mobile beim schnellen Swipen einen kurzen Moment, wo kein Slide den Viewport vollständig abdeckt → schwarzer Hintergrund blitzt durch.
**Lösung:** Auf Mobile `transform: none !important` setzen und nur `opacity`-Fade (0.2s) nutzen. Desktop kann weiterhin `translateX` verwenden.

### `opacity: 0` reicht nicht zum Verstecken von Slides

**Problem:** Non-active Slides mit `opacity: 0` bleiben im Rendering-Baum und können als Geister-Artefakte durchscheinen (besonders am Bildschirmrand sichtbar).
**Lösung:** Zusätzlich `visibility: hidden` auf non-active Slides setzen. `visibility: visible` nur auf `.slide.active`. Außerdem `background-color` (solid) auf Slides setzen — eine transparente `background-image` (Gradient) allein deckt nichts ab.

### Horizontale Tabellen-Scrollbars auf Mobile → Swipe-Konflikt

**Problem:** `overflow-x: auto` auf Tabellen kollidiert mit der Swipe-Erkennung für Slide-Wechsel. User will Slide wechseln, scrollt aber stattdessen die Tabelle.
**Lösung:** Kein horizontales Scrollen auf Mobile. Stattdessen:
1. `table-layout: fixed` (Spalten gleichmäßig verteilen)
2. `white-space: normal` + `word-break: break-word` (Text umbricht)
3. Schriftgröße auf 0.7rem reduzieren
4. Globaler Schutz: `.slide-inner, .slide-inner * { max-width: 100%; overflow-wrap: break-word; }`

## Mobil-Lesbarkeit von Inhalten

### SVG-Diagramme mit fixem viewBox werden auf Mobil unlesbar (2026-07-27)

**Problem:** `svg { width: 100% }` bei `viewBox="0 0 700 380"` skaliert **auch die Schrift**:
Auf 375 px Viewport wird 13-px-Beschriftung zu ~6,9 px — technisch fehlerfrei, praktisch unlesbar.
Fällt bei keinem Overflow- oder Kontrast-Check auf, weil nichts „kaputt" ist.
**Lösung:** Unter der Mobil-Breakpoint dem SVG eine `min-width` geben (Zielwert: effektive
Schriftgröße ≥ 11 px, also `min-width ≈ viewBox-Breite × 11/13`) und die umgebende `figure` auf
`overflow-x: auto` setzen. Die `figcaption` mit `position: sticky; left: 0` festhalten, sonst
scrollt sie mit weg — und per `::after` einen „seitlich wischen"-Hinweis ergänzen.
**Merke:** Prüfgröße ist nicht „passt es rein", sondern „wie groß ist der Text am Ende wirklich".

**Zweite Ausprägung derselben Klasse (2026-07-29, `praesentation.html`):** Ein Label mit
`font-size: .75em` in einer Box, deren eigene Größe per `clamp(14px, 1.6vw, 20px)` gesetzt ist.
Auf Desktop 15 px, bei 320–414 px fällt die Box auf ihr `clamp`-Minimum — und das Label schrumpft
mit, auf **10,5 px** bzw. **9,6 px**. Kein Overflow, kein sichtbarer Bruch, nur unlesbar.
**Regel:** In einer `clamp`-skalierten Box dürfen Kindelemente ihre Größe **nicht als `em`-Anteil**
beziehen — eigener `clamp` mit harter Untergrenze (12 px). Und: Der Mobil-Check muss
`getComputedStyle().fontSize` je Blattelement messen, nicht nur `scrollWidth`; der Überlauf-Check
allein hätte beide Fälle durchgelassen.

## Markup & Copy-Buttons

### Ein gerades `"` in einem HTML-Attribut bricht es unsichtbar (2026-07-29)

In `claude-schulung` lieferten **6 von 23 Copy-Buttons nur ein Bruchstück** des Prompts. Ursache: Im
`data-copy="…"`-Attribut stand ein **gerades** `"` (U+0022) im Wert — damit endet der Attributwert
dort, der Rest landet als ungültiges Markup im Tag. Der Prompt in Modul 2 brach bei
„Kommunikation mit Patienten" ab.

**Warum das durch jede normale Prüfung fällt:** Die Seite rendert trotzdem, der Button ist da, die
Konsole ist still. Ich hatte vorher „23 Prompts, 23 Copy-Buttons" verifiziert — gezählt, aber nicht
den *Inhalt* geprüft. Gefunden erst, als ein Regex `data-copy="[^"]*"` einen auffällig kurzen Match
lieferte.

Konsequenzen:

- In Attributwerten gehören typografische Anführungszeichen (`„…“`) oder `&quot;` — nie ein gerades `"`.
  Im **Fließtext** ist es unkritisch, deshalb entsteht die Asymmetrie: Wer den Text kopiert und ins
  Attribut einsetzt, zerstört es.
- **Prüfen heißt Inhalt vergleichen, nicht Vorkommen zählen.** Bei `<div data-copy="X">X</div>`-Mustern
  Attribut und sichtbaren Text auf Zeichengleichheit prüfen.
- Verankert als Regel 10 in `claude-schulung/konsistenz-check.ps1`.
