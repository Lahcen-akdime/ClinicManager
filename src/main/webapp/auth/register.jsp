<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Créer un compte — Clinic Manager</title>
  <meta name="description" content="Créez votre compte Clinic Manager en trois étapes : plannings médicaux, rendez-vous sans conflit et notes médicales sécurisées.">
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
      .field { @apply w-full rounded-xl border border-neutral-300 bg-white px-4 py-3 text-sm outline-none transition focus:border-black focus:ring-4 focus:ring-black/10 aria-[invalid=true]:border-rose-500; }
      .lbl { @apply mb-1.5 block text-xs font-medium text-neutral-700; }
      .err { @apply mt-1 min-h-4 text-xs text-rose-700; }
      .btn-dark { @apply inline-flex items-center justify-center gap-2 rounded-full bg-black px-7 py-3.5 text-xs font-medium tracking-widest text-white uppercase transition hover:bg-neutral-800 disabled:cursor-not-allowed disabled:opacity-40; }
      .btn-line { @apply inline-flex items-center justify-center rounded-full border border-neutral-400 px-7 py-3.5 text-xs font-medium tracking-widest uppercase transition hover:bg-neutral-100; }
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
    @keyframes in-fwd { from { opacity:0; transform:translateX(24px); } to { opacity:1; transform:none; } }
    @keyframes in-back { from { opacity:0; transform:translateX(-24px); } to { opacity:1; transform:none; } }
    .in-fwd { animation: in-fwd .45s ease both; }
    .in-back { animation: in-back .45s ease both; }
    @media (prefers-reduced-motion: reduce) {
      .in-fwd, .in-back { animation: none; }
      * { transition-duration: .01ms !important; }
    }
  </style>
</head>
<body class="font-sans text-neutral-900 antialiased">
<a href="#contenu" class="sr-only focus:not-sr-only focus:fixed focus:top-3 focus:left-3 focus:z-50 focus:rounded-full focus:bg-black focus:px-4 focus:py-2 focus:text-white">Aller au formulaire</a>

