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
  <%-- Base commune (reset, fond, .page, navbar, logo) --%>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
  <style>
    /* ---------- Navbar (partie droite) ---------- */
    .nav-right { display: flex; align-items: center; gap: 12px; }
    .link-back { font-size: .875rem; color: #525252; text-underline-offset: 4px; }
    .link-back:hover { color: #000; text-decoration: underline; }
    .btn-register {
      border: 1px solid #d4d4d4; border-radius: 9999px; padding: 10px 20px;
      font-size: .875rem; font-weight: 500; transition: background-color .2s;
    }
    .btn-register:hover { background: #f5f5f5; }
    .flash-message { margin-top: 12px; font-size: .875rem; color: #dc2626; }

    /* ---------- Mise en page ---------- */
    .login-layout { display: grid; gap: 2rem; padding: 0 20px 32px; }

    /* ---------- Colonne photo (desktop) ---------- */
    .login-aside {
      display: none; position: relative; overflow: hidden;
      border-radius: 1.5rem; background: #fef3c6;
    }
    .login-aside img {
      position: absolute; inset: 0; width: 100%; height: 100%;
      object-fit: cover; background: #fef3c6;
    }
    .login-shade {
      position: absolute; inset: 0;
      background: linear-gradient(to top, rgba(0,0,0,.75), rgba(0,0,0,.1), transparent);
    }
    .login-stat {
      position: absolute; top: 20px; left: 20px; border-radius: 1rem;
      background: rgba(255, 243, 176, .9); padding: 12px 16px;
      -webkit-backdrop-filter: blur(8px); backdrop-filter: blur(8px);
    }
    .login-stat-number { font-family: var(--font-serif); font-size: 1.875rem; line-height: 1; }
    .login-stat-label { margin-top: 4px; font-size: .75rem; color: #262626; }
    .login-quote {
      position: absolute; left: 0; right: 0; bottom: 0; padding: 32px;
      font-family: var(--font-serif); font-size: 2.25rem; line-height: 1.25; color: #fff;
    }

    /* ---------- Formulaire ---------- */
    .login-form-wrap {
      display: flex; flex-direction: column; justify-content: center; padding: 8px 0;
      animation: fade-up .7s ease both;
    }
    @keyframes fade-up { from { opacity: 0; transform: translateY(22px); } to { opacity: 1; transform: none; } }
    @keyframes spin { to { transform: rotate(360deg); } }
    .eyebrow { font-size: .75rem; font-weight: 500; letter-spacing: .1em; color: #525252; }
    .login-title {
      margin-top: 12px; font-family: var(--font-serif); font-size: 2.25rem;
      line-height: 1.25; letter-spacing: -.025em;
    }
    .login-sub { margin-top: 12px; max-width: 24rem; font-size: .875rem; color: #525252; }

    .alert {
      display: flex; align-items: flex-start; gap: 12px; margin-top: 24px;
      border-radius: 1rem; padding: 16px; font-size: .875rem;
    }
    .alert svg { flex-shrink: 0; margin-top: 2px; }
    .alert-error { background: #fff1f2; color: #9f1239; }
    .alert-success { background: #ecfdf5; color: #064e3b; }
    .is-hidden { display: none; }

    .login-form { margin-top: 24px; }
    .lbl { display: block; margin-bottom: 6px; font-size: .75rem; font-weight: 500; color: #404040; }
    .input-wrap { position: relative; }
    .input-icon {
      position: absolute; top: 50%; left: 16px; transform: translateY(-50%);
      color: #737373; pointer-events: none;
    }
    .input {
      width: 100%; border: 1px solid #d4d4d4; border-radius: .75rem; background: #fff;
      padding: 12px 16px 12px 44px; font: inherit; font-size: .875rem; color: inherit;
      outline: none; transition: border-color .2s, box-shadow .2s;
    }
    .input:focus { border-color: #000; box-shadow: 0 0 0 4px rgba(254, 230, 133, .7); }
    .input[aria-invalid="true"] { border-color: #f43f5e; }
    .input--pw { padding-right: 48px; }
    .pw-toggle {
      position: absolute; top: 50%; right: 12px; transform: translateY(-50%);
      border-radius: 9999px; padding: 6px; color: #525252;
    }
    .pw-toggle:hover { color: #000; }
    .err { margin-top: 4px; min-height: 1rem; font-size: .75rem; color: #be123c; }

    .login-options {
      display: flex; flex-wrap: wrap; align-items: center; justify-content: space-between;
      gap: 12px; margin-top: 4px; font-size: .875rem;
    }
    .check { display: flex; align-items: center; gap: 10px; cursor: pointer; color: #404040; }
    .check input { width: 20px; height: 20px; accent-color: #000; }
    .link-strong { font-weight: 500; text-decoration: underline; text-underline-offset: 4px; }
    .link-strong:hover { color: #525252; }

    .btn-submit {
      display: inline-flex; width: 100%; align-items: center; justify-content: center; gap: 8px;
      margin-top: 24px; border-radius: 9999px; background: #000; color: #fff;
      padding: 14px 28px; font-size: .75rem; font-weight: 500; letter-spacing: .1em;
      text-transform: uppercase; transition: background-color .2s;
    }
    .btn-submit:hover { background: #262626; }
    .btn-submit:disabled { cursor: not-allowed; opacity: .6; }
    .spinner { animation: spin 1s linear infinite; }

    .divider {
      display: flex; align-items: center; gap: 16px; margin-top: 32px;
      font-size: .75rem; color: #525252;
    }
    .divider::before, .divider::after { content: ""; flex: 1; height: 1px; background: #e5e5e5; }
    .role-grid { display: grid; gap: 12px; margin-top: 16px; }
    .role-card {
      display: flex; align-items: center; gap: 12px; border: 1px solid #d4d4d4;
      border-radius: 1rem; padding: 14px 16px; font-size: .875rem; font-weight: 500;
      transition: background-color .2s;
    }
    .role-card:hover { background: rgba(255, 243, 176, .6); }
    .secure-note { display: flex; align-items: center; gap: 8px; margin-top: 24px; font-size: .75rem; color: #525252; }

    /* ---------- Responsive ---------- */
    @media (min-width: 640px) {
      .login-layout { padding: 0 40px 40px; }
      .login-title { font-size: 3rem; }
      .role-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
    }
    @media (min-width: 1024px) {
      .login-layout { grid-template-columns: repeat(2, minmax(0, 1fr)); gap: 3rem; }
      .login-aside { display: block; }
      .login-form-wrap { padding: 24px 0; }
    }
    @media (prefers-reduced-motion: reduce) {
      .login-form-wrap { animation: none; }
    }
  </style>
</head>
<body>
<a href="#contenu" class="skip-link">Aller au formulaire</a>

<div class="page">

  <!-- Navbar minimale -->
  <header class="site-header">
    <nav class="navbar" aria-label="Navigation principale">
      <a href="${pageContext.request.contextPath}/index.jsp" class="brand">
        <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><path d="M12 2v20M3.3 7l17.4 10M3.3 17L20.7 7"/></svg>
        <span class="brand-name">CLINIC MANAGER</span>
      </a>
      <div class="nav-right">
        <a href="" class="link-back">Retour à l'accueil</a>
        <a href="register" class="btn-register">Register</a>
      </div>
    </nav>
    <c:if test="${not empty message}">
      <p class="flash-message" role="alert"><c:out value="${message}"/></p>
    </c:if>
  </header>

  <main id="contenu" class="login-layout">

    <!-- Colonne photo (desktop) -->
    <aside class="login-aside" aria-label="Présentation">
      <img src="${pageContext.request.contextPath}/images/login-team.jpg" width="900" height="1200" alt="Équipe médicale diverse de six soignants en blouses colorées">
      <div class="login-shade"></div>
      <div class="login-stat">
        <p class="login-stat-number">800+</p>
        <p class="login-stat-label">médecins nous font confiance</p>
      </div>
      <p class="login-quote">Votre parcours de soin, enfin centralisé.</p>
    </aside>

    <!-- Formulaire -->
    <section class="login-form-wrap" aria-labelledby="titre-page">
      <p class="eyebrow">BON RETOUR</p>
      <h1 id="titre-page" class="login-title">Connectez-vous à votre espace</h1>
      <p class="login-sub">Accédez à votre planning, vos rendez-vous et votre dossier.</p>

      <!-- Bandeaux serveur -->
      <div role="alert" class="alert alert-error ${empty error ? 'is-hidden' : ''}">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><circle cx="12" cy="12" r="10"/><path d="M12 8v4M12 16h.01"/></svg>
        <p><c:out value="${error}"/></p>
      </div>
      <div role="status" class="alert alert-success ${empty success ? 'is-hidden' : ''}">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><circle cx="12" cy="12" r="10"/><path d="M8 12.5l2.7 2.7L16 9.5"/></svg>
        <p><c:out value="${success}"/></p>
      </div>

      <form id="login-form" class="login-form" method="post" action="login" novalidate>
        <input type="hidden" name="csrfToken" value="<c:out value='${csrfToken}'/>">
        <input type="hidden" name="redirect" value="<c:out value='${param.redirect}'/>">

        <!-- Email -->
        <div>
          <label for="email" class="lbl">Adresse e-mail</label>
          <div class="input-wrap">
            <svg class="input-icon" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect x="3" y="5" width="18" height="14" rx="2"/><path d="M3 7l9 6 9-6"/></svg>
            <input id="email" name="email" type="email" autocomplete="username" class="input" aria-describedby="err-email" value="<c:out value='${param.email}'/>">
          </div>
          <p id="err-email" class="err" aria-live="polite"></p>
        </div>

        <!-- Mot de passe -->
        <div>
          <label for="password" class="lbl">Mot de passe</label>
          <div class="input-wrap">
            <svg class="input-icon" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect x="4" y="11" width="16" height="10" rx="2"/><path d="M8 11V7a4 4 0 0 1 8 0v4"/></svg>
            <input id="password" name="password" type="password" autocomplete="current-password" class="input input--pw" aria-describedby="err-password">
            <button type="button" id="toggle-pw" class="pw-toggle" aria-label="Afficher le mot de passe" aria-pressed="false">
              <svg id="eye-on" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M2 12s3.6-7 10-7 10 7 10 7-3.6 7-10 7S2 12 2 12z"/><circle cx="12" cy="12" r="3"/></svg>
              <svg id="eye-off" class="is-hidden" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M3 3l18 18M10.6 5.1A10 10 0 0 1 12 5c6.4 0 10 7 10 7a17 17 0 0 1-3.2 4M6.6 6.6A17 17 0 0 0 2 12s3.6 7 10 7a10 10 0 0 0 4.4-1M9.9 9.9a3 3 0 0 0 4.2 4.2"/></svg>
            </button>
          </div>
          <p id="err-password" class="err" aria-live="polite"></p>
        </div>

        <!-- Options -->
        <div class="login-options">
          <label class="check">
            <input type="checkbox" name="rememberMe" value="on">
            Se souvenir de moi
          </label>
          <a href="${pageContext.request.contextPath}/forgot-password.jsp" class="link-strong">Mot de passe oublié ?</a>
        </div>

        <!-- Envoi -->
        <button type="submit" id="submit-btn" class="btn-submit">Se connecter</button>
      </form>

      <!-- Séparateur et inscription -->
      <div class="divider"><span>Nouveau sur Clinic Manager ?</span></div>
      <div class="role-grid">
        <a href="${pageContext.request.contextPath}/register.jsp" class="role-card">
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M6 3v6a4 4 0 0 0 8 0V3M4 3h4M12 3h4"/><path d="M10 13v2a5 5 0 0 0 10 0v-1"/><circle cx="20" cy="12" r="2"/></svg>
          Je suis médecin
        </a>
        <a href="${pageContext.request.contextPath}/register.jsp" class="role-card">
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M12 21s-7-4.4-7-10a4 4 0 0 1 7-2.6A4 4 0 0 1 19 11c0 5.6-7 10-7 10z"/></svg>
          Je suis patient
        </a>
      </div>

      <!-- Réassurance -->
      <p class="secure-note">
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
      document.getElementById('eye-on').classList.toggle('is-hidden', show);
      document.getElementById('eye-off').classList.toggle('is-hidden', !show);
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
      btn.innerHTML = '<svg class="spinner" width="16" height="16" viewBox="0 0 24 24" fill="none" aria-hidden="true"><circle cx="12" cy="12" r="9" stroke="currentColor" stroke-width="3" opacity=".3"/><path d="M21 12a9 9 0 0 0-9-9" stroke="currentColor" stroke-width="3" stroke-linecap="round"/></svg><span>Connexion…</span>';
      btn.disabled = true;
    });

    // Focus initial sur le premier champ utile
    if (email.value) pw.focus(); else email.focus();
  })();
</script>
</body>
</html>