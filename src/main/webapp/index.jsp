<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Clinic Manager — Gestion de clinique, rendez-vous sans conflit</title>
  <meta name="description" content="Clinic Manager centralise plannings médicaux, rendez-vous sans conflit et notes médicales sécurisées pour votre clinique.">
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
  </style>
  <style>
    body { background-color:#fffbe6;
      background-image:
        radial-gradient(at 12% 8%, #fff3b0 0, transparent 45%),
        radial-gradient(at 88% 12%, #f3e7d3 0, transparent 50%),
        radial-gradient(at 80% 90%, #d9e1ea 0, transparent 50%),
        radial-gradient(at 8% 85%, #efe6d0 0, transparent 45%);
      background-attachment: fixed; }
    .reveal { opacity:0; transform:translateY(24px); transition:opacity .7s ease, transform .7s ease; }
    .reveal.in { opacity:1; transform:none; }
    @keyframes spin-slow { to { transform:rotate(360deg); } }
    .spin-slow { animation: spin-slow 18s linear infinite; }
    @media (prefers-reduced-motion: reduce) {
      .reveal { opacity:1; transform:none; transition:none; }
      .spin-slow { animation:none; }
      * { scroll-behavior:auto !important; transition-duration:.01ms !important; }
    }
  </style>
</head>
<body class="font-sans text-neutral-900 antialiased">
<a href="#contenu" class="sr-only focus:not-sr-only focus:fixed focus:top-3 focus:left-3 focus:z-50 focus:rounded-full focus:bg-black focus:px-4 focus:py-2 focus:text-white">Aller au contenu</a>

<div class="mx-auto my-3 max-w-6xl overflow-hidden rounded-3xl bg-white shadow-[0_30px_80px_-30px_rgba(60,50,20,.25)] sm:my-8">

  <!-- Navbar -->
  <header class="relative px-5 py-5 sm:px-10">
    <nav class="flex items-center justify-between gap-4" aria-label="Navigation principale">
      <a href="#accueil" class="flex items-center gap-2 rounded-full focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-black">
        <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><path d="M12 2v20M3.3 7l17.4 10M3.3 17L20.7 7"/></svg>
        <span class="text-sm font-semibold tracking-widest">CLINIC MANAGER</span>
      </a>
      <ul class="hidden items-center gap-8 text-sm lg:flex">
        <li><a href="#accueil" class="font-semibold">Accueil</a></li>
        <li><a href="#fonctionnalites" class="text-neutral-600 hover:text-black">Fonctionnalités</a></li>
        <li><a href="#fonctionnement" class="text-neutral-600 hover:text-black">Fonctionnement</a></li>
        <li><a href="#securite" class="text-neutral-600 hover:text-black">Sécurité</a></li>
        <li><a href="#tarifs" class="text-neutral-600 hover:text-black">Tarifs</a></li>
        <li><a href="#faq" class="text-neutral-600 hover:text-black">FAQ</a></li>
      </ul>
      <div class="flex items-center gap-2">
        <a href="#fonctionnalites" aria-label="Rechercher une fonctionnalité" class="hidden h-10 w-10 items-center justify-center rounded-full border border-neutral-300 hover:bg-neutral-100 sm:inline-flex">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><circle cx="11" cy="11" r="7"/><path d="M20 20l-3.5-3.5"/></svg>
        </a>
        <a href="login" class="hidden rounded-full border border-neutral-300 px-5 py-2.5 text-sm font-medium hover:bg-neutral-100 sm:inline-block">Login</a>
        <a href="register" class="rounded-full bg-black px-5 py-2.5 text-sm font-medium text-white hover:bg-neutral-800">Register</a>
        <button id="burger" type="button" aria-label="Ouvrir le menu" aria-expanded="false" aria-controls="mobile-menu" class="inline-flex h-10 w-10 items-center justify-center rounded-full border border-neutral-300 lg:hidden">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><path d="M4 7h16M4 12h16M4 17h16"/></svg>
        </button>
      </div>
    </nav>
    <div id="mobile-menu" class="mt-4 hidden rounded-2xl bg-cream p-5 lg:hidden">
      <ul class="space-y-3 text-sm">
        <li><a href="#accueil" class="block font-semibold">Accueil</a></li>
        <li><a href="#fonctionnalites" class="block">Fonctionnalités</a></li>
        <li><a href="#fonctionnement" class="block">Fonctionnement</a></li>
        <li><a href="#securite" class="block">Sécurité</a></li>
        <li><a href="#tarifs" class="block">Tarifs</a></li>
        <li><a href="#faq" class="block">FAQ</a></li>
        <li><a href="login" class="block font-medium">Login</a></li>
      </ul>
    </div>
  </header>

  <main id="contenu">

  <!-- Hero -->
  <section id="accueil" class="grid gap-10 px-5 pt-6 pb-10 sm:px-10 lg:grid-cols-2 lg:items-center">
    <div class="reveal">
      <h1 class="font-serif text-5xl leading-[0.95] tracking-tight sm:text-6xl lg:text-7xl">Une clinique sereine, un parcours de soin sans accroc.</h1>
      <p class="mt-6 max-w-md text-sm leading-relaxed text-neutral-600">Clinic Manager réunit plannings médicaux, rendez-vous sans conflit et notes médicales sécurisées dans un seul espace. Votre équipe gagne du temps, vos patients sont mieux accompagnés.</p>
      <div class="mt-8 flex flex-wrap items-center gap-6">
        <a href="register" class="rounded-full bg-black px-7 py-3.5 text-xs font-medium tracking-widest text-white uppercase hover:bg-neutral-800">Créer mon compte</a>
        <a href="#fonctionnalites" class="text-xs font-medium tracking-widest uppercase underline underline-offset-4 hover:text-neutral-600">Trouver un médecin</a>
      </div>
    </div>
    <div class="reveal relative">
      <div class="group overflow-hidden rounded-3xl bg-amber-100">
        <img src="https://images.pexels.com/photos/4769120/pexels-photo-4769120.jpeg?cs=srgb&dl=pexels-shvetsa-4769120.jpg&fm=jpg" width="800" height="1000" alt="Médecin souriant avec stéthoscope tenant un presse-papier, accompagnée d'une mère et de sa petite fille" class="aspect-[4/5] w-full bg-amber-100 object-cover transition duration-700 group-hover:scale-105">
      </div>
      <a href="#fonctionnalites" aria-label="Explorer les services" class="absolute -top-4 -left-3 flex h-28 w-28 items-center justify-center rounded-full bg-white shadow-lg sm:-left-6 sm:h-32 sm:w-32">
        <svg viewBox="0 0 100 100" class="spin-slow absolute inset-0 h-full w-full" aria-hidden="true"><defs><path id="circ" d="M50,50 m-38,0 a38,38 0 1,1 76,0 a38,38 0 1,1 -76,0"/></defs><text font-size="9.5" letter-spacing="2.2" fill="#171717" font-family="Inter"><textPath href="#circ">••• EXPLORER ••• LES ••• SERVICES </textPath></text></svg>
        <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M7 17L17 7M8 7h9v9"/></svg>
      </a>
    </div>
  </section>

  <!-- Stats -->
  <section class="grid gap-4 px-5 pb-6 sm:px-10 md:grid-cols-[1.4fr_1fr]" aria-label="Chiffres clés">
    <div class="reveal flex flex-wrap items-center gap-6 rounded-2xl bg-butter/60 p-6 sm:p-8">
      <p class="font-serif text-7xl leading-none sm:text-8xl"><span data-count="2148">2148</span></p>
      <div>
        <p class="max-w-[16rem] text-sm text-neutral-700">Patients ont fait un pas vers leur bien-être</p>
        <div class="mt-4 flex -space-x-3">
          <img src="${pageContext.request.contextPath}/images/avatar-1.jpg" width="40" height="40" loading="lazy" alt="Portrait d'une patiente" class="h-10 w-10 rounded-full border-2 border-white bg-amber-100 object-cover">
          <img src="${pageContext.request.contextPath}/images/avatar-2.jpg" width="40" height="40" loading="lazy" alt="Portrait d'un patient" class="h-10 w-10 rounded-full border-2 border-white bg-amber-100 object-cover">
          <img src="${pageContext.request.contextPath}/images/avatar-3.jpg" width="40" height="40" loading="lazy" alt="Portrait d'une patiente souriante" class="h-10 w-10 rounded-full border-2 border-white bg-amber-100 object-cover">
        </div>
      </div>
    </div>
    <div class="reveal flex items-center gap-5 rounded-2xl border border-neutral-200 p-6 sm:p-8">
      <p class="font-serif text-6xl leading-none"><span data-count="800" data-suffix="+">800+</span></p>
      <p class="text-sm text-neutral-700">Utilisateurs mis en relation avec un médecin aujourd'hui</p>
    </div>
  </section>

  <!-- Cartes photo -->
  <section class="grid gap-4 px-5 pb-16 sm:grid-cols-2 sm:px-10 lg:grid-cols-4" aria-label="Aperçu de nos services">
    <figure class="reveal group relative aspect-[3/4] overflow-hidden rounded-3xl bg-amber-100">
      <img src="${pageContext.request.contextPath}/images/card-seniors.jpg" width="600" height="800" loading="lazy" alt="Patient âgé marchant avec un déambulateur accompagné d'une soignante" class="h-full w-full bg-amber-100 object-cover transition duration-700 group-hover:scale-105">
      <figcaption class="absolute inset-x-0 bottom-0 bg-linear-to-t from-black/75 to-transparent p-5 pt-16 text-sm text-white">Un suivi attentif pour les patients externes et les seniors</figcaption>
    </figure>
    <figure class="reveal group relative aspect-[3/4] overflow-hidden rounded-3xl bg-amber-100">
      <img src="${pageContext.request.contextPath}/images/card-pediatrics.jpg" width="600" height="800" loading="lazy" alt="Pédiatre en blouse bleue examinant une enfant avec le sourire" class="h-full w-full bg-amber-100 object-cover transition duration-700 group-hover:scale-105">
      <a href="#fonctionnalites" aria-label="Découvrir la pédiatrie" class="absolute top-4 left-4 flex h-10 w-10 items-center justify-center rounded-full bg-white transition hover:rotate-45">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M7 17L17 7M8 7h9v9"/></svg>
      </a>
      <figcaption class="absolute inset-x-0 bottom-0 bg-linear-to-t from-black/75 to-transparent p-5 pt-16 text-sm text-white">Pédiatrie</figcaption>
    </figure>
    <article class="reveal flex aspect-[3/4] flex-col justify-between rounded-3xl bg-linear-to-br from-orange-100 via-rose-100 to-yellow-100 p-6">
      <div>
        <h2 class="font-serif text-3xl leading-tight">Ce que disent nos patients</h2>
        <p class="mt-4 text-sm leading-relaxed text-neutral-700">Plus d'attente inutile : mon rendez-vous est confirmé, mes rappels arrivent à temps et mon médecin connaît mon dossier.</p>
      </div>
      <div>
        <div class="flex items-center gap-3">
          <div class="flex -space-x-2">
            <img src="${pageContext.request.contextPath}/images/avatar-1.jpg" width="32" height="32" loading="lazy" alt="Avatar patient" class="h-8 w-8 rounded-full border-2 border-white bg-amber-100 object-cover">
            <img src="${pageContext.request.contextPath}/images/avatar-2.jpg" width="32" height="32" loading="lazy" alt="Avatar patient" class="h-8 w-8 rounded-full border-2 border-white bg-amber-100 object-cover">
          </div>
          <span class="text-xs font-medium">Avis</span>
        </div>
        <p class="mt-2 font-serif text-6xl leading-none" aria-hidden="true">”</p>
      </div>
    </article>
    <figure class="reveal group relative aspect-[3/4] overflow-hidden rounded-3xl bg-amber-100">
      <img src="${pageContext.request.contextPath}/images/card-team.jpg" width="600" height="800" loading="lazy" alt="Équipe médicale diverse de six soignants en blouses colorées" class="h-full w-full bg-amber-100 object-cover transition duration-700 group-hover:scale-105">
      <figcaption class="absolute inset-x-0 bottom-0 bg-linear-to-t from-black/75 to-transparent p-5 pt-16 text-sm text-white">Des médecins qui prennent soin de vous</figcaption>
    </figure>
  </section>

  <!-- Chemin vers le bien-être -->
  <section class="grid gap-8 px-5 pb-20 sm:px-10 lg:grid-cols-2 lg:items-end">
    <h2 class="reveal font-serif text-5xl leading-[0.98] tracking-tight sm:text-6xl">Le chemin vers un bien-être complet</h2>
    <div class="reveal">
      <p class="max-w-md text-sm leading-relaxed text-neutral-600">De la première prise de rendez-vous au suivi des consultations, chaque étape est coordonnée. Les équipes se concentrent sur le soin, la plateforme s'occupe de l'organisation.</p>
      <a href="register" class="mt-6 inline-block rounded-full bg-black px-7 py-3.5 text-xs font-medium tracking-widest text-white uppercase hover:bg-neutral-800">Prendre rendez-vous</a>
    </div>
  </section>

  <!-- Fonctionnalités -->
  <section id="fonctionnalites" class="px-5 pb-20 sm:px-10" aria-labelledby="t-fonc">
    <h2 id="t-fonc" class="reveal max-w-2xl font-serif text-5xl leading-[0.98] tracking-tight sm:text-6xl">Tout ce qu'il faut pour piloter votre clinique</h2>
    <div class="mt-10 grid gap-4 md:grid-cols-6">
      <article class="reveal rounded-3xl bg-butter/60 p-7 md:col-span-4">
        <h3 class="font-serif text-3xl">Planning médical intelligent</h3>
        <p class="mt-3 max-w-md text-sm leading-relaxed text-neutral-700">Disponibilités, congés, salles et durées de consultation : le planning de chaque médecin se met à jour en temps réel et reste lisible d'un coup d'œil.</p>
      </article>
      <article class="reveal rounded-3xl bg-black p-7 text-white md:col-span-2">
        <h3 class="font-serif text-3xl">Rendez-vous sans conflit</h3>
        <p class="mt-3 text-sm leading-relaxed text-neutral-300">Détection automatique des doubles réservations, avant même la confirmation.</p>
      </article>
      <article class="reveal rounded-3xl border border-neutral-200 p-7 md:col-span-2">
        <h3 class="font-serif text-3xl">Notes médicales sécurisées</h3>
        <p class="mt-3 text-sm leading-relaxed text-neutral-600">Accès par rôle, historique des modifications et traçabilité complète.</p>
      </article>
      <article class="reveal rounded-3xl bg-orange-100 p-7 md:col-span-2">
        <h3 class="font-serif text-3xl">Parcours de soin centralisé</h3>
        <p class="mt-3 text-sm leading-relaxed text-neutral-700">Consultations, prescriptions et suivis réunis dans un dossier unique par patient.</p>
      </article>
      <article class="reveal rounded-3xl border border-neutral-200 p-7 md:col-span-2">
        <h3 class="font-serif text-3xl">Rappels automatiques</h3>
        <p class="mt-3 text-sm leading-relaxed text-neutral-600">Moins d'absences grâce aux rappels envoyés avant chaque rendez-vous.</p>
      </article>
      <article class="reveal rounded-3xl bg-butter/60 p-7 md:col-span-6">
        <h3 class="font-serif text-3xl">Statistiques d'activité</h3>
        <p class="mt-3 max-w-xl text-sm leading-relaxed text-neutral-700">Taux d'occupation, rendez-vous annulés, durée moyenne des consultations : des indicateurs clairs pour ajuster l'organisation de votre clinique.</p>
      </article>
    </div>
  </section>

  <!-- Comment ça marche -->
  <section id="fonctionnement" class="px-5 pb-20 sm:px-10" aria-labelledby="t-how">
    <h2 id="t-how" class="reveal font-serif text-5xl leading-[0.98] tracking-tight sm:text-6xl">Comment ça marche</h2>
    <ol class="mt-10 grid gap-8 sm:grid-cols-2 lg:grid-cols-4">
      <li class="reveal border-t border-neutral-300 pt-5"><span class="font-serif text-6xl" aria-hidden="true">1</span><h3 class="mt-3 text-base font-semibold">Créez votre compte</h3><p class="mt-2 text-sm leading-relaxed text-neutral-600">Inscrivez votre clinique et invitez médecins, secrétaires et patients avec le rôle adapté.</p></li>
      <li class="reveal border-t border-neutral-300 pt-5"><span class="font-serif text-6xl" aria-hidden="true">2</span><h3 class="mt-3 text-base font-semibold">Définissez les plannings</h3><p class="mt-2 text-sm leading-relaxed text-neutral-600">Horaires, spécialités et durées de consultation sont configurés une seule fois.</p></li>
      <li class="reveal border-t border-neutral-300 pt-5"><span class="font-serif text-6xl" aria-hidden="true">3</span><h3 class="mt-3 text-base font-semibold">Réservez sans conflit</h3><p class="mt-2 text-sm leading-relaxed text-neutral-600">Seuls les créneaux réellement libres sont proposés, avec rappel automatique.</p></li>
      <li class="reveal border-t border-neutral-300 pt-5"><span class="font-serif text-6xl" aria-hidden="true">4</span><h3 class="mt-3 text-base font-semibold">Suivez chaque patient</h3><p class="mt-2 text-sm leading-relaxed text-neutral-600">Les notes médicales sont consignées en sécurité et accessibles aux bonnes personnes.</p></li>
    </ol>
  </section>

  <!-- Planning (mockup) -->
  <section class="px-5 pb-20 sm:px-10" aria-labelledby="t-plan">
    <div class="grid gap-8 lg:grid-cols-[1fr_1.6fr] lg:items-center">
      <div class="reveal">
        <h2 id="t-plan" class="font-serif text-5xl leading-[0.98] tracking-tight">Votre semaine, enfin lisible</h2>
        <p class="mt-5 max-w-sm text-sm leading-relaxed text-neutral-600">Chaque médecin, chaque salle, chaque créneau. Les couleurs distinguent les types de consultation et les chevauchements sont bloqués.</p>
      </div>
      <div class="reveal overflow-hidden rounded-3xl bg-cream p-4 shadow-sm sm:p-6">
        <div class="mb-4 flex items-center justify-between">
          <p class="text-sm font-semibold">Dr. Amrani — semaine 41</p>
          <span class="rounded-full bg-white px-3 py-1 text-xs">0 conflit</span>
        </div>
        <div class="overflow-x-auto">
          <div class="grid min-w-[520px] grid-cols-[3rem_repeat(5,1fr)] gap-2 text-xs" role="table" aria-label="Planning hebdomadaire d'exemple">
            <div></div>
            <div class="text-center font-medium">Lun</div><div class="text-center font-medium">Mar</div><div class="text-center font-medium">Mer</div><div class="text-center font-medium">Jeu</div><div class="text-center font-medium">Ven</div>
            <div class="pt-2 text-neutral-500">09:00</div>
            <div class="rounded-xl bg-yellow-200 p-2">Consultation<br><span class="text-neutral-600">S. Benali</span></div><div class="rounded-xl bg-white/70 p-2"></div><div class="rounded-xl bg-rose-200 p-2">Suivi<br><span class="text-neutral-600">M. Idrissi</span></div><div class="rounded-xl bg-white/70 p-2"></div><div class="rounded-xl bg-orange-200 p-2">Pédiatrie<br><span class="text-neutral-600">L. Tazi</span></div>
            <div class="pt-2 text-neutral-500">10:30</div>
            <div class="rounded-xl bg-white/70 p-2"></div><div class="rounded-xl bg-sky-200 p-2">Bilan<br><span class="text-neutral-600">A. Filali</span></div><div class="rounded-xl bg-white/70 p-2"></div><div class="rounded-xl bg-yellow-200 p-2">Consultation<br><span class="text-neutral-600">K. Naciri</span></div><div class="rounded-xl bg-white/70 p-2"></div>
            <div class="pt-2 text-neutral-500">14:00</div>
            <div class="rounded-xl bg-rose-200 p-2">Suivi<br><span class="text-neutral-600">H. Berrada</span></div><div class="rounded-xl bg-orange-200 p-2">Pédiatrie<br><span class="text-neutral-600">Y. Chraibi</span></div><div class="rounded-xl bg-sky-200 p-2">Bilan<br><span class="text-neutral-600">N. Alaoui</span></div><div class="rounded-xl bg-white/70 p-2"></div><div class="rounded-xl bg-yellow-200 p-2">Consultation<br><span class="text-neutral-600">R. Saidi</span></div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Sécurité -->
  <section id="securite" class="px-5 pb-20 sm:px-10" aria-labelledby="t-sec">
    <div class="reveal grid gap-8 rounded-3xl bg-butter/60 p-7 sm:p-10 lg:grid-cols-2">
      <div>
        <h2 id="t-sec" class="font-serif text-5xl leading-[0.98] tracking-tight">Sécurité et confidentialité</h2>
        <p class="mt-5 max-w-md text-sm leading-relaxed text-neutral-700">Les données de santé méritent le plus grand soin. Les informations sont chiffrées et chaque accès est enregistré.</p>
      </div>
      <ul class="grid gap-3 text-sm sm:grid-cols-2">
        <li class="rounded-2xl bg-white p-4"><strong class="block font-semibold">Chiffrement</strong>Données protégées en transit et au repos.</li>
        <li class="rounded-2xl bg-white p-4"><strong class="block font-semibold">Rôles distincts</strong>Admin, Médecin, Secrétaire et Patient.</li>
        <li class="rounded-2xl bg-white p-4"><strong class="block font-semibold">Journal d'audit</strong>Qui a consulté ou modifié quoi, et quand.</li>
        <li class="rounded-2xl bg-white p-4"><strong class="block font-semibold">Accès limité</strong>Chaque profil ne voit que le nécessaire.</li>
      </ul>
    </div>
  </section>

  <!-- Témoignages -->
  <section class="px-5 pb-20 sm:px-10" aria-labelledby="t-tem">
    <h2 id="t-tem" class="reveal font-serif text-5xl leading-[0.98] tracking-tight sm:text-6xl">Ils font confiance à Clinic Manager</h2>
    <div class="mt-10 grid gap-4 md:grid-cols-3">
      <figure class="reveal rounded-3xl bg-linear-to-br from-orange-100 to-rose-100 p-7">
        <blockquote class="text-sm leading-relaxed text-neutral-800">Les doubles réservations ont disparu. Le secrétariat gagne près d'une heure chaque matin.</blockquote>
        <figcaption class="mt-5 flex items-center gap-3"><img src="${pageContext.request.contextPath}/images/avatar-1.jpg" width="40" height="40" loading="lazy" alt="Portrait de Dr Salma Amrani" class="h-10 w-10 rounded-full bg-amber-100 object-cover"><span class="text-sm"><strong>Dr Salma Amrani</strong><br>Médecin généraliste</span></figcaption>
      </figure>
      <figure class="reveal rounded-3xl bg-butter/60 p-7">
        <blockquote class="text-sm leading-relaxed text-neutral-800">Les rappels automatiques ont nettement réduit les absences. Nos patients se sentent mieux suivis.</blockquote>
        <figcaption class="mt-5 flex items-center gap-3"><img src="${pageContext.request.contextPath}/images/avatar-2.jpg" width="40" height="40" loading="lazy" alt="Portrait de Karim Benjelloun" class="h-10 w-10 rounded-full bg-amber-100 object-cover"><span class="text-sm"><strong>Karim Benjelloun</strong><br>Directeur de clinique</span></figcaption>
      </figure>
      <figure class="reveal rounded-3xl border border-neutral-200 p-7">
        <blockquote class="text-sm leading-relaxed text-neutral-800">Je prends rendez-vous en quelques clics et je retrouve l'historique de mes consultations.</blockquote>
        <figcaption class="mt-5 flex items-center gap-3"><img src="${pageContext.request.contextPath}/images/avatar-3.jpg" width="40" height="40" loading="lazy" alt="Portrait de Nadia El Fassi" class="h-10 w-10 rounded-full bg-amber-100 object-cover"><span class="text-sm"><strong>Nadia El Fassi</strong><br>Patiente</span></figcaption>
      </figure>
    </div>
  </section>

  <!-- Tarifs -->
  <section id="tarifs" class="px-5 pb-20 sm:px-10" aria-labelledby="t-tar">
    <h2 id="t-tar" class="reveal font-serif text-5xl leading-[0.98] tracking-tight sm:text-6xl">Des tarifs simples</h2>
    <div class="mt-10 grid gap-4 md:grid-cols-3">
      <article class="reveal rounded-3xl border border-neutral-200 p-7">
        <h3 class="font-serif text-3xl">Essentiel</h3>
        <p class="mt-3 text-sm text-neutral-600">Pour les cabinets de petite taille.</p>
        <p class="mt-6 font-serif text-5xl">490 <span class="font-sans text-sm text-neutral-500">MAD / mois</span></p>
        <ul class="mt-6 space-y-2 text-sm text-neutral-700"><li>Jusqu'à 3 médecins</li><li>Planning et rendez-vous</li><li>Rappels par e-mail</li></ul>
        <a href="register" class="mt-8 inline-block rounded-full border border-black px-6 py-3 text-xs font-medium tracking-widest uppercase hover:bg-neutral-100">Commencer</a>
      </article>
      <article class="reveal rounded-3xl bg-black p-7 text-white">
        <h3 class="font-serif text-3xl">Clinique</h3>
        <p class="mt-3 text-sm text-neutral-300">Pour les cliniques en croissance.</p>
        <p class="mt-6 font-serif text-5xl">1 290 <span class="font-sans text-sm text-neutral-400">MAD / mois</span></p>
        <ul class="mt-6 space-y-2 text-sm text-neutral-200"><li>Jusqu'à 15 médecins</li><li>Notes médicales sécurisées</li><li>Statistiques et journal d'audit</li></ul>
        <a href="register" class="mt-8 inline-block rounded-full bg-white px-6 py-3 text-xs font-medium tracking-widest text-black uppercase hover:bg-neutral-200">Choisir cette offre</a>
      </article>
      <article class="reveal rounded-3xl border border-neutral-200 p-7">
        <h3 class="font-serif text-3xl">Réseau</h3>
        <p class="mt-3 text-sm text-neutral-600">Pour les groupes multi-sites.</p>
        <p class="mt-6 font-serif text-5xl">Sur devis</p>
        <ul class="mt-6 space-y-2 text-sm text-neutral-700"><li>Médecins illimités</li><li>Plusieurs sites</li><li>Accompagnement dédié</li></ul>
        <a href="#contact" class="mt-8 inline-block rounded-full border border-black px-6 py-3 text-xs font-medium tracking-widest uppercase hover:bg-neutral-100">Nous contacter</a>
      </article>
    </div>
  </section>

  <!-- FAQ -->
  <section id="faq" class="px-5 pb-20 sm:px-10" aria-labelledby="t-faq">
    <h2 id="t-faq" class="reveal font-serif text-5xl leading-[0.98] tracking-tight sm:text-6xl">Questions fréquentes</h2>
    <div class="mt-10 divide-y divide-neutral-200 border-y border-neutral-200" id="faq-list">
      <div>
        <h3><button type="button" aria-expanded="false" aria-controls="faq-1" class="flex w-full items-center justify-between gap-4 py-5 text-left text-base font-medium">Comment fonctionne la détection de conflits ?<span class="text-2xl transition" aria-hidden="true">+</span></button></h3>
        <div id="faq-1" class="hidden pb-5 text-sm leading-relaxed text-neutral-600">Avant chaque confirmation, le système vérifie la disponibilité du médecin, de la salle et du patient. Un créneau déjà pris n'est jamais proposé.</div>
      </div>
      <div>
        <h3><button type="button" aria-expanded="false" aria-controls="faq-2" class="flex w-full items-center justify-between gap-4 py-5 text-left text-base font-medium">Qui peut lire les notes médicales ?<span class="text-2xl transition" aria-hidden="true">+</span></button></h3>
        <div id="faq-2" class="hidden pb-5 text-sm leading-relaxed text-neutral-600">Uniquement les profils autorisés. Chaque consultation ou modification est enregistrée dans le journal d'audit.</div>
      </div>
      <div>
        <h3><button type="button" aria-expanded="false" aria-controls="faq-3" class="flex w-full items-center justify-between gap-4 py-5 text-left text-base font-medium">Faut-il installer un logiciel ?<span class="text-2xl transition" aria-hidden="true">+</span></button></h3>
        <div id="faq-3" class="hidden pb-5 text-sm leading-relaxed text-neutral-600">Non. Clinic Manager fonctionne dans le navigateur, sur ordinateur, tablette et téléphone.</div>
      </div>
      <div>
        <h3><button type="button" aria-expanded="false" aria-controls="faq-4" class="flex w-full items-center justify-between gap-4 py-5 text-left text-base font-medium">Les patients peuvent-ils réserver eux-mêmes ?<span class="text-2xl transition" aria-hidden="true">+</span></button></h3>
        <div id="faq-4" class="hidden pb-5 text-sm leading-relaxed text-neutral-600">Oui. Après inscription, le patient choisit un médecin, un créneau libre et reçoit une confirmation avec rappel.</div>
      </div>
      <div>
        <h3><button type="button" aria-expanded="false" aria-controls="faq-5" class="flex w-full items-center justify-between gap-4 py-5 text-left text-base font-medium">Puis-je changer de formule plus tard ?<span class="text-2xl transition" aria-hidden="true">+</span></button></h3>
        <div id="faq-5" class="hidden pb-5 text-sm leading-relaxed text-neutral-600">Oui, à tout moment. Vos données et vos plannings sont conservés lors du changement.</div>
      </div>
    </div>
  </section>

  <!-- Bandeau final -->
  <section class="px-5 pb-10 sm:px-10" aria-labelledby="t-cta">
    <div class="reveal rounded-3xl bg-black px-6 py-14 text-center text-white sm:px-12 sm:py-20">
      <h2 id="t-cta" class="mx-auto max-w-2xl font-serif text-5xl leading-[0.98] tracking-tight sm:text-6xl">Prêt à moderniser votre clinique ?</h2>
      <p class="mx-auto mt-5 max-w-md text-sm text-neutral-300">Créez votre compte en quelques minutes et organisez votre première semaine de rendez-vous.</p>
      <div class="mt-8 flex flex-wrap justify-center gap-3">
        <a href="register" class="rounded-full bg-white px-7 py-3.5 text-xs font-medium tracking-widest text-black uppercase hover:bg-neutral-200">Register</a>
        <a href="login" class="rounded-full border border-white px-7 py-3.5 text-xs font-medium tracking-widest uppercase hover:bg-white/10">Login</a>
      </div>
    </div>
  </section>

  </main>

  <!-- Footer -->
  <footer id="contact" class="border-t border-neutral-200 px-5 py-10 text-sm sm:px-10">
    <div class="grid gap-8 md:grid-cols-4">
      <div class="md:col-span-1">
        <p class="font-semibold tracking-widest">CLINIC MANAGER</p>
        <p class="mt-3 text-neutral-600">La gestion de clinique, simple et fiable.</p>
      </div>
      <nav aria-label="Produit"><p class="font-semibold">Produit</p><ul class="mt-3 space-y-2 text-neutral-600"><li><a href="#fonctionnalites" class="hover:text-black">Fonctionnalités</a></li><li><a href="#tarifs" class="hover:text-black">Tarifs</a></li><li><a href="#faq" class="hover:text-black">FAQ</a></li></ul></nav>
      <div><p class="font-semibold">Contact</p><ul class="mt-3 space-y-2 text-neutral-600"><li><a href="mailto:contact@clinic-manager.example" class="hover:text-black">contact@clinic-manager.example</a></li><li>+212 5 00 00 00 00</li></ul></div>
      <nav aria-label="Réseaux sociaux"><p class="font-semibold">Suivez-nous</p><ul class="mt-3 space-y-2 text-neutral-600"><li><a href="#" class="hover:text-black">LinkedIn</a></li><li><a href="#" class="hover:text-black">Facebook</a></li><li><a href="#" class="hover:text-black">Instagram</a></li></ul></nav>
    </div>
    <p class="mt-10 text-xs text-neutral-500">© 2026 Clinic Manager. Tous droits réservés.</p>
  </footer>
</div>

<script>
  (function () {
    var reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

    // Menu burger
    var burger = document.getElementById('burger');
    var menu = document.getElementById('mobile-menu');
    burger.addEventListener('click', function () {
      var open = menu.classList.toggle('hidden') === false;
      burger.setAttribute('aria-expanded', String(open));
    });
    menu.addEventListener('click', function (e) {
      if (e.target.tagName === 'A') { menu.classList.add('hidden'); burger.setAttribute('aria-expanded', 'false'); }
    });

    // Fade-up au scroll
    var items = document.querySelectorAll('.reveal');
    if (reduce || !('IntersectionObserver' in window)) {
      items.forEach(function (el) { el.classList.add('in'); });
    } else {
      var io = new IntersectionObserver(function (entries) {
        entries.forEach(function (en) {
          if (en.isIntersecting) { en.target.classList.add('in'); io.unobserve(en.target); }
        });
      }, { threshold: 0.12 });
      items.forEach(function (el) { io.observe(el); });
    }

    // Compteurs animés
    var counters = document.querySelectorAll('[data-count]');
    function run(el) {
      var target = parseInt(el.getAttribute('data-count'), 10);
      var suffix = el.getAttribute('data-suffix') || '';
      if (reduce) { el.textContent = target + suffix; return; }
      var start = null;
      function step(t) {
        if (start === null) start = t;
        var p = Math.min((t - start) / 1400, 1);
        el.textContent = Math.round(target * (1 - Math.pow(1 - p, 3))) + suffix;
        if (p < 1) requestAnimationFrame(step);
      }
      requestAnimationFrame(step);
    }
    if ('IntersectionObserver' in window) {
      var co = new IntersectionObserver(function (entries) {
        entries.forEach(function (en) {
          if (en.isIntersecting) { run(en.target); co.unobserve(en.target); }
        });
      }, { threshold: 0.5 });
      counters.forEach(function (c) { co.observe(c); });
    }

    // Accordéon FAQ
    document.querySelectorAll('#faq-list button').forEach(function (btn) {
      btn.addEventListener('click', function () {
        var panel = document.getElementById(btn.getAttribute('aria-controls'));
        var open = btn.getAttribute('aria-expanded') === 'true';
        btn.setAttribute('aria-expanded', String(!open));
        panel.classList.toggle('hidden', open);
        btn.querySelector('span').textContent = open ? '+' : '−';
      });
    });
  })();
</script>
</body>
</html>