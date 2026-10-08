<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="robots" content="noindex, nofollow">
  <title>Tableau de bord — Clinic Manager</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Instrument+Serif:ital@0;1&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
  <style type="text/tailwindcss">
    @theme {
      --font-serif: "Instrument Serif", Georgia, serif;
      --font-sans: "Inter", ui-sans-serif, system-ui, sans-serif;
      --color-cream: #fffbe6;
      --color-butter: #fff3b0;
    }
    @layer components {
      .card { @apply rounded-3xl border border-neutral-200/70 bg-white p-5 shadow-[0_10px_30px_-18px_rgba(60,50,20,.25)] sm:p-6; }
      .nav-link { @apply flex items-center gap-3 rounded-full px-4 py-3 text-sm font-medium text-neutral-700 transition hover:bg-butter/60; }
    }
  </style>
  <style>
    body { background-color:#fffbe6;
      background-image:
              radial-gradient(at 12% 8%, #fff3b0 0, transparent 45%),
              radial-gradient(at 88% 12%, #f3e7d3 0, transparent 50%),
              radial-gradient(at 80% 90%, #d9e1ea 0, transparent 50%),
              radial-gradient(at 8% 85%, #efe6d0 0, transparent 45%);
      background-attachment: fixed; }
    :focus-visible { outline: 2px solid #000; outline-offset: 3px; }
    @keyframes fade-up { from { opacity:0; transform:translateY(20px); } to { opacity:1; transform:none; } }
    .fade-up { animation: fade-up .7s ease both; animation-delay: var(--d, 0s); }
    @media (prefers-reduced-motion: reduce) {
      .fade-up { animation: none; }
      * { transition-duration: .01ms !important; scroll-behavior: auto !important; }
    }
  </style>
</head>
<body class="font-sans text-neutral-900 antialiased">
<a href="#contenu" class="sr-only focus:not-sr-only focus:fixed focus:top-3 focus:left-3 focus:z-50 focus:rounded-full focus:bg-black focus:px-4 focus:py-2 focus:text-white">Aller au contenu</a>

<!-- Fond du tiroir (mobile) -->
<div id="overlay" class="fixed inset-0 z-30 hidden bg-black/40 lg:hidden" aria-hidden="true"></div>

<!-- Sidebar -->
<aside id="sidebar" class="fixed inset-y-3 left-3 z-40 flex w-64 -translate-x-[120%] flex-col rounded-3xl bg-white p-5 shadow-[0_20px_60px_-25px_rgba(60,50,20,.35)] transition-transform duration-300 lg:translate-x-0" aria-label="Barre latérale">
  <a href="${pageContext.request.contextPath}/admin/Dashboard" class="flex items-center gap-2 rounded-full px-1">
    <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><path d="M12 2v20M3.3 7l17.4 10M3.3 17L20.7 7"/></svg>
    <span class="text-sm font-semibold tracking-widest">CLINIC MANAGER</span>
  </a>
  <nav class="mt-8 flex-1 overflow-y-auto" aria-label="Navigation administrateur">
    <ul class="space-y-1.5">
      <li><a href="${pageContext.request.contextPath}/admin/Dashboard" aria-current="page" class="flex items-center gap-3 rounded-full bg-black px-4 py-3 text-sm font-medium text-white">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect x="3" y="3" width="7" height="9" rx="1.5"/><rect x="14" y="3" width="7" height="5" rx="1.5"/><rect x="14" y="12" width="7" height="9" rx="1.5"/><rect x="3" y="16" width="7" height="5" rx="1.5"/></svg>Dashboard</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/Patients" class="nav-link">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="9" cy="8" r="3.5"/><path d="M2.5 20a6.5 6.5 0 0 1 13 0M16 4.6a3.5 3.5 0 0 1 0 6.8M18 14.2a6.5 6.5 0 0 1 3.5 5.8"/></svg>Patients</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/Doctors" class="nav-link">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M6 3v6a4 4 0 0 0 8 0V3M4 3h4M12 3h4"/><path d="M10 13v2a5 5 0 0 0 10 0v-1"/><circle cx="20" cy="12" r="2"/></svg>Médecins</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/Specialities" class="nav-link">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M12 2l9 5-9 5-9-5 9-5z"/><path d="M3 12l9 5 9-5M3 17l9 5 9-5"/></svg>Spécialités</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/departements" class="nav-link">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M4 21V5a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v16M16 9h2a2 2 0 0 1 2 2v10M2 21h20M8 7h4M8 11h4M8 15h4"/></svg>Départements</a></li>
     </ul>
  </nav>
  <div class="mt-4 rounded-2xl bg-cream p-4">
    <div class="flex items-center gap-3">
      <span id="avatar" class="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-butter text-sm font-semibold" aria-hidden="true">A</span>
      <div class="min-w-0">
        <p id="admin-name" class="truncate text-sm font-medium">${fn:escapeXml(not empty sessionScope.user.name ? sessionScope.user.name : 'Admin')}</p>
        <p class="text-xs text-neutral-600">Administrateur</p>
      </div>
    </div>
    <form method="post" action="${pageContext.request.contextPath}/logout" class="mt-3">
      <input type="hidden" name="csrfToken" value="${fn:escapeXml(csrfToken)}">
      <button type="submit" class="w-full rounded-full border border-neutral-400 px-4 py-2.5 text-xs font-medium tracking-widest uppercase transition hover:bg-white">Déconnexion</button>
    </form>
  </div>
</aside>

<div class="px-4 py-4 sm:px-6 lg:ml-72 lg:py-6 lg:pr-6">

  <!-- En-tête -->
  <header class="fade-up flex flex-wrap items-center justify-between gap-4">
    <div class="flex items-center gap-3">
      <button id="burger" type="button" aria-label="Ouvrir le menu" aria-expanded="false" aria-controls="sidebar" class="inline-flex h-11 w-11 items-center justify-center rounded-full border border-neutral-300 bg-white lg:hidden">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><path d="M4 7h16M4 12h16M4 17h16"/></svg>
      </button>
      <div>
        <h1 class="font-serif text-4xl leading-tight tracking-tight sm:text-5xl">Tableau de bord</h1>
        <p class="text-sm text-neutral-600">Vue d'ensemble de votre clinique</p>
      </div>
    </div>
    <div class="flex flex-wrap items-center gap-3 text-sm">
      <time id="today" class="rounded-full bg-white px-4 py-2 text-neutral-700 first-letter:uppercase"></time>
      <span class="inline-flex items-center gap-2 rounded-full bg-emerald-100 px-4 py-2 text-emerald-900"><span class="h-2 w-2 rounded-full bg-emerald-600" aria-hidden="true"></span>Mis à jour à l'instant</span>
    </div>
  </header>

  <main id="contenu" class="mt-6 space-y-4">

    <!-- KPI -->
    <section aria-label="Chiffres clés" class="grid gap-4 sm:grid-cols-2 xl:grid-cols-5">
      <article class="fade-up rounded-3xl bg-yellow-100/70 p-5 transition hover:-translate-y-1" style="--d:.05s">
        <div class="flex h-11 w-11 items-center justify-center rounded-full bg-white"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="9" cy="8" r="3.5"/><path d="M2.5 20a6.5 6.5 0 0 1 13 0M16 4.6a3.5 3.5 0 0 1 0 6.8M18 14.2a6.5 6.5 0 0 1 3.5 5.8"/></svg></div>
        <p class="mt-5 font-serif text-5xl leading-none"><span data-count="${not empty totalPatients ? totalPatients : 1248}">${not empty totalPatients ? totalPatients : 1248}</span></p>
        <p class="mt-1.5 text-sm text-neutral-700">Patients</p>
        <span data-growth="${not empty patientsGrowth ? patientsGrowth : 12}" class="mt-3 inline-block rounded-full px-2.5 py-1 text-xs font-medium"></span>
      </article>
      <article class="fade-up rounded-3xl bg-sky-100/70 p-5 transition hover:-translate-y-1" style="--d:.1s">
        <div class="flex h-11 w-11 items-center justify-center rounded-full bg-white"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M6 3v6a4 4 0 0 0 8 0V3M4 3h4M12 3h4"/><path d="M10 13v2a5 5 0 0 0 10 0v-1"/><circle cx="20" cy="12" r="2"/></svg></div>
        <p class="mt-5 font-serif text-5xl leading-none"><span data-count="${not empty totalDoctors ? totalDoctors : 86}">${not empty totalDoctors ? totalDoctors : 86}</span></p>
        <p class="mt-1.5 text-sm text-neutral-700">Médecins</p>
        <span data-growth="${not empty doctorsGrowth ? doctorsGrowth : 4}" class="mt-3 inline-block rounded-full px-2.5 py-1 text-xs font-medium"></span>
      </article>
      <article class="fade-up rounded-3xl bg-violet-100/70 p-5 transition hover:-translate-y-1" style="--d:.15s">
        <div class="flex h-11 w-11 items-center justify-center rounded-full bg-white"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M12 2l9 5-9 5-9-5 9-5z"/><path d="M3 12l9 5 9-5M3 17l9 5 9-5"/></svg></div>
        <p class="mt-5 font-serif text-5xl leading-none"><span data-count="${not empty totalSpecialities ? totalSpecialities : 14}">${not empty totalSpecialities ? totalSpecialities : 14}</span></p>
        <p class="mt-1.5 text-sm text-neutral-700">Spécialités</p>
        <span data-growth="" class="mt-3 inline-block rounded-full px-2.5 py-1 text-xs font-medium"></span>
      </article>
      <article class="fade-up rounded-3xl bg-emerald-100/70 p-5 transition hover:-translate-y-1" style="--d:.2s">
        <div class="flex h-11 w-11 items-center justify-center rounded-full bg-white"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M4 21V5a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v16M16 9h2a2 2 0 0 1 2 2v10M2 21h20M8 7h4M8 11h4M8 15h4"/></svg></div>
        <p class="mt-5 font-serif text-5xl leading-none"><span data-count="${not empty totalDepartments ? totalDepartments : 9}">${not empty totalDepartments ? totalDepartments : 9}</span></p>
        <p class="mt-1.5 text-sm text-neutral-700">Départements</p>
        <span data-growth="" class="mt-3 inline-block rounded-full px-2.5 py-1 text-xs font-medium"></span>
      </article>
      <article class="fade-up rounded-3xl bg-orange-100/70 p-5 transition hover:-translate-y-1" style="--d:.25s">
        <div class="flex h-11 w-11 items-center justify-center rounded-full bg-white"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="12" cy="8" r="4"/><path d="M4 21a8 8 0 0 1 16 0"/></svg></div>
        <p class="mt-5 font-serif text-5xl leading-none"><span>${totalUsers}</span></p>
        <p class="mt-1.5 text-sm text-neutral-700">Utilisateurs</p>
        <span data-growth="" class="mt-3 inline-block rounded-full px-2.5 py-1 text-xs font-medium"></span>
      </article>
      <!-- Médecins en attente (optionnel) -->
      <article class="${not empty pendingDoctors ? '' : 'hidden'} fade-up rounded-3xl bg-rose-100/70 p-5 transition hover:-translate-y-1 sm:col-span-2 xl:col-span-5" style="--d:.3s">
        <div class="flex flex-wrap items-center gap-4">
          <div class="flex h-11 w-11 items-center justify-center rounded-full bg-white"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 2"/></svg></div>
          <p class="font-serif text-5xl leading-none"><span data-count="${not empty pendingDoctors ? pendingDoctors : 0}">${not empty pendingDoctors ? pendingDoctors : 0}</span></p>
          <p class="text-sm text-neutral-700">Médecins en attente de validation</p>
        </div>
      </article>
    </section>

    <!-- Graphiques -->
    <div class="grid gap-4 md:grid-cols-2 xl:grid-cols-12">

      <!-- Inscriptions sur 12 mois -->
      <section class="card fade-up md:col-span-2 xl:col-span-8" style="--d:.1s" aria-labelledby="t-signups">
        <div class="flex flex-wrap items-start justify-between gap-3">
          <div>
            <h2 id="t-signups" class="font-serif text-3xl leading-tight">Inscriptions sur 12 mois</h2>
            <p class="text-xs text-neutral-600">Nouveaux patients et nouveaux médecins</p>
          </div>
          <ul class="flex gap-4 text-xs text-neutral-700">
            <li class="flex items-center gap-2"><span class="h-2.5 w-2.5 rounded-full bg-amber-500" aria-hidden="true"></span>Patients</li>
            <li class="flex items-center gap-2"><span class="h-2.5 w-2.5 rounded-full bg-sky-500" aria-hidden="true"></span>Médecins</li>
          </ul>
        </div>
        <div id="chart-signups" class="mt-4 overflow-x-auto"
             data-labels="${fn:escapeXml(not empty signupLabelsJson ? signupLabelsJson : '["Nov","Déc","Jan","Fév","Mar","Avr","Mai","Juin","Juil","Août","Sep","Oct"]')}"
             data-patients="${fn:escapeXml(not empty signupPatientsJson ? signupPatientsJson : '[42,55,61,58,74,82,90,97,104,118,126,141]')}"
             data-doctors="${fn:escapeXml(not empty signupDoctorsJson ? signupDoctorsJson : '[3,4,2,5,4,6,5,7,6,8,7,9]')}"></div>
      </section>

      <!-- Répartition des utilisateurs -->
      <section class="card fade-up md:col-span-2 xl:col-span-4" style="--d:.15s" aria-labelledby="t-roles">
        <h2 id="t-roles" class="font-serif text-3xl leading-tight">Répartition des utilisateurs</h2>
        <p class="text-xs text-neutral-600">Par rôle</p>
        <div id="chart-roles" class="mt-4" data-roles="${fn:escapeXml(not empty usersByRoleJson ? usersByRoleJson : '{"Patients":1248,"Médecins":86,"Admins":3}')}"></div>
      </section>

      <!-- Médecins par spécialité -->
      <section class="card fade-up xl:col-span-6" style="--d:.2s" aria-labelledby="t-spec">
        <h2 id="t-spec" class="font-serif text-3xl leading-tight">Médecins par spécialité</h2>
        <p class="text-xs text-neutral-600">Top 6</p>
        <div id="chart-spec" class="mt-4" data-values="${fn:escapeXml(not empty doctorsBySpecialityJson ? doctorsBySpecialityJson : '{"Médecine générale":24,"Pédiatrie":15,"Cardiologie":11,"Dermatologie":9,"Gynécologie":8,"Ophtalmologie":6,"Dentisterie":4}')}"></div>
      </section>

      <!-- Médecins par département -->
      <section class="card fade-up xl:col-span-6" style="--d:.25s" aria-labelledby="t-dep">
        <h2 id="t-dep" class="font-serif text-3xl leading-tight">Médecins par département</h2>
        <p class="text-xs text-neutral-600">Top 6</p>
        <div id="chart-dep" class="mt-4" data-values="${fn:escapeXml(not empty doctorsByDepartmentJson ? doctorsByDepartmentJson : '{"Consultations":28,"Pédiatrie":16,"Cardiologie":12,"Urgences":10,"Maternité":8,"Imagerie":5,"Chirurgie":3}')}"></div>
      </section>

      <!-- Patients par genre -->
      <section class="card fade-up xl:col-span-5" style="--d:.3s" aria-labelledby="t-gender">
        <h2 id="t-gender" class="font-serif text-3xl leading-tight">Patients par genre</h2>
        <p class="text-xs text-neutral-600">Répartition Hommes / Femmes</p>
        <div id="chart-gender" class="mt-5" data-values="${fn:escapeXml(not empty patientsByGenderJson ? patientsByGenderJson : '{"HOMME":560,"FEMME":688}')}"></div>
      </section>

      <!-- Patients par groupe sanguin -->
      <section class="card fade-up xl:col-span-7" style="--d:.35s" aria-labelledby="t-blood">
        <h2 id="t-blood" class="font-serif text-3xl leading-tight">Patients par groupe sanguin</h2>
        <p class="text-xs text-neutral-600">Nombre de patients par groupe</p>
        <div id="chart-blood" class="mt-5" data-values="${fn:escapeXml(not empty patientsByBloodGroupJson ? patientsByBloodGroupJson : '{"A_POSITIF":380,"A_NEGATIF":52,"B_POSITIF":160,"B_NEGATIF":24,"AB_POSITIF":58,"AB_NEGATIF":10,"O_POSITIF":520,"O_NEGATIF":44}')}"></div>
      </section>
    </div>
  </main>

  <!-- Pied de page -->
  <footer class="mt-8 pb-2 text-center text-xs text-neutral-600">© 2026 Clinic Manager · Espace administrateur</footer>
</div>

<!-- Infobulle partagée -->
<div id="tip" role="tooltip" class="pointer-events-none fixed top-0 left-0 z-50 hidden max-w-64 rounded-xl bg-black px-3 py-2 text-xs leading-relaxed text-white shadow-lg"></div>

<script>
  (function () {
    var reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    var NF = new Intl.NumberFormat('fr-FR');
    var COLORS = ['#f5c542', '#7cc4e8', '#b8a4f0', '#7fd8b0', '#f4a98a', '#e8a0bf'];
    function $(id) { return document.getElementById(id); }
    function esc(s) {
      return String(s).replace(/[&<>"']/g, function (c) { return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c]; });
    }

    // Lecture JSON tolérante (retombe sur la démo si invalide)
    function readJson(el, attr, fallback) {
      try { var v = JSON.parse(el.getAttribute(attr)); return v == null ? fallback : v; } catch (e) { return fallback; }
    }
    function toPairs(x) {
      var out = [];
      if (Array.isArray(x)) {
        x.forEach(function (o) {
          if (o && typeof o === 'object') out.push([String(o.label != null ? o.label : o.name), Number(o.value != null ? o.value : o.count) || 0]);
        });
      } else if (x && typeof x === 'object') {
        Object.keys(x).forEach(function (k) { out.push([k, Number(x[k]) || 0]); });
      }
      return out;
    }
    function numArr(a, fb) {
      return Array.isArray(a) ? a.map(function (v) { return Number(v) || 0; }) : fb;
    }
    function emptyState(host) {
      host.innerHTML = '<div class="flex min-h-32 flex-col items-center justify-center gap-2 py-8 text-center text-sm text-neutral-600"><svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" aria-hidden="true"><path d="M4 20V10M10 20V4M16 20v-7M22 20H2"/></svg>Pas encore de données</div>';
    }

    // Infobulle
    var tip = $('tip');
    function showTip(html, x, y) {
      tip.innerHTML = html;
      tip.classList.remove('hidden');
      var w = tip.offsetWidth, h = tip.offsetHeight;
      tip.style.left = Math.min(Math.max(8, x + 14), window.innerWidth - w - 8) + 'px';
      var top = y - h - 12;
      tip.style.top = (top < 8 ? y + 18 : top) + 'px';
    }
    function hideTip() { tip.classList.add('hidden'); }
    document.addEventListener('mousemove', function (e) {
      if (e.target.closest && e.target.closest('[data-manual]')) return;
      var t = e.target.closest && e.target.closest('[data-tip]');
      if (t) showTip(t.getAttribute('data-tip'), e.clientX, e.clientY); else hideTip();
    });
    document.addEventListener('focusin', function (e) {
      var t = e.target.closest && e.target.closest('[data-tip]');
      if (t) { var r = t.getBoundingClientRect(); showTip(t.getAttribute('data-tip'), r.left + r.width / 2, r.top); }
    });
    document.addEventListener('focusout', hideTip);
    window.addEventListener('scroll', hideTip, { passive: true });

    // Date du jour et initiales
    var now = new Date();
    $('today').textContent = now.toLocaleDateString('fr-FR', { weekday: 'long', day: 'numeric', month: 'long', year: 'numeric' });
    $('today').setAttribute('datetime', now.toISOString().slice(0, 10));
    var nm = ($('admin-name').textContent || 'Admin').trim().split(/\s+/);
    $('avatar').textContent = ((nm[0] || 'A').charAt(0) + (nm[1] ? nm[1].charAt(0) : '')).toUpperCase();

    // Compteurs animés
    document.querySelectorAll('[data-count]').forEach(function (n) {
      var target = Number(n.getAttribute('data-count')) || 0;
      if (reduce) { n.textContent = NF.format(target); return; }
      var start = null;
      function step(t) {
        if (start === null) start = t;
        var p = Math.min((t - start) / 1200, 1);
        n.textContent = NF.format(Math.round(target * (1 - Math.pow(1 - p, 3))));
        if (p < 1) requestAnimationFrame(step);
      }
      requestAnimationFrame(step);
    });

    // Pastilles de variation
    document.querySelectorAll('[data-growth]').forEach(function (p) {
      var raw = p.getAttribute('data-growth');
      var v = raw === '' ? NaN : parseFloat(raw);
      if (isNaN(v)) { p.className += ' bg-white/80 text-neutral-700'; p.textContent = 'Total actuel'; return; }
      var cls = v > 0 ? 'bg-emerald-100 text-emerald-800' : v < 0 ? 'bg-rose-100 text-rose-800' : 'bg-white/80 text-neutral-700';
      p.className += ' ' + cls;
      p.textContent = v === 0 ? 'Stable ce mois-ci' : (v > 0 ? '+' : '−') + NF.format(Math.abs(v)) + ' % ce mois-ci';
    });

    // Graphique : inscriptions (aire lissée)
    function niceMax(v) {
      if (v <= 0) return 10;
      var p = Math.pow(10, Math.floor(Math.log10(v))), m = v / p, s = [1, 1.5, 2, 2.5, 3, 4, 5, 6, 8, 10];
      for (var i = 0; i < s.length; i++) if (m <= s[i]) return s[i] * p;
      return 10 * p;
    }
    function curve(pts) {
      var d = 'M' + pts[0][0] + ',' + pts[0][1];
      for (var i = 0; i < pts.length - 1; i++) {
        var p0 = pts[i - 1] || pts[i], p1 = pts[i], p2 = pts[i + 1], p3 = pts[i + 2] || p2;
        d += ' C' + (p1[0] + (p2[0] - p0[0]) / 6) + ',' + (p1[1] + (p2[1] - p0[1]) / 6) + ' ' +
                (p2[0] - (p3[0] - p1[0]) / 6) + ',' + (p2[1] - (p3[1] - p1[1]) / 6) + ' ' + p2[0] + ',' + p2[1];
      }
      return d;
    }
    function drawSignups() {
      var host = $('chart-signups');
      var labels = readJson(host, 'data-labels', []);
      var P = numArr(readJson(host, 'data-patients', []), []);
      var D = numArr(readJson(host, 'data-doctors', []), []);
      var n = Math.min(Array.isArray(labels) ? labels.length : 0, P.length, D.length);
      var sum = 0; for (var k = 0; k < n; k++) sum += P[k] + D[k];
      if (n < 2 || !sum) { emptyState(host); return; }
      var W = 640, H = 260, L = 40, R = 16, T = 16, B = 32;
      var max = niceMax(Math.max.apply(null, P.slice(0, n).concat(D.slice(0, n))));
      var X = function (i) { return L + i * (W - L - R) / (n - 1); };
      var Y = function (v) { return T + (H - T - B) * (1 - v / max); };
      var pp = [], dp = [];
      for (var i = 0; i < n; i++) { pp.push([X(i), Y(P[i])]); dp.push([X(i), Y(D[i])]); }
      var area = function (pts) { return curve(pts) + ' L' + X(n - 1) + ',' + (H - B) + ' L' + X(0) + ',' + (H - B) + ' Z'; };
      var s = '<svg viewBox="0 0 ' + W + ' ' + H + '" class="w-full min-w-[520px] touch-pan-y" role="img" aria-label="' +
              esc('Inscriptions sur ' + n + ' mois : ' + NF.format(P.slice(0, n).reduce(function (a, b) { return a + b; }, 0)) + ' patients et ' +
                      NF.format(D.slice(0, n).reduce(function (a, b) { return a + b; }, 0)) + ' médecins au total. Dernier mois, ' + labels[n - 1] + ' : ' +
                      P[n - 1] + ' patients et ' + D[n - 1] + ' médecins.') + '">' +
              '<defs><linearGradient id="gp" x1="0" y1="0" x2="0" y2="1"><stop offset="0" stop-color="#f5c542" stop-opacity=".5"/><stop offset="1" stop-color="#f5c542" stop-opacity="0"/></linearGradient>' +
              '<linearGradient id="gd" x1="0" y1="0" x2="0" y2="1"><stop offset="0" stop-color="#7cc4e8" stop-opacity=".5"/><stop offset="1" stop-color="#7cc4e8" stop-opacity="0"/></linearGradient></defs>';
      for (var g = 0; g <= 4; g++) {
        var gv = max * g / 4, gy = Y(gv);
        s += '<line x1="' + L + '" x2="' + (W - R) + '" y1="' + gy + '" y2="' + gy + '" stroke="#e5e5e5" stroke-width="1"/>' +
                '<text x="' + (L - 8) + '" y="' + (gy + 4) + '" text-anchor="end" font-size="11" fill="#525252">' + NF.format(Math.round(gv)) + '</text>';
      }
      for (var j = 0; j < n; j++) {
        s += '<text x="' + X(j) + '" y="' + (H - 10) + '" text-anchor="middle" font-size="11" fill="#525252">' + esc(labels[j]) + '</text>';
      }
      s += '<path d="' + area(dp) + '" fill="url(#gd)"/><path d="' + curve(dp) + '" fill="none" stroke="#3b92c4" stroke-width="2.5" stroke-linecap="round"/>' +
              '<path d="' + area(pp) + '" fill="url(#gp)"/><path d="' + curve(pp) + '" fill="none" stroke="#c28a00" stroke-width="2.5" stroke-linecap="round"/>' +
              '<line id="sg-line" y1="' + T + '" y2="' + (H - B) + '" stroke="#a3a3a3" stroke-dasharray="3 4" opacity="0"/>' +
              '<circle id="sg-cp" r="5" fill="#fff" stroke="#c28a00" stroke-width="2.5" opacity="0"/>' +
              '<circle id="sg-cd" r="5" fill="#fff" stroke="#3b92c4" stroke-width="2.5" opacity="0"/>' +
              '<rect data-manual x="' + L + '" y="' + T + '" width="' + (W - L - R) + '" height="' + (H - T - B) + '" fill="transparent"/></svg>';
      host.innerHTML = s;
      var svg = host.querySelector('svg'), line = $('sg-line'), cp = $('sg-cp'), cd = $('sg-cd');
      function mark(o) { line.setAttribute('opacity', o); cp.setAttribute('opacity', o); cd.setAttribute('opacity', o); }
      svg.addEventListener('pointermove', function (e) {
        var r = svg.getBoundingClientRect();
        var xv = (e.clientX - r.left) * W / r.width;
        var idx = Math.max(0, Math.min(n - 1, Math.round((xv - L) / ((W - L - R) / (n - 1)))));
        line.setAttribute('x1', X(idx)); line.setAttribute('x2', X(idx));
        cp.setAttribute('cx', X(idx)); cp.setAttribute('cy', Y(P[idx]));
        cd.setAttribute('cx', X(idx)); cd.setAttribute('cy', Y(D[idx]));
        mark(1);
        showTip('<strong>' + esc(labels[idx]) + '</strong><br>Patients : ' + NF.format(P[idx]) + '<br>Médecins : ' + NF.format(D[idx]), e.clientX, e.clientY);
      });
      svg.addEventListener('pointerleave', function () { mark(0); hideTip(); });
    }

    // Graphique : anneau des rôles
    function drawRoles() {
      var host = $('chart-roles');
      var pairs = toPairs(readJson(host, 'data-roles', []));
      var total = pairs.reduce(function (a, p) { return a + p[1]; }, 0);
      if (!total) { emptyState(host); return; }
      var r = 70, C = 2 * Math.PI * r, off = 0;
      var s = '<svg viewBox="0 0 200 200" class="mx-auto h-48 w-48" aria-hidden="true"><circle cx="100" cy="100" r="' + r + '" fill="none" stroke="#f3f0e6" stroke-width="26"/>';
      pairs.forEach(function (p, i) {
        var len = C * p[1] / total, gap = pairs.length > 1 && p[1] > 0 ? 2 : 0;
        var pct = Math.round(p[1] * 100 / total);
        s += '<circle cx="100" cy="100" r="' + r + '" fill="none" stroke="' + COLORS[i % COLORS.length] + '" stroke-width="26" stroke-dasharray="' + Math.max(len - gap, 0) + ' ' + (C - Math.max(len - gap, 0)) + '" stroke-dashoffset="' + (-off) + '" transform="rotate(-90 100 100)" tabindex="0" data-tip="' +
                esc('<strong>' + esc(p[0]) + '</strong><br>' + NF.format(p[1]) + ' (' + pct + ' %)') + '" class="transition-opacity hover:opacity-80"/>';
        off += len;
      });
      s += '<text x="100" y="104" text-anchor="middle" font-size="32" font-family="Instrument Serif, Georgia, serif" fill="#171717">' + NF.format(total) + '</text>' +
              '<text x="100" y="124" text-anchor="middle" font-size="10" fill="#525252">utilisateurs</text></svg><ul class="mt-4 space-y-2 text-sm">';
      pairs.forEach(function (p, i) {
        s += '<li class="flex items-center justify-between gap-3"><span class="flex items-center gap-2"><span class="h-2.5 w-2.5 rounded-full" style="background:' + COLORS[i % COLORS.length] + '" aria-hidden="true"></span>' + esc(p[0]) +
                '</span><span class="text-neutral-700">' + NF.format(p[1]) + ' · ' + Math.round(p[1] * 100 / total) + ' %</span></li>';
      });
      host.innerHTML = s + '</ul>';
      host.setAttribute('role', 'group');
      host.setAttribute('aria-label', 'Répartition des utilisateurs : ' + pairs.map(function (p) { return p[0] + ' ' + p[1]; }).join(', '));
    }

    // Graphique : barres horizontales (top 6)
    function drawBars(id, color) {
      var host = $(id);
      var pairs = toPairs(readJson(host, 'data-values', [])).sort(function (a, b) { return b[1] - a[1]; }).slice(0, 6);
      var max = pairs.length ? pairs[0][1] : 0;
      if (!max) { emptyState(host); return; }
      var s = '<ul class="space-y-4">';
      pairs.forEach(function (p) {
        s += '<li tabindex="0" data-tip="' + esc('<strong>' + esc(p[0]) + '</strong><br>' + NF.format(p[1]) + ' médecin' + (p[1] > 1 ? 's' : '')) + '" class="rounded-lg">' +
                '<div class="mb-1.5 flex justify-between gap-3 text-sm"><span>' + esc(p[0]) + '</span><span class="font-medium">' + NF.format(p[1]) + '</span></div>' +
                '<div class="h-2.5 rounded-full bg-neutral-100"><div data-w="' + (p[1] * 100 / max) + '" class="h-full w-0 rounded-full transition-[width] duration-700" style="background:' + color + '"></div></div></li>';
      });
      host.innerHTML = s + '</ul>';
      requestAnimationFrame(function () {
        host.querySelectorAll('[data-w]').forEach(function (b) { b.style.width = b.getAttribute('data-w') + '%'; });
      });
    }

    // Graphique : genre
    function drawGender() {
      var host = $('chart-gender');
      var pairs = toPairs(readJson(host, 'data-values', []));
      var h = 0, f = 0;
      pairs.forEach(function (p) {
        var k = p[0].toUpperCase();
        if (k === 'HOMME') h += p[1]; else if (k === 'FEMME') f += p[1];
      });
      var total = h + f;
      if (!total) { emptyState(host); return; }
      var ph = Math.round(h * 100 / total), pf = 100 - ph;
      host.innerHTML =
              '<div class="flex h-6 overflow-hidden rounded-full bg-neutral-100">' +
              '<div tabindex="0" data-tip="' + esc('<strong>Hommes</strong><br>' + NF.format(h) + ' (' + ph + ' %)') + '" class="h-full w-0 bg-sky-300 transition-[width] duration-700" data-w="' + ph + '"></div>' +
              '<div tabindex="0" data-tip="' + esc('<strong>Femmes</strong><br>' + NF.format(f) + ' (' + pf + ' %)') + '" class="h-full w-0 bg-rose-300 transition-[width] duration-700" data-w="' + pf + '"></div>' +
              '</div>' +
              '<div class="mt-5 grid grid-cols-2 gap-4">' +
              '<div><p class="flex items-center gap-2 text-sm text-neutral-700"><span class="h-2.5 w-2.5 rounded-full bg-sky-300" aria-hidden="true"></span>Hommes</p><p class="mt-1 font-serif text-4xl leading-none">' + ph + ' %</p><p class="mt-1 text-xs text-neutral-600">' + NF.format(h) + ' patients</p></div>' +
              '<div><p class="flex items-center gap-2 text-sm text-neutral-700"><span class="h-2.5 w-2.5 rounded-full bg-rose-300" aria-hidden="true"></span>Femmes</p><p class="mt-1 font-serif text-4xl leading-none">' + pf + ' %</p><p class="mt-1 text-xs text-neutral-600">' + NF.format(f) + ' patients</p></div>' +
              '</div>';
      requestAnimationFrame(function () {
        host.querySelectorAll('[data-w]').forEach(function (b) { b.style.width = b.getAttribute('data-w') + '%'; });
      });
    }

    // Graphique : groupes sanguins
    function drawBlood() {
      var host = $('chart-blood');
      var order = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'], map = {};
      toPairs(readJson(host, 'data-values', [])).forEach(function (p) {
        map[p[0].toUpperCase().replace('POSITIF', '+').replace('NEGATIF', '-').replace('_', '')] = p[1];
      });
      var vals = order.map(function (k) { return map[k] || 0; });
      var max = Math.max.apply(null, vals);
      if (!max) { emptyState(host); return; }
      var s = '<div class="flex h-44 items-end justify-between gap-2" role="group" aria-label="Patients par groupe sanguin : ' + esc(order.map(function (k, i) { return k + ' ' + vals[i]; }).join(', ')) + '">';
      order.forEach(function (k, i) {
        s += '<div class="flex h-full flex-1 flex-col items-center justify-end gap-2">' +
                '<span class="text-xs font-medium text-neutral-700">' + NF.format(vals[i]) + '</span>' +
                '<div class="flex w-full flex-1 items-end justify-center"><div tabindex="0" data-tip="' + esc('<strong>' + k + '</strong><br>' + NF.format(vals[i]) + ' patient' + (vals[i] > 1 ? 's' : '')) +
                '" data-h="' + Math.max(vals[i] * 100 / max, vals[i] ? 4 : 1) + '" class="h-0 w-3 rounded-full bg-orange-300 transition-[height] duration-700 hover:bg-orange-400 sm:w-4"></div></div>' +
                '<span class="text-xs text-neutral-700">' + k + '</span></div>';
      });
      host.innerHTML = s + '</div>';
      requestAnimationFrame(function () {
        host.querySelectorAll('[data-h]').forEach(function (b) { b.style.height = b.getAttribute('data-h') + '%'; });
      });
    }

    drawSignups(); drawRoles(); drawBars('chart-spec', '#b8a4f0'); drawBars('chart-dep', '#7fd8b0'); drawGender(); drawBlood();

    // Tiroir mobile
    var sb = $('sidebar'), ov = $('overlay'), bg = $('burger');
    var mq = window.matchMedia('(min-width: 1024px)');
    var open = false;
    function sync() { sb.inert = !mq.matches && !open; }
    function setOpen(o) {
      open = o;
      sb.classList.toggle('-translate-x-[120%]', !o);
      ov.classList.toggle('hidden', !o);
      document.body.classList.toggle('overflow-hidden', o && !mq.matches);
      bg.setAttribute('aria-expanded', String(o));
      bg.setAttribute('aria-label', o ? 'Fermer le menu' : 'Ouvrir le menu');
      sync();
      if (o) { var a = sb.querySelector('a'); if (a) a.focus(); } else if (!mq.matches) { bg.focus(); }
    }
    bg.addEventListener('click', function () { setOpen(!open); });
    ov.addEventListener('click', function () { setOpen(false); });
    document.addEventListener('keydown', function (e) { if (e.key === 'Escape' && open) setOpen(false); });
    var onChange = function () { if (mq.matches && open) setOpen(false); sync(); };
    if (mq.addEventListener) mq.addEventListener('change', onChange); else mq.addListener(onChange);
    sync();
  })();
</script>
</body>
</html>