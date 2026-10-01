<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Connexion — Clinic Manager</title>
  <meta name="description" content="Connectez-vous à Clinic Manager pour accéder à votre planning, vos rendez-vous et votre dossier.">
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
      .field { @apply w-full rounded-xl border border-neutral-300 bg-white py-3 pr-4 pl-11 text-sm outline-none transition focus:border-black focus:ring-4 focus:ring-amber-200/70 aria-[invalid=true]:border-rose-500; }
      .lbl { @apply mb-1.5 block text-xs font-medium text-neutral-700; }
      .err { @apply mt-1 min-h-4 text-xs text-rose-700; }
      .btn-dark { @apply inline-flex w-full items-center justify-center gap-2 rounded-full bg-black px-7 py-3.5 text-xs font-medium tracking-widest text-white uppercase transition hover:bg-neutral-800 disabled:cursor-not-allowed disabled:opacity-60; }
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
    @keyframes fade-up { from { opacity:0; transform:translateY(22px); } to { opacity:1; transform:none; } }
    .fade-up { animation: fade-up .7s ease both; }
    @media (prefers-reduced-motion: reduce) {
      .fade-up { animation: none; }
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
        <a href="${pageContext.request.contextPath}/register.jsp" class="rounded-full border border-neutral-300 px-5 py-2.5 text-sm font-medium hover:bg-neutral-100">Register</a>
      </div>
    </nav>
  </header>

  <main id="contenu" class="grid gap-8 px-5 pb-8 sm:px-10 sm:pb-10 lg:grid-cols-2 lg:gap-12">

    <!-- Colonne photo (desktop) -->
    <aside class="relative hidden overflow-hidden rounded-3xl bg-amber-100 lg:block" aria-label="Présentation">
      <img src="https://wallpapercave.com/wp/wp12475770.jpg" width="600" height="800" alt="Équipe médicale diverse de six soignants en blouses colorées" class="absolute inset-0 h-full w-full bg-amber-100 object-cover">
      <div class="absolute inset-0 bg-linear-to-t from-black/75 via-black/10 to-transparent"></div>
      <div class="absolute top-5 left-5 rounded-2xl bg-butter/90 px-4 py-3 backdrop-blur">
        <p class="font-serif text-3xl leading-none">800+</p>
        <p class="mt-1 text-xs text-neutral-800">médecins nous font confiance</p>
      </div>
      <p class="absolute inset-x-0 bottom-0 p-8 font-serif text-4xl leading-tight text-white">Votre parcours de soin, enfin centralisé.</p>
    </aside>

    <!-- Formulaire -->
    <section class="fade-up flex flex-col justify-center py-2 lg:py-6" aria-labelledby="titre-page">
      <p class="text-xs font-medium tracking-widest text-neutral-600">BON RETOUR</p>
      <h1 id="titre-page" class="mt-3 font-serif text-4xl leading-tight tracking-tight sm:text-5xl">Connectez-vous à votre espace</h1>
      <p class="mt-3 max-w-sm text-sm text-neutral-600">Accédez à votre planning, vos rendez-vous et votre dossier.</p>

      <!-- Bandeaux serveur -->
      <div role="alert" class="${empty error ? 'hidden' : 'flex'} mt-6 items-start gap-3 rounded-2xl bg-rose-50 p-4 text-sm text-rose-800">
        <svg class="mt-0.5 shrink-0" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><circle cx="12" cy="12" r="10"/><path d="M12 8v4M12 16h.01"/></svg>
        <p><c:out value="${error}"/></p>
      </div>
      <div role="status" class="${empty success ? 'hidden' : 'flex'} mt-6 items-start gap-3 rounded-2xl bg-emerald-50 p-4 text-sm text-emerald-900">
        <svg class="mt-0.5 shrink-0" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="12" cy="12" r="10"/><path d="M8 12.5l2.7 2.7L16 9.5"/></svg>
        <p><c:out value="${success}"/></p>
      </div>

      <form id="login-form" method="post" action="login" novalidate class="mt-6">
        <input type="hidden" name="csrfToken" value="<c:out value='${csrfToken}'/>">
        <input type="hidden" name="redirect" value="<c:out value='${param.redirect}'/>">

        <!-- Email -->
        <div>
          <label for="email" class="lbl">Adresse e-mail</label>
          <div class="relative">
            <svg class="pointer-events-none absolute top-1/2 left-4 -translate-y-1/2 text-neutral-500" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect x="3" y="5" width="18" height="14" rx="2"/><path d="M3 7l9 6 9-6"/></svg>
            <input id="email" name="email" type="email" autocomplete="username" class="field" aria-describedby="err-email" value="<c:out value='${param.email}'/>">
          </div>
          <p id="err-email" class="err" aria-live="polite"></p>
        </div>

        <!-- Mot de passe -->
        <div>
          <label for="password" class="lbl">Mot de passe</label>
          <div class="relative">
            <svg class="pointer-events-none absolute top-1/2 left-4 -translate-y-1/2 text-neutral-500" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect x="4" y="11" width="16" height="10" rx="2"/><path d="M8 11V7a4 4 0 0 1 8 0v4"/></svg>
            <input id="password" name="password" type="password" autocomplete="current-password" class="field pr-12" aria-describedby="err-password">
            <button type="button" id="toggle-pw" aria-label="Afficher le mot de passe" aria-pressed="false" class="absolute top-1/2 right-3 -translate-y-1/2 rounded-full p-1.5 text-neutral-600 hover:text-black">
              <svg id="eye-on" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M2 12s3.6-7 10-7 10 7 10 7-3.6 7-10 7S2 12 2 12z"/><circle cx="12" cy="12" r="3"/></svg>
              <svg id="eye-off" class="hidden" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M3 3l18 18M10.6 5.1A10 10 0 0 1 12 5c6.4 0 10 7 10 7a17 17 0 0 1-3.2 4M6.6 6.6A17 17 0 0 0 2 12s3.6 7 10 7a10 10 0 0 0 4.4-1M9.9 9.9a3 3 0 0 0 4.2 4.2"/></svg>
            </button>
          </div>
          <p id="err-password" class="err" aria-live="polite"></p>
        </div>

        <!-- Options -->
        <div class="mt-1 flex flex-wrap items-center justify-between gap-3 text-sm">
          <label class="flex cursor-pointer items-center gap-2.5 text-neutral-700">
            <input type="checkbox" name="rememberMe" value="on" class="h-5 w-5 rounded border-neutral-400 accent-black">
            Se souvenir de moi
          </label>
          <a href="${pageContext.request.contextPath}/forgot-password.jsp" class="font-medium text-black underline underline-offset-4 hover:text-neutral-600">Mot de passe oublié ?</a>
        </div>

        <!-- Envoi -->
        <button type="submit" id="submit-btn" class="btn-dark mt-6">Se connecter</button>
      </form>

      <!-- Séparateur et inscription -->
      <div class="mt-8 flex items-center gap-4 text-xs text-neutral-600">
        <span class="h-px flex-1 bg-neutral-200"></span>
        <span>Nouveau sur Clinic Manager ?</span>
        <span class="h-px flex-1 bg-neutral-200"></span>
      </div>
      <div class="mt-4 grid gap-3 sm:grid-cols-2">
        <a href="${pageContext.request.contextPath}/register.jsp" class="flex items-center gap-3 rounded-2xl border border-neutral-300 px-4 py-3.5 text-sm font-medium transition hover:bg-butter/60">
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M6 3v6a4 4 0 0 0 8 0V3M4 3h4M12 3h4"/><path d="M10 13v2a5 5 0 0 0 10 0v-1"/><circle cx="20" cy="12" r="2"/></svg>
          Je suis médecin
        </a>
        <a href="${pageContext.request.contextPath}/register.jsp" class="flex items-center gap-3 rounded-2xl border border-neutral-300 px-4 py-3.5 text-sm font-medium transition hover:bg-butter/60">
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M12 21s-7-4.4-7-10a4 4 0 0 1 7-2.6A4 4 0 0 1 19 11c0 5.6-7 10-7 10z"/></svg>
          Je suis patient
        </a>
      </div>

      <!-- Réassurance -->
      <p class="mt-6 flex items-center gap-2 text-xs text-neutral-600">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect x="4" y="11" width="16" height="10" rx="2"/><path d="M8 11V7a4 4 0 0 1 8 0v4"/></svg>
        Connexion sécurisée · Vos données médicales sont chiffrées
      </p>
    </section>
  </main>
</div>

<script>
  (function () {
    var form = document.getElementById('login-form');
    var pw = document.getElementById('password');
    var email = document.getElementById('email');

    // Afficher / masquer le mot de passe
    document.getElementById('toggle-pw').addEventListener('click', function () {
      var show = pw.type === 'password';
      pw.type = show ? 'text' : 'password';
      this.setAttribute('aria-pressed', String(show));
      this.setAttribute('aria-label', show ? 'Masquer le mot de passe' : 'Afficher le mot de passe');
      document.getElementById('eye-on').classList.toggle('hidden', show);
      document.getElementById('eye-off').classList.toggle('hidden', !show);
    });

    // Gestion des erreurs
    function setErr(field, id, msg) {
      document.getElementById('err-' + id).textContent = msg || '';
      if (msg) field.setAttribute('aria-invalid', 'true'); else field.removeAttribute('aria-invalid');
      return !msg;
    }
    email.addEventListener('input', function () { if (email.value) setErr(email, 'email', ''); });
    pw.addEventListener('input', function () { if (pw.value) setErr(pw, 'password', ''); });

    // Validation et anti double envoi (le serveur re-valide tout)
    form.addEventListener('submit', function (e) {
      var v = email.value.trim(), msg = '';
      if (!v) msg = 'Veuillez saisir votre adresse e-mail.';
      else if (!/^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.test(v)) msg = 'Saisissez une adresse e-mail valide.';
      var okEmail = setErr(email, 'email', msg);
      var okPw = setErr(pw, 'password', pw.value ? '' : 'Veuillez saisir votre mot de passe.');
      if (!okEmail || !okPw) {
        e.preventDefault();
        (okEmail ? pw : email).focus();
        return;
      }
      var btn = document.getElementById('submit-btn');
      btn.innerHTML = '<svg class="animate-spin" width="16" height="16" viewBox="0 0 24 24" fill="none" aria-hidden="true"><circle cx="12" cy="12" r="9" stroke="currentColor" stroke-width="3" opacity=".3"/><path d="M21 12a9 9 0 0 0-9-9" stroke="currentColor" stroke-width="3" stroke-linecap="round"/></svg><span>Connexion…</span>';
      btn.disabled = true;
    });

    // Focus initial sur le premier champ utile
    if (email.value) pw.focus(); else email.focus();
  })();
</script>
</body>
</html>