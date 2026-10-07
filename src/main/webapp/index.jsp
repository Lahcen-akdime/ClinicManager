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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
</head>
<body>
<a href="#contenu" class="skip-link">Aller au contenu</a>

<div class="page">

  <!-- Navbar -->
  <header class="site-header">
    <nav class="navbar" aria-label="Navigation principale">
      <a href="#accueil" class="brand">
        <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><path d="M12 2v20M3.3 7l17.4 10M3.3 17L20.7 7"/></svg>
        <span class="brand-name">CLINIC MANAGER</span>
      </a>
      <ul class="nav-links">
        <li><a href="#accueil" class="is-active">Accueil</a></li>
        <li><a href="#fonctionnalites">Fonctionnalités</a></li>
        <li><a href="#fonctionnement">Fonctionnement</a></li>
        <li><a href="#securite">Sécurité</a></li>
        <li><a href="#tarifs">Tarifs</a></li>
        <li><a href="#faq">FAQ</a></li>
      </ul>
      <div class="nav-actions">
        <a href="#fonctionnalites" aria-label="Rechercher une fonctionnalité" class="btn-round btn-round--search">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><circle cx="11" cy="11" r="7"/><path d="M20 20l-3.5-3.5"/></svg>
        </a>
        <a href="login" class="btn-outline-sm">Login</a>
        <a href="register" class="btn-dark-sm">Register</a>
        <button id="burger" type="button" aria-label="Ouvrir le menu" aria-expanded="false" aria-controls="mobile-menu" class="btn-round btn-round--burger">
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><path d="M4 7h16M4 12h16M4 17h16"/></svg>
        </button>
      </div>
    </nav>
    <div id="mobile-menu" class="mobile-menu">
      <ul>
        <li><a href="#accueil" class="is-strong">Accueil</a></li>
        <li><a href="#fonctionnalites">Fonctionnalités</a></li>
        <li><a href="#fonctionnement">Fonctionnement</a></li>
        <li><a href="#securite">Sécurité</a></li>
        <li><a href="#tarifs">Tarifs</a></li>
        <li><a href="#faq">FAQ</a></li>
        <li><a href="login" class="is-strong">Login</a></li>
      </ul>
    </div>
  </header>

  <main id="contenu">

    <!-- Hero -->
    <section id="accueil" class="hero">
      <div class="reveal">
        <h1 class="hero-title">Une clinique sereine, un parcours de soin sans accroc.</h1>
        <p class="text-soft hero-text">Clinic Manager réunit plannings médicaux, rendez-vous sans conflit et notes médicales sécurisées dans un seul espace. Votre équipe gagne du temps, vos patients sont mieux accompagnés.</p>
        <div class="hero-cta">
          <a href="register" class="btn-primary">Créer mon compte</a>
          <a href="#fonctionnalites" class="link-underline">Trouver un médecin</a>
        </div>
      </div>
      <div class="reveal hero-media">
        <div class="photo-frame zoom">
          <img src="${pageContext.request.contextPath}/images/hero-doctor-family.jpg" width="800" height="800" fetchpriority="high" alt="Médecin souriant avec stéthoscope tenant un presse-papier, accompagnée d'une mère et de sa petite fille">
        </div>
        <a href="#fonctionnalites" aria-label="Explorer les services" class="badge-circle">
          <svg viewBox="0 0 100 100" class="badge-ring spin-slow" aria-hidden="true"><defs><path id="circ" d="M50,50 m-38,0 a38,38 0 1,1 76,0 a38,38 0 1,1 -76,0"/></defs><text font-size="9.5" letter-spacing="2.2" fill="#171717" font-family="Inter"><textPath href="#circ">••• EXPLORER ••• LES ••• SERVICES </textPath></text></svg>
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M7 17L17 7M8 7h9v9"/></svg>
        </a>
      </div>
    </section>

    <!-- Stats -->
    <section class="stats" aria-label="Chiffres clés">
      <div class="reveal stat-card stat-card--butter">
        <p class="stat-number-lg"><span data-count="2148">2148</span></p>
        <div>
          <p class="stat-label">Patients ont fait un pas vers leur bien-être</p>
          <div class="avatars">
            <img src="${pageContext.request.contextPath}/images/avatar-1.jpg" width="40" height="40" loading="lazy" alt="Portrait d'une patiente" class="avatar">
            <img src="${pageContext.request.contextPath}/images/avatar-2.jpg" width="40" height="40" loading="lazy" alt="Portrait d'un patient" class="avatar">
            <img src="${pageContext.request.contextPath}/images/avatar-3.jpg" width="40" height="40" loading="lazy" alt="Portrait d'une patiente souriante" class="avatar">
          </div>
        </div>
      </div>
      <div class="reveal stat-card stat-card--outline">
        <p class="stat-number-md"><span data-count="800" data-suffix="+">800+</span></p>
        <p class="stat-label">Utilisateurs mis en relation avec un médecin aujourd'hui</p>
      </div>
    </section>

    <!-- Cartes photo -->
    <section class="cards" aria-label="Aperçu de nos services">
      <figure class="reveal photo-card zoom">
        <img src="${pageContext.request.contextPath}/images/card-seniors.jpg" width="600" height="800" loading="lazy" alt="Patient âgé marchant avec un déambulateur accompagné d'une soignante">
        <figcaption class="photo-caption">Un suivi attentif pour les patients externes et les seniors</figcaption>
      </figure>
      <figure class="reveal photo-card zoom">
        <img src="${pageContext.request.contextPath}/images/card-pediatrics.jpg" width="600" height="800" loading="lazy" alt="Pédiatre en blouse bleue examinant une enfant avec le sourire">
        <a href="#fonctionnalites" aria-label="Découvrir la pédiatrie" class="photo-arrow">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M7 17L17 7M8 7h9v9"/></svg>
        </a>
        <figcaption class="photo-caption">Pédiatrie</figcaption>
      </figure>
      <article class="reveal quote-card">
        <div>
          <h2 class="quote-title">Ce que disent nos patients</h2>
          <p>Plus d'attente inutile : mon rendez-vous est confirmé, mes rappels arrivent à temps et mon médecin connaît mon dossier.</p>
        </div>
        <div>
          <div class="quote-meta">
            <div class="avatars avatars--sm">
              <img src="${pageContext.request.contextPath}/images/avatar-1.jpg" width="32" height="32" loading="lazy" alt="Avatar patient" class="avatar avatar--sm">
              <img src="${pageContext.request.contextPath}/images/avatar-2.jpg" width="32" height="32" loading="lazy" alt="Avatar patient" class="avatar avatar--sm">
            </div>
            <span class="quote-tag">Avis</span>
          </div>
          <p class="quote-mark" aria-hidden="true">”</p>
        </div>
      </article>
      <figure class="reveal photo-card zoom">
        <img src="${pageContext.request.contextPath}/images/card-team.jpg" width="600" height="800" loading="lazy" alt="Équipe médicale diverse de six soignants en blouses colorées">
        <figcaption class="photo-caption">Des médecins qui prennent soin de vous</figcaption>
      </figure>
    </section>

    <!-- Chemin vers le bien-être -->
    <section class="path">
      <h2 class="reveal title-xl">Le chemin vers un bien-être complet</h2>
      <div class="reveal">
        <p class="text-soft">De la première prise de rendez-vous au suivi des consultations, chaque étape est coordonnée. Les équipes se concentrent sur le soin, la plateforme s'occupe de l'organisation.</p>
        <a href="register" class="btn-primary">Prendre rendez-vous</a>
      </div>
    </section>

    <!-- Fonctionnalités -->
    <section id="fonctionnalites" class="section" aria-labelledby="t-fonc">
      <h2 id="t-fonc" class="reveal title-xl section-title-wide">Tout ce qu'il faut pour piloter votre clinique</h2>
      <div class="bento">
        <article class="reveal feature-card feature-card--butter feature-card--medium span-4">
          <h3>Planning médical intelligent</h3>
          <p>Disponibilités, congés, salles et durées de consultation : le planning de chaque médecin se met à jour en temps réel et reste lisible d'un coup d'œil.</p>
        </article>
        <article class="reveal feature-card feature-card--dark span-2">
          <h3>Rendez-vous sans conflit</h3>
          <p>Détection automatique des doubles réservations, avant même la confirmation.</p>
        </article>
        <article class="reveal feature-card feature-card--outline span-2">
          <h3>Notes médicales sécurisées</h3>
          <p>Accès par rôle, historique des modifications et traçabilité complète.</p>
        </article>
        <article class="reveal feature-card feature-card--peach span-2">
          <h3>Parcours de soin centralisé</h3>
          <p>Consultations, prescriptions et suivis réunis dans un dossier unique par patient.</p>
        </article>
        <article class="reveal feature-card feature-card--outline span-2">
          <h3>Rappels automatiques</h3>
          <p>Moins d'absences grâce aux rappels envoyés avant chaque rendez-vous.</p>
        </article>
        <article class="reveal feature-card feature-card--butter feature-card--wide span-6">
          <h3>Statistiques d'activité</h3>
          <p>Taux d'occupation, rendez-vous annulés, durée moyenne des consultations : des indicateurs clairs pour ajuster l'organisation de votre clinique.</p>
        </article>
      </div>
    </section>

    <!-- Comment ça marche -->
    <section id="fonctionnement" class="section" aria-labelledby="t-how">
      <h2 id="t-how" class="reveal title-xl">Comment ça marche</h2>
      <ol class="steps">
        <li class="reveal step"><span class="step-number" aria-hidden="true">1</span><h3>Créez votre compte</h3><p>Inscrivez votre clinique et invitez médecins, secrétaires et patients avec le rôle adapté.</p></li>
        <li class="reveal step"><span class="step-number" aria-hidden="true">2</span><h3>Définissez les plannings</h3><p>Horaires, spécialités et durées de consultation sont configurés une seule fois.</p></li>
        <li class="reveal step"><span class="step-number" aria-hidden="true">3</span><h3>Réservez sans conflit</h3><p>Seuls les créneaux réellement libres sont proposés, avec rappel automatique.</p></li>
        <li class="reveal step"><span class="step-number" aria-hidden="true">4</span><h3>Suivez chaque patient</h3><p>Les notes médicales sont consignées en sécurité et accessibles aux bonnes personnes.</p></li>
      </ol>
    </section>

    <!-- Planning (mockup) -->
    <section class="plan" aria-labelledby="t-plan">
      <div class="reveal plan-intro">
        <h2 id="t-plan" class="title-md">Votre semaine, enfin lisible</h2>
        <p class="text-soft">Chaque médecin, chaque salle, chaque créneau. Les couleurs distinguent les types de consultation et les chevauchements sont bloqués.</p>
      </div>
      <div class="reveal plan-card">
        <div class="plan-head">
          <p class="plan-name">Dr. Amrani — semaine 41</p>
          <span class="plan-pill">0 conflit</span>
        </div>
        <div class="plan-scroll">
          <div class="plan-grid" role="table" aria-label="Planning hebdomadaire d'exemple">
            <div></div>
            <div class="plan-day">Lun</div><div class="plan-day">Mar</div><div class="plan-day">Mer</div><div class="plan-day">Jeu</div><div class="plan-day">Ven</div>
            <div class="plan-time">09:00</div>
            <div class="slot slot--yellow">Consultation<br><span>S. Benali</span></div><div class="slot slot--empty"></div><div class="slot slot--rose">Suivi<br><span>M. Idrissi</span></div><div class="slot slot--empty"></div><div class="slot slot--orange">Pédiatrie<br><span>L. Tazi</span></div>
            <div class="plan-time">10:30</div>
            <div class="slot slot--empty"></div><div class="slot slot--sky">Bilan<br><span>A. Filali</span></div><div class="slot slot--empty"></div><div class="slot slot--yellow">Consultation<br><span>K. Naciri</span></div><div class="slot slot--empty"></div>
            <div class="plan-time">14:00</div>
            <div class="slot slot--rose">Suivi<br><span>H. Berrada</span></div><div class="slot slot--orange">Pédiatrie<br><span>Y. Chraibi</span></div><div class="slot slot--sky">Bilan<br><span>N. Alaoui</span></div><div class="slot slot--empty"></div><div class="slot slot--yellow">Consultation<br><span>R. Saidi</span></div>
          </div>
        </div>
      </div>
    </section>

    <!-- Sécurité -->
    <section id="securite" class="section" aria-labelledby="t-sec">
      <div class="reveal security-box">
        <div>
          <h2 id="t-sec" class="title-md">Sécurité et confidentialité</h2>
          <p class="text-soft">Les données de santé méritent le plus grand soin. Les informations sont chiffrées et chaque accès est enregistré.</p>
        </div>
        <ul class="security-list">
          <li><strong>Chiffrement</strong>Données protégées en transit et au repos.</li>
          <li><strong>Rôles distincts</strong>Admin, Médecin, Secrétaire et Patient.</li>
          <li><strong>Journal d'audit</strong>Qui a consulté ou modifié quoi, et quand.</li>
          <li><strong>Accès limité</strong>Chaque profil ne voit que le nécessaire.</li>
        </ul>
      </div>
    </section>

    <!-- Témoignages -->
    <section class="section" aria-labelledby="t-tem">
      <h2 id="t-tem" class="reveal title-xl">Ils font confiance à Clinic Manager</h2>
      <div class="testimonials">
        <figure class="reveal testimonial testimonial--gradient">
          <blockquote>Les doubles réservations ont disparu. Le secrétariat gagne près d'une heure chaque matin.</blockquote>
          <figcaption><img src="${pageContext.request.contextPath}/images/avatar-1.jpg" width="40" height="40" loading="lazy" alt="Portrait de Dr Salma Amrani" class="avatar avatar--plain"><span><strong>Dr Salma Amrani</strong><br>Médecin généraliste</span></figcaption>
        </figure>
        <figure class="reveal testimonial testimonial--butter">
          <blockquote>Les rappels automatiques ont nettement réduit les absences. Nos patients se sentent mieux suivis.</blockquote>
          <figcaption><img src="${pageContext.request.contextPath}/images/avatar-2.jpg" width="40" height="40" loading="lazy" alt="Portrait de Karim Benjelloun" class="avatar avatar--plain"><span><strong>Karim Benjelloun</strong><br>Directeur de clinique</span></figcaption>
        </figure>
        <figure class="reveal testimonial testimonial--outline">
          <blockquote>Je prends rendez-vous en quelques clics et je retrouve l'historique de mes consultations.</blockquote>
          <figcaption><img src="${pageContext.request.contextPath}/images/avatar-3.jpg" width="40" height="40" loading="lazy" alt="Portrait de Nadia El Fassi" class="avatar avatar--plain"><span><strong>Nadia El Fassi</strong><br>Patiente</span></figcaption>
        </figure>
      </div>
    </section>

    <!-- Tarifs -->
    <section id="tarifs" class="section" aria-labelledby="t-tar">
      <h2 id="t-tar" class="reveal title-xl">Des tarifs simples</h2>
      <div class="pricing">
        <article class="reveal price-card">
          <h3>Essentiel</h3>
          <p class="price-desc">Pour les cabinets de petite taille.</p>
          <p class="price">490 <small>MAD / mois</small></p>
          <ul class="price-list"><li>Jusqu'à 3 médecins</li><li>Planning et rendez-vous</li><li>Rappels par e-mail</li></ul>
          <a href="register" class="btn-outline-pill">Commencer</a>
        </article>
        <article class="reveal price-card price-card--dark">
          <h3>Clinique</h3>
          <p class="price-desc">Pour les cliniques en croissance.</p>
          <p class="price">1 290 <small>MAD / mois</small></p>
          <ul class="price-list"><li>Jusqu'à 15 médecins</li><li>Notes médicales sécurisées</li><li>Statistiques et journal d'audit</li></ul>
          <a href="register" class="btn-white-pill">Choisir cette offre</a>
        </article>
        <article class="reveal price-card">
          <h3>Réseau</h3>
          <p class="price-desc">Pour les groupes multi-sites.</p>
          <p class="price">Sur devis</p>
          <ul class="price-list"><li>Médecins illimités</li><li>Plusieurs sites</li><li>Accompagnement dédié</li></ul>
          <a href="#contact" class="btn-outline-pill">Nous contacter</a>
        </article>
      </div>
    </section>

    <!-- FAQ -->
    <section id="faq" class="section" aria-labelledby="t-faq">
      <h2 id="t-faq" class="reveal title-xl">Questions fréquentes</h2>
      <div class="faq-list" id="faq-list">
        <div class="faq-item">
          <h3><button type="button" aria-expanded="false" aria-controls="faq-1" class="faq-question">Comment fonctionne la détection de conflits ?<span class="faq-icon" aria-hidden="true">+</span></button></h3>
          <div id="faq-1" class="faq-panel">Avant chaque confirmation, le système vérifie la disponibilité du médecin, de la salle et du patient. Un créneau déjà pris n'est jamais proposé.</div>
        </div>
        <div class="faq-item">
          <h3><button type="button" aria-expanded="false" aria-controls="faq-2" class="faq-question">Qui peut lire les notes médicales ?<span class="faq-icon" aria-hidden="true">+</span></button></h3>
          <div id="faq-2" class="faq-panel">Uniquement les profils autorisés. Chaque consultation ou modification est enregistrée dans le journal d'audit.</div>
        </div>
        <div class="faq-item">
          <h3><button type="button" aria-expanded="false" aria-controls="faq-3" class="faq-question">Faut-il installer un logiciel ?<span class="faq-icon" aria-hidden="true">+</span></button></h3>
          <div id="faq-3" class="faq-panel">Non. Clinic Manager fonctionne dans le navigateur, sur ordinateur, tablette et téléphone.</div>
        </div>
        <div class="faq-item">
          <h3><button type="button" aria-expanded="false" aria-controls="faq-4" class="faq-question">Les patients peuvent-ils réserver eux-mêmes ?<span class="faq-icon" aria-hidden="true">+</span></button></h3>
          <div id="faq-4" class="faq-panel">Oui. Après inscription, le patient choisit un médecin, un créneau libre et reçoit une confirmation avec rappel.</div>
        </div>
        <div class="faq-item">
          <h3><button type="button" aria-expanded="false" aria-controls="faq-5" class="faq-question">Puis-je changer de formule plus tard ?<span class="faq-icon" aria-hidden="true">+</span></button></h3>
          <div id="faq-5" class="faq-panel">Oui, à tout moment. Vos données et vos plannings sont conservés lors du changement.</div>
        </div>
      </div>
    </section>

    <!-- Bandeau final -->
    <section class="cta-wrap" aria-labelledby="t-cta">
      <div class="reveal cta">
        <h2 id="t-cta" class="title-xl">Prêt à moderniser votre clinique ?</h2>
        <p>Créez votre compte en quelques minutes et organisez votre première semaine de rendez-vous.</p>
        <div class="cta-buttons">
          <a href="register" class="btn-white-pill">Register</a>
          <a href="login" class="btn-ghost-pill">Login</a>
        </div>
      </div>
    </section>

  </main>

  <!-- Footer -->
  <footer id="contact" class="site-footer">
    <div class="footer-grid">
      <div>
        <p class="footer-brand">CLINIC MANAGER</p>
        <p class="footer-text">La gestion de clinique, simple et fiable.</p>
      </div>
      <nav aria-label="Produit"><p class="footer-title">Produit</p><ul class="footer-list"><li><a href="#fonctionnalites">Fonctionnalités</a></li><li><a href="#tarifs">Tarifs</a></li><li><a href="#faq">FAQ</a></li></ul></nav>
      <div><p class="footer-title">Contact</p><ul class="footer-list"><li><a href="mailto:contact@clinic-manager.example">contact@clinic-manager.example</a></li><li>+212 5 00 00 00 00</li></ul></div>
      <nav aria-label="Réseaux sociaux"><p class="footer-title">Suivez-nous</p><ul class="footer-list"><li><a href="#">LinkedIn</a></li><li><a href="#">Facebook</a></li><li><a href="#">Instagram</a></li></ul></nav>
    </div>
    <p class="copyright">© 2026 Clinic Manager. Tous droits réservés.</p>
  </footer>
</div>

<script>
  (function () {
    var reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

    // Menu burger
    var burger = document.getElementById('burger');
    var menu = document.getElementById('mobile-menu');
    burger.addEventListener('click', function () {
      var open = menu.classList.toggle('is-open');
      burger.setAttribute('aria-expanded', String(open));
    });
    menu.addEventListener('click', function (e) {
      if (e.target.tagName === 'A') { menu.classList.remove('is-open'); burger.setAttribute('aria-expanded', 'false'); }
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
        panel.classList.toggle('is-open', !open);
        btn.querySelector('.faq-icon').textContent = open ? '+' : '−';
      });
    });
  })();
</script>
</body>
</html>