<div class="mx-auto my-3 max-w-6xl overflow-hidden rounded-3xl bg-white shadow-[0_30px_80px_-30px_rgba(60,50,20,.25)] sm:my-8">

  <!-- Navbar minimale -->
  <header class="px-5 py-5 sm:px-10">
    <nav class="flex items-center justify-between gap-4" aria-label="Navigation principale">
      <a href="${pageContext.request.contextPath}/index.jsp" class="flex items-center gap-2 rounded-full">
        <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><path d="M12 2v20M3.3 7l17.4 10M3.3 17L20.7 7"/></svg>
        <span class="text-sm font-semibold tracking-widest">CLINIC MANAGER</span>
      </a>
      <div class="flex items-center gap-3">
        <a href="${pageContext.request.contextPath}/index.jsp" class="text-sm text-neutral-600 underline-offset-4 hover:text-black hover:underline">Retour à l'accueil</a>
        <a href="${pageContext.request.contextPath}/login.jsp" class="rounded-full border border-neutral-300 px-5 py-2.5 text-sm font-medium hover:bg-neutral-100">Login</a>
      </div>
    </nav>
  </header>

  <main id="contenu" class="grid gap-8 px-5 pb-8 sm:px-10 sm:pb-10 lg:grid-cols-2 lg:gap-12">

    <!-- Colonne formulaire -->
    <section class="py-2" aria-labelledby="titre-page">
      <h1 id="titre-page" class="sr-only">Inscription à Clinic Manager</h1>

      <!-- Bandeaux serveur -->
      <div role="alert" class="${empty error ? 'hidden' : 'flex'} mb-5 items-start gap-3 rounded-2xl bg-rose-50 p-4 text-sm text-rose-800">
        <svg class="mt-0.5 shrink-0" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><circle cx="12" cy="12" r="10"/><path d="M12 8v4M12 16h.01"/></svg>
        <p><c:out value="${error}"/></p>
      </div>
      <div role="status" class="${empty success ? 'hidden' : 'flex'} mb-5 items-start gap-3 rounded-2xl bg-emerald-50 p-4 text-sm text-emerald-900">
        <svg class="mt-0.5 shrink-0" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="12" cy="12" r="10"/><path d="M8 12.5l2.7 2.7L16 9.5"/></svg>
        <p><c:out value="${success}"/></p>
      </div>

      <!-- Progression -->
      <div class="mb-8">
        <p id="step-label" class="mb-3 text-xs font-medium text-neutral-600" aria-live="polite">Étape 1 sur 3</p>
        <ol class="flex items-center" aria-hidden="true">
          <li class="flex flex-1 items-center">
            <span data-dot="1" class="flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-black text-xs font-medium text-white"><span data-num>1</span><svg data-check class="hidden" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12.5l4.5 4.5L19 7.5"/></svg></span>
            <span class="mx-2 h-0.5 flex-1 rounded bg-neutral-200"><span data-line="1" class="block h-full w-0 rounded bg-emerald-300 transition-all duration-500"></span></span>
          </li>
          <li class="flex flex-1 items-center">
            <span data-dot="2" class="flex h-8 w-8 shrink-0 items-center justify-center rounded-full border border-neutral-300 text-xs font-medium text-neutral-500"><span data-num>2</span><svg data-check class="hidden" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12.5l4.5 4.5L19 7.5"/></svg></span>
            <span class="mx-2 h-0.5 flex-1 rounded bg-neutral-200"><span data-line="2" class="block h-full w-0 rounded bg-emerald-300 transition-all duration-500"></span></span>
          </li>
          <li class="flex items-center">
            <span data-dot="3" class="flex h-8 w-8 shrink-0 items-center justify-center rounded-full border border-neutral-300 text-xs font-medium text-neutral-500"><span data-num>3</span><svg data-check class="hidden" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12.5l4.5 4.5L19 7.5"/></svg></span>
          </li>
        </ol>
      </div>

      <!-- Formulaire unique -->
      <form id="register-form" method="post" action="register" novalidate data-initial-role="<c:out value='${param.role}'/>">
        <input type="hidden" name="csrfToken" value="<c:out value='${csrfToken}'/>">
        <input type="hidden" name="role" id="role" value="">

        <!-- Étape 1 -->
        <div data-panel="1">
          <h2 tabindex="-1" class="font-serif text-4xl leading-tight tracking-tight sm:text-5xl">Créons votre compte</h2>
          <p class="mt-3 max-w-sm text-sm text-neutral-600">Quelques informations suffisent pour commencer.</p>
          <div class="mt-6 grid gap-x-4 sm:grid-cols-2">
            <div>
              <label for="name" class="lbl">Prénom</label>
              <input id="name" name="name" type="text" autocomplete="given-name" class="field" aria-describedby="err-name" value="<c:out value='${param.name}'/>">
              <p id="err-name" class="err" aria-live="polite"></p>
            </div>
            <div>
              <label for="lastName" class="lbl">Nom</label>
              <input id="lastName" name="lastName" type="text" autocomplete="family-name" class="field" aria-describedby="err-lastName" value="<c:out value='${param.lastName}'/>">
              <p id="err-lastName" class="err" aria-live="polite"></p>
            </div>
          </div>
          <div>
            <label for="email" class="lbl">Adresse e-mail</label>
            <input id="email" name="email" type="email" autocomplete="email" class="field" aria-describedby="err-email" value="<c:out value='${param.email}'/>">
            <p id="err-email" class="err" aria-live="polite"></p>
          </div>
          <div>
            <label for="password" class="lbl">Mot de passe</label>
            <div class="relative">
              <input id="password" name="password" type="password" autocomplete="new-password" class="field pr-12" aria-describedby="err-password pw-hint">
              <button type="button" id="toggle-pw" aria-label="Afficher le mot de passe" aria-pressed="false" class="absolute top-1/2 right-3 -translate-y-1/2 rounded-full p-1.5 text-neutral-600 hover:text-black">
                <svg id="eye-on" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M2 12s3.6-7 10-7 10 7 10 7-3.6 7-10 7S2 12 2 12z"/><circle cx="12" cy="12" r="3"/></svg>
                <svg id="eye-off" class="hidden" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M3 3l18 18M10.6 5.1A10 10 0 0 1 12 5c6.4 0 10 7 10 7a17 17 0 0 1-3.2 4M6.6 6.6A17 17 0 0 0 2 12s3.6 7 10 7a10 10 0 0 0 4.4-1M9.9 9.9a3 3 0 0 0 4.2 4.2"/></svg>
              </button>
            </div>
            <div class="mt-2 grid grid-cols-4 gap-1.5" aria-hidden="true">
              <span data-seg class="h-1.5 rounded-full bg-neutral-200 transition-colors"></span>
              <span data-seg class="h-1.5 rounded-full bg-neutral-200 transition-colors"></span>
              <span data-seg class="h-1.5 rounded-full bg-neutral-200 transition-colors"></span>
              <span data-seg class="h-1.5 rounded-full bg-neutral-200 transition-colors"></span>
            </div>
            <p id="pw-hint" class="mt-1.5 text-xs text-neutral-600">8 caractères minimum, avec une majuscule, une minuscule et un chiffre. <span id="pw-strength" class="font-medium"></span></p>
            <p id="err-password" class="err" aria-live="polite"></p>
          </div>
          <div>
            <label for="confirmPassword" class="lbl">Confirmer le mot de passe</label>
            <input id="confirmPassword" name="confirmPassword" type="password" autocomplete="new-password" class="field" aria-describedby="err-confirmPassword">
            <p id="err-confirmPassword" class="err" aria-live="polite"></p>
          </div>
          <div class="mt-4 flex flex-wrap items-center gap-3">
            <button type="button" class="btn-dark" data-next>Continuer</button>
          </div>
        </div>

        <!-- Étape 2 -->
        <div data-panel="2" class="hidden">
          <h2 tabindex="-1" class="font-serif text-4xl leading-tight tracking-tight sm:text-5xl">Vous êtes ?</h2>
          <p class="mt-3 max-w-sm text-sm text-neutral-600">Votre espace s'adapte à votre rôle.</p>
          <div id="role-group" role="radiogroup" aria-label="Choisissez votre rôle" aria-describedby="err-role" class="mt-6 grid gap-4 sm:grid-cols-2">
            <button type="button" role="radio" aria-checked="false" tabindex="0" data-role="DOCTOR" class="group relative rounded-3xl border border-neutral-300 p-5 text-left transition hover:-translate-y-0.5 hover:bg-butter/40 hover:shadow-md">
              <span data-tick class="absolute top-4 right-4 hidden h-6 w-6 items-center justify-center rounded-full bg-black text-white"><svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 12.5l4.5 4.5L19 7.5"/></svg></span>
              <svg width="36" height="36" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M6 3v6a4 4 0 0 0 8 0V3M4 3h4M12 3h4"/><path d="M10 13v2a5 5 0 0 0 10 0v-1"/><circle cx="20" cy="12" r="2"/></svg>
              <span class="mt-4 block font-serif text-2xl">Médecin</span>
              <span class="mt-1 block text-sm leading-relaxed text-neutral-600">Gérez votre planning, vos rendez-vous et vos notes médicales</span>
            </button>
            <button type="button" role="radio" aria-checked="false" tabindex="-1" data-role="PATIENT" class="group relative rounded-3xl border border-neutral-300 p-5 text-left transition hover:-translate-y-0.5 hover:bg-butter/40 hover:shadow-md">
              <span data-tick class="absolute top-4 right-4 hidden h-6 w-6 items-center justify-center rounded-full bg-black text-white"><svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M5 12.5l4.5 4.5L19 7.5"/></svg></span>
              <svg width="36" height="36" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.6" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M12 21s-7-4.4-7-10a4 4 0 0 1 7-2.6A4 4 0 0 1 19 11c0 5.6-7 10-7 10z"/></svg>
              <span class="mt-4 block font-serif text-2xl">Patient</span>
              <span class="mt-1 block text-sm leading-relaxed text-neutral-600">Prenez rendez-vous et suivez votre parcours de soin</span>
            </button>
          </div>
          <p id="err-role" class="err" aria-live="polite"></p>
          <div class="mt-4 flex flex-wrap items-center gap-3">
            <button type="button" class="btn-line" data-prev>Retour</button>
            <button type="button" class="btn-dark" id="role-next" data-next disabled>Continuer</button>
          </div>
        </div>

        <!-- Étape 3 -->
        <div data-panel="3" class="hidden">

          <!-- Bloc patient -->
          <fieldset id="block-patient" class="hidden min-w-0 border-0 p-0" disabled>
            <legend class="p-0"><span tabindex="-1" class="block font-serif text-4xl leading-tight tracking-tight sm:text-5xl" data-title>Complétons votre dossier patient</span></legend>
            <div class="mt-6 grid gap-x-4 sm:grid-cols-2">
              <div>
                <label for="phone" class="lbl">Téléphone</label>
                <input id="phone" name="phone" type="tel" autocomplete="tel" placeholder="06 12 34 56 78" class="field" aria-describedby="err-phone" value="<c:out value='${param.phone}'/>">
                <p id="err-phone" class="err" aria-live="polite"></p>
              </div>
              <div>
                <label for="cin" class="lbl">CIN</label>
                <input id="cin" name="cin" type="text" autocomplete="off" placeholder="AB123456" class="field" aria-describedby="err-cin" value="<c:out value='${param.cin}'/>">
                <p id="err-cin" class="err" aria-live="polite"></p>
              </div>
              <div>
                <label for="dateNaissance" class="lbl">Date de naissance</label>
                <input id="dateNaissance" name="dateNaissance" type="date" autocomplete="bday" class="field" aria-describedby="err-dateNaissance" value="<c:out value='${param.dateNaissance}'/>">
                <p id="err-dateNaissance" class="err" aria-live="polite"></p>
              </div>
              <div>
                <label for="groupeSanguin" class="lbl">Groupe sanguin</label>
                <select id="groupeSanguin" name="groupeSanguin" class="field" aria-describedby="err-groupeSanguin">
                  <option value="">Choisir…</option>
                  <option value="A_POSITIF" ${param.groupeSanguin == 'A_POSITIF' ? 'selected' : ''}>A+</option>
                  <option value="A_NEGATIF" ${param.groupeSanguin == 'A_NEGATIF' ? 'selected' : ''}>A-</option>
                  <option value="B_POSITIF" ${param.groupeSanguin == 'B_POSITIF' ? 'selected' : ''}>B+</option>
                  <option value="B_NEGATIF" ${param.groupeSanguin == 'B_NEGATIF' ? 'selected' : ''}>B-</option>
                  <option value="AB_POSITIF" ${param.groupeSanguin == 'AB_POSITIF' ? 'selected' : ''}>AB+</option>
                  <option value="AB_NEGATIF" ${param.groupeSanguin == 'AB_NEGATIF' ? 'selected' : ''}>AB-</option>
                  <option value="O_POSITIF" ${param.groupeSanguin == 'O_POSITIF' ? 'selected' : ''}>O+</option>
                  <option value="O_NEGATIF" ${param.groupeSanguin == 'O_NEGATIF' ? 'selected' : ''}>O-</option>
                </select>
                <p id="err-groupeSanguin" class="err" aria-live="polite"></p>
              </div>
            </div>
            <div role="radiogroup" aria-labelledby="genre-label" aria-describedby="err-genre">
              <span id="genre-label" class="lbl">Genre</span>
              <div class="flex flex-wrap gap-3">
                <label class="cursor-pointer">
                  <input type="radio" name="genre" value="HOMME" class="peer sr-only" ${param.genre == 'HOMME' ? 'checked' : ''}>
                  <span class="inline-block rounded-full border border-neutral-300 px-6 py-2.5 text-sm transition peer-checked:border-black peer-checked:bg-black peer-checked:text-white peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-black hover:bg-neutral-100 peer-checked:hover:bg-black">Homme</span>
                </label>
                <label class="cursor-pointer">
                  <input type="radio" name="genre" value="FEMME" class="peer sr-only" ${param.genre == 'FEMME' ? 'checked' : ''}>
                  <span class="inline-block rounded-full border border-neutral-300 px-6 py-2.5 text-sm transition peer-checked:border-black peer-checked:bg-black peer-checked:text-white peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-black hover:bg-neutral-100 peer-checked:hover:bg-black">Femme</span>
                </label>
              </div>
              <p id="err-genre" class="err" aria-live="polite"></p>
            </div>
            <div>
              <label for="adresse" class="lbl">Adresse</label>
              <input id="adresse" name="adresse" type="text" autocomplete="street-address" class="field" aria-describedby="err-adresse" value="<c:out value='${param.adresse}'/>">
              <p id="err-adresse" class="err" aria-live="polite"></p>
            </div>
          </fieldset>

          <!-- Bloc médecin -->
          <fieldset id="block-doctor" class="hidden min-w-0 border-0 p-0" disabled>
            <legend class="p-0"><span tabindex="-1" class="block font-serif text-4xl leading-tight tracking-tight sm:text-5xl" data-title>Complétons votre profil médecin</span></legend>
            <div class="mt-6 grid gap-x-4 sm:grid-cols-2">
              <div>
                <label for="matricule" class="lbl">Matricule</label>
                <input id="matricule" name="matricule" type="text" autocomplete="off" class="field" aria-describedby="err-matricule" value="<c:out value='${param.matricule}'/>">
                <p id="err-matricule" class="err" aria-live="polite"></p>
              </div>
              <div>
                <label for="titre" class="lbl">Titre / spécialité</label>
                <input id="titre" name="titre" type="text" list="titres" autocomplete="off" class="field" aria-describedby="err-titre" value="<c:out value='${param.titre}'/>">
                <datalist id="titres">
                  <option value="Médecin généraliste"></option>
                  <option value="Pédiatre"></option>
                  <option value="Cardiologue"></option>
                  <option value="Dermatologue"></option>
                  <option value="Gynécologue"></option>
                  <option value="Ophtalmologue"></option>
                  <option value="Dentiste"></option>
                </datalist>
                <p id="err-titre" class="err" aria-live="polite"></p>
              </div>
            </div>
            <p class="flex items-start gap-2 rounded-2xl bg-butter/60 p-4 text-xs leading-relaxed text-neutral-700">
              <svg class="mt-0.5 shrink-0" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><circle cx="12" cy="12" r="10"/><path d="M12 16v-4M12 8h.01"/></svg>
              Votre compte médecin pourra être vérifié par notre équipe avant activation.
            </p>
          </fieldset>

          <!-- Conditions -->
          <div class="mt-5">
            <label class="flex cursor-pointer items-start gap-3 text-sm text-neutral-700">
              <input id="terms" name="terms" type="checkbox" value="on" class="mt-0.5 h-5 w-5 shrink-0 rounded border-neutral-400 accent-black" aria-describedby="err-terms" ${not empty param.terms ? 'checked' : ''}>
              <span>J'accepte les conditions d'utilisation et la politique de confidentialité</span>
            </label>
            <p id="err-terms" class="err" aria-live="polite"></p>
          </div>

          <div class="mt-4 flex flex-wrap items-center gap-3">
            <button type="button" class="btn-line" data-prev>Retour</button>
            <button type="submit" id="submit-btn" class="btn-dark">Créer mon compte</button>
          </div>
        </div>

        <p class="mt-8 text-sm text-neutral-600">Déjà un compte ? <a href="${pageContext.request.contextPath}/login.jsp" class="font-medium text-black underline underline-offset-4">Login</a></p>
      </form>
    </section>

    <!-- Colonne visuelle (desktop) -->
    <aside class="relative hidden overflow-hidden rounded-3xl bg-amber-100 lg:block" aria-label="Présentation">
      <img src="https://wallpapercave.com/wp/wp12475770.jpg" width="800" height="1000" alt="Médecin souriant avec stéthoscope tenant un presse-papier, accompagnée d'une mère et de sa petite fille" class="absolute inset-0 h-full w-full bg-amber-100 object-cover">
      <div class="absolute inset-0 bg-linear-to-t from-black/75 via-black/10 to-transparent"></div>
      <div class="absolute top-5 left-5 rounded-2xl bg-butter/90 px-4 py-3 backdrop-blur">
        <p class="font-serif text-3xl leading-none">2148</p>
        <p class="mt-1 text-xs text-neutral-800">patients nous font confiance</p>
      </div>
      <p class="absolute inset-x-0 bottom-0 p-8 font-serif text-4xl leading-tight text-white">Chaque rendez-vous, sans conflit.</p>
    </aside>
  </main>
</div>

<script>
  (function () {
    var reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    var form = document.getElementById('register-form');
    var panels = form.querySelectorAll('[data-panel]');
    var roleInput = document.getElementById('role');
    var roleBtns = form.querySelectorAll('[data-role]');
    var roleNext = document.getElementById('role-next');
    var blockPatient = document.getElementById('block-patient');
    var blockDoctor = document.getElementById('block-doctor');
    var current = 1;
    var firstBad = null;

    function $(id) { return document.getElementById(id); }
    function val(id) { return ($(id).value || '').trim(); }

    // Erreurs
    function setErr(id, msg) {
      var e = $('err-' + id), f = $(id);
      e.textContent = msg || '';
      if (f) { if (msg) f.setAttribute('aria-invalid', 'true'); else f.removeAttribute('aria-invalid'); }
      if (msg && !firstBad) firstBad = f || e;
      return !msg;
    }

    // Date max = aujourd'hui
    var t = new Date();
    var pad = function (n) { return (n < 10 ? '0' : '') + n; };
    $('dateNaissance').max = t.getFullYear() + '-' + pad(t.getMonth() + 1) + '-' + pad(t.getDate());

    // Mot de passe : afficher / masquer
    var pw = $('password');
    $('toggle-pw').addEventListener('click', function () {
      var show = pw.type === 'password';
      pw.type = show ? 'text' : 'password';
      this.setAttribute('aria-pressed', String(show));
      this.setAttribute('aria-label', show ? 'Masquer le mot de passe' : 'Afficher le mot de passe');
      $('eye-on').classList.toggle('hidden', show);
      $('eye-off').classList.toggle('hidden', !show);
    });

    // Force du mot de passe
    var segs = form.querySelectorAll('[data-seg]');
    var colors = ['bg-rose-400', 'bg-orange-400', 'bg-yellow-400', 'bg-emerald-400'];
    var labels = ['Faible', 'Moyen', 'Correct', 'Solide'];
    pw.addEventListener('input', function () {
      var v = pw.value, s = 0;
      if (v.length >= 8) s++;
      if (/[a-z]/.test(v) && /[A-Z]/.test(v)) s++;
      if (/\d/.test(v)) s++;
      if (/[^A-Za-z0-9]/.test(v) || v.length >= 12) s++;
      if (!v) s = 0;
      segs.forEach(function (sg, i) {
        sg.className = 'h-1.5 rounded-full transition-colors ' + (i < s ? colors[s - 1] : 'bg-neutral-200');
      });
      $('pw-strength').textContent = s ? 'Force : ' + labels[s - 1] : '';
    });

    // Navigation entre étapes
    function showStep(n, back) {
      current = n;
      panels.forEach(function (p) {
        var on = Number(p.getAttribute('data-panel')) === n;
        p.classList.toggle('hidden', !on);
        p.classList.remove('in-fwd', 'in-back');
        if (on) {
          void p.offsetWidth;
          p.classList.add(back ? 'in-back' : 'in-fwd');
        }
      });
      $('step-label').textContent = 'Étape ' + n + ' sur 3';
      for (var i = 1; i <= 3; i++) {
        var dot = form.parentNode.querySelector('[data-dot="' + i + '"]');
        var done = i < n, active = i === n;
        dot.className = 'flex h-8 w-8 shrink-0 items-center justify-center rounded-full text-xs font-medium ' +
          (done ? 'bg-emerald-200 text-emerald-900' : active ? 'bg-black text-white' : 'border border-neutral-300 text-neutral-500');
        dot.querySelector('[data-num]').classList.toggle('hidden', done);
        dot.querySelector('[data-check]').classList.toggle('hidden', !done);
        var line = form.parentNode.querySelector('[data-line="' + i + '"]');
        if (line) line.style.width = done ? '100%' : '0';
      }
      var panel = form.querySelector('[data-panel="' + n + '"]');
      var heading = panel.querySelector('h2[tabindex], [data-title]:not(.hidden)');
      var visibleTitle = n === 3 ? panel.querySelector('fieldset:not(.hidden) [data-title]') : panel.querySelector('h2');
      if (visibleTitle) visibleTitle.focus({ preventScroll: true });
      if (n > 1 || back) window.scrollTo({ top: 0, behavior: reduce ? 'auto' : 'smooth' });
    }

    // Rôle
    function setRole(r) {
      roleInput.value = r;
      roleBtns.forEach(function (b) {
        var on = b.getAttribute('data-role') === r;
        b.setAttribute('aria-checked', String(on));
        b.tabIndex = on ? 0 : -1;
        b.classList.toggle('border-black', on);
        b.classList.toggle('bg-butter', on);
        b.classList.toggle('border-neutral-300', !on);
        var tick = b.querySelector('[data-tick]');
        tick.classList.toggle('hidden', !on);
        tick.classList.toggle('flex', on);
      });
      roleNext.disabled = !r;
      var isP = r === 'PATIENT', isD = r === 'DOCTOR';
      blockPatient.classList.toggle('hidden', !isP);
      blockPatient.disabled = !isP;
      blockDoctor.classList.toggle('hidden', !isD);
      blockDoctor.disabled = !isD;
      setErr('role', '');
    }
    roleBtns.forEach(function (b, i) {
      b.addEventListener('click', function () { setRole(b.getAttribute('data-role')); });
      b.addEventListener('keydown', function (e) {
        var k = e.key, idx = -1;
        if (k === 'ArrowRight' || k === 'ArrowDown') idx = (i + 1) % roleBtns.length;
        if (k === 'ArrowLeft' || k === 'ArrowUp') idx = (i - 1 + roleBtns.length) % roleBtns.length;
        if (idx > -1) { e.preventDefault(); roleBtns[idx].focus(); setRole(roleBtns[idx].getAttribute('data-role')); }
        if (k === ' ' || k === 'Enter') { e.preventDefault(); setRole(b.getAttribute('data-role')); }
      });
    });

    // Validations
    function validStep1() {
      firstBad = null;
      var ok = true;
      ok = setErr('name', val('name') ? '' : 'Veuillez saisir votre prénom.') && ok;
      ok = setErr('lastName', val('lastName') ? '' : 'Veuillez saisir votre nom.') && ok;
      ok = setErr('email', /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.test(val('email')) ? '' : 'Saisissez une adresse e-mail valide.') && ok;
      var p = pw.value, pm = '';
      if (p.length < 8) pm = 'Le mot de passe doit contenir au moins 8 caractères.';
      else if (!/[A-Z]/.test(p) || !/[a-z]/.test(p) || !/\d/.test(p)) pm = 'Ajoutez une majuscule, une minuscule et un chiffre.';
      ok = setErr('password', pm) && ok;
      ok = setErr('confirmPassword', $('confirmPassword').value === p && p ? '' : 'Les mots de passe ne correspondent pas.') && ok;
      if (firstBad) firstBad.focus();
      return ok;
    }
    function validStep2() {
      firstBad = null;
      var ok = setErr('role', roleInput.value ? '' : 'Choisissez un rôle pour continuer.');
      if (!ok) roleBtns[0].focus();
      return ok;
    }
    function validStep3() {
      firstBad = null;
      var ok = true;
      if (roleInput.value === 'PATIENT') {
        ok = setErr('phone', /^(?:0|\+212\s?)[67](?:[\s.-]?\d{2}){4}$/.test(val('phone')) ? '' : 'Numéro invalide (ex. 06 12 34 56 78 ou +212 6 12 34 56 78).') && ok;
        ok = setErr('cin', /^(?=.*\d)[A-Za-z0-9]{5,12}$/.test(val('cin')) ? '' : 'Saisissez un CIN valide (lettres et chiffres).') && ok;
        var d = val('dateNaissance'), dm = '';
        if (!d) dm = 'Indiquez votre date de naissance.';
        else if (isNaN(Date.parse(d)) || d > $('dateNaissance').max) dm = 'La date de naissance doit être dans le passé.';
        ok = setErr('dateNaissance', dm) && ok;
        ok = setErr('genre', form.querySelector('input[name="genre"]:checked') ? '' : 'Sélectionnez votre genre.') && ok;
        ok = setErr('adresse', val('adresse') ? '' : 'Veuillez saisir votre adresse.') && ok;
        ok = setErr('groupeSanguin', $('groupeSanguin').value ? '' : 'Choisissez votre groupe sanguin.') && ok;
      } else if (roleInput.value === 'DOCTOR') {
        ok = setErr('matricule', val('matricule') ? '' : 'Veuillez saisir votre matricule.') && ok;
        ok = setErr('titre', val('titre') ? '' : 'Indiquez votre titre ou spécialité.') && ok;
      }
      ok = setErr('terms', $('terms').checked ? '' : 'Vous devez accepter les conditions pour continuer.') && ok;
      if (firstBad && firstBad.focus) firstBad.focus();
      return ok;
    }

    form.querySelectorAll('[data-next]').forEach(function (b) {
      b.addEventListener('click', function () {
        if (current === 1 && validStep1()) showStep(2, false);
        else if (current === 2 && validStep2()) showStep(3, false);
      });
    });
    form.querySelectorAll('[data-prev]').forEach(function (b) {
      b.addEventListener('click', function () { showStep(current - 1, true); });
    });

    // Envoi : validation complète + anti double envoi
    form.addEventListener('submit', function (e) {
      if (!validStep1()) { e.preventDefault(); showStep(1, true); validStep1(); return; }
      if (!validStep2()) { e.preventDefault(); showStep(2, true); validStep2(); return; }
      if (!validStep3()) { e.preventDefault(); return; }
      var btn = $('submit-btn');
      btn.innerHTML = '<svg class="animate-spin" width="16" height="16" viewBox="0 0 24 24" fill="none" aria-hidden="true"><circle cx="12" cy="12" r="9" stroke="currentColor" stroke-width="3" opacity=".3"/><path d="M21 12a9 9 0 0 0-9-9" stroke="currentColor" stroke-width="3" stroke-linecap="round"/></svg><span>Création…</span>';
      btn.disabled = true;
    });

    // Restauration après retour serveur
    var initial = form.getAttribute('data-initial-role');
    if (initial === 'DOCTOR' || initial === 'PATIENT') {
      setRole(initial);
      showStep(3, false);
    }
  })();
</script>
</body>
</html>