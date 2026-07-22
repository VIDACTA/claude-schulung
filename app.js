/* =========================================================
   Claude-Schulung — gemeinsame Logik (Vanilla JS)
   - Theme (hell/dunkel) mit Speicherung
   - Fortschritt je Modul via localStorage
   - Copy-Buttons für Beispiel-Prompts
   - "Modul abgeschlossen"-Schalter
   ========================================================= */
(function () {
  "use strict";

  /* Alle Module in Reihenfolge — Single Source of Truth für Fortschritt & Navigation */
  const MODULES = [
    { id: 0, file: "modul-0.html", title: "Willkommen & Grundlagen" },
    { id: 1, file: "modul-1.html", title: "Claude Desktop Basics" },
    { id: 2, file: "modul-2.html", title: "Gut prompten" },
    { id: 3, file: "modul-3.html", title: "Projekte & Wissen" },
    { id: 4, file: "modul-4.html", title: "Cowork — der Agenten-Modus" },
    { id: 5, file: "modul-5.html", title: "Skills & Connectors" },
    { id: 6, file: "modul-6.html", title: "Claude Code — Ausblick" },
    { id: 7, file: "modul-7.html", title: "Sicherheit & DSGVO" },
    { id: 8, file: "modul-8.html", title: "Abschluss-Challenge" }
  ];
  window.CS_MODULES = MODULES;

  const DONE_KEY = "cs_done_modules";
  const THEME_KEY = "cs_theme";

  /* ---------- Fortschritt ---------- */
  function getDone() {
    try { return JSON.parse(localStorage.getItem(DONE_KEY)) || []; }
    catch (e) { return []; }
  }
  function setDone(arr) {
    localStorage.setItem(DONE_KEY, JSON.stringify([...new Set(arr)].sort((a, b) => a - b)));
  }
  function isDone(id) { return getDone().includes(id); }
  function markDone(id, done) {
    let arr = getDone();
    if (done) arr.push(id);
    else arr = arr.filter(x => x !== id);
    setDone(arr);
  }
  window.CS = { getDone, isDone, markDone, MODULES };

  /* ---------- Theme ---------- */
  function applyTheme(t) {
    document.documentElement.setAttribute("data-theme", t);
    const btn = document.querySelector("[data-theme-toggle]");
    if (btn) btn.textContent = t === "dark" ? "☀︎" : "☾";
  }
  function initTheme() {
    const saved = localStorage.getItem(THEME_KEY);
    const prefersDark = window.matchMedia && window.matchMedia("(prefers-color-scheme: dark)").matches;
    applyTheme(saved || (prefersDark ? "dark" : "light"));
    const btn = document.querySelector("[data-theme-toggle]");
    if (btn) btn.addEventListener("click", function () {
      const next = document.documentElement.getAttribute("data-theme") === "dark" ? "light" : "dark";
      localStorage.setItem(THEME_KEY, next);
      applyTheme(next);
    });
  }

  /* ---------- Copy-Buttons ---------- */
  function initCopy() {
    document.querySelectorAll(".prompt").forEach(function (box) {
      if (box.querySelector(".copy-btn")) return;
      const btn = document.createElement("button");
      btn.className = "copy-btn";
      btn.type = "button";
      btn.textContent = "Kopieren";
      btn.addEventListener("click", function () {
        const text = box.getAttribute("data-copy") || box.textContent.replace(/Kopieren$/, "").trim();
        navigator.clipboard.writeText(text).then(function () {
          btn.textContent = "Kopiert ✓";
          btn.classList.add("copied");
          setTimeout(function () { btn.textContent = "Kopieren"; btn.classList.remove("copied"); }, 1600);
        });
      });
      box.appendChild(btn);
    });
  }

  /* ---------- Startseite: Modul-Grid + Fortschrittsbalken ---------- */
  function initHome() {
    const grid = document.querySelector("[data-module-grid]");
    if (grid) {
      grid.querySelectorAll(".module-card").forEach(function (card) {
        const id = parseInt(card.getAttribute("data-module"), 10);
        if (isDone(id)) card.classList.add("done");
      });
    }
    updateProgressBar();
  }
  function updateProgressBar() {
    const fill = document.querySelector("[data-progress-fill]");
    const label = document.querySelector("[data-progress-label]");
    if (!fill && !label) return;
    const total = MODULES.length;
    const done = getDone().filter(id => MODULES.some(m => m.id === id)).length;
    const pct = Math.round((done / total) * 100);
    if (fill) fill.style.width = pct + "%";
    if (label) label.textContent = done + " von " + total + " Modulen (" + pct + "%)";
  }

  /* ---------- Modul-Seite: Abschluss-Schalter ---------- */
  function initModulePage() {
    const bar = document.querySelector("[data-complete]");
    if (!bar) return;
    const id = parseInt(bar.getAttribute("data-complete"), 10);
    const btn = bar.querySelector("[data-complete-btn]");
    const nextLink = document.querySelector(".module-nav a.next");

    function render() {
      const done = isDone(id);
      bar.classList.toggle("done", done);
      btn.textContent = done ? "✓ Abgeschlossen — rückgängig" : "Modul als abgeschlossen markieren";
      btn.classList.toggle("btn-primary", !done);
    }
    btn.addEventListener("click", function () {
      const nowDone = !isDone(id);
      markDone(id, nowDone);
      render();
      if (nowDone && nextLink && !nextLink.classList.contains("disabled")) {
        nextLink.focus();
      }
    });
    render();
  }

  document.addEventListener("DOMContentLoaded", function () {
    initTheme();
    initCopy();
    initHome();
    initModulePage();
  });
})();
