<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Clinic Manager — L’espace de travail des médecins</title>
    <meta name="description" content="Gérez votre agenda, vos disponibilités, vos rendez-vous et vos notes médicales dans un espace sécurisé conçu pour les médecins.">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Instrument+Serif:ital@0;1&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
</head>
<body>
<a href="#contenu" class="skip-link">Aller au contenu</a>
<div class="page">
    <!-- HEADER -->
    <header class="site-header">
        <nav class="navbar" aria-label="Navigation principale">
            <a href="#accueil" class="brand" aria-label="Clinic Manager — Accueil">
                <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true">
                    <path d="M12 3v18"/>
                    <path d="M3 12h18"/>
                    <path d="M5 5l14 14"/>
                    <path d="M19 5L5 19"/>
                </svg>
                <span class="brand-name">CLINIC MANAGER</span>
            </a>
            <ul class="nav-links">
                <li><a href="#accueil" class="is-active">Accueil</a></li>
                <li><a href="#disponibilites">Disponibilités</a></li>
                <li><a href="#absences">Absences</a></li>
                <li><a href="#rendez-vous">Rendez-vous</a></li>
            </ul>
            <div class="nav-actions">
                <a href="#rendez-vous" class="btn-round btn-round--search" aria-label="Voir mes rendez-vous">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true">
                        <circle cx="11" cy="11" r="7"/>
                        <path d="M20 20l-3.5-3.5"/>
                    </svg>
                </a>
                <a href="${pageContext.request.contextPath}/logout" class="btn-outline-sm">Logout</a>
                <button id="burger" type="button" aria-label="Ouvrir le menu" aria-expanded="false" aria-controls="mobile-menu" class="btn-round btn-round--burger">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true">
                        <path d="M4 7h16"/>
                        <path d="M4 12h16"/>
                        <path d="M4 17h16"/>
                    </svg>
                </button>
            </div>
        </nav>
        <div id="mobile-menu" class="mobile-menu">
            <ul>
                <li><a href="#accueil" class="is-strong">Accueil</a></li>
                <li><a href="#disponibilites">Disponibilités</a></li>
                <li><a href="#absences">Absences</a></li>
                <li><a href="#rendez-vous">Rendez-vous</a></li>
                <li><a href="${pageContext.request.contextPath}/logout" class="is-strong">Logout</a></li>
            </ul>
        </div>
    </header>

    <main id="contenu">
        <!-- HERO -->
        <section id="accueil" class="hero">
            <div class="reveal">
                <p class="eyebrow">ESPACE MÉDECIN</p>
                <h1 class="hero-title">Votre pratique médicale, enfin parfaitement organisée.</h1>
                <p class="text-soft hero-text">Clinic Manager vous accompagne au quotidien pour gérer votre agenda, vos disponibilités, vos rendez-vous et vos notes médicales depuis un seul espace sécurisé.</p>
                <div class="hero-cta">
                    <a href="#fonctionnalites" class="btn-primary">Découvrir la plateforme</a>
                    <a href="${pageContext.request.contextPath}/login" class="link-underline">Se connecter</a>
                </div>
            </div>
            <div class="reveal hero-media">
                <div class="photo-frame zoom">
                    <img src="${pageContext.request.contextPath}/images/patients.jpg" width="800" height="800" fetchpriority="high" alt="Médecin consultant son organisation dans un environnement clinique moderne">
                </div>
                <a href="#fonctionnalites" aria-label="Découvrir les fonctionnalités médecin" class="badge-circle">
                    <svg viewBox="0 0 100 100" class="badge-ring spin-slow" aria-hidden="true">
                        <defs>
                            <path id="doctorCircle" d="M50,50 m-38,0 a38,38 0 1,1 76,0 a38,38 0 1,1 -76,0"/>
                        </defs>
                        <text font-size="9.5" letter-spacing="2.2" fill="#171717" font-family="Inter">
                            <textPath href="#doctorCircle">••• ESPACE ••• MÉDECIN •••</textPath>
                        </text>
                    </svg>
                    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                        <path d="M7 17L17 7"/>
                        <path d="M8 7h9v9"/>
                    </svg>
                </a>
            </div>
        </section>

        <!-- STATISTIQUES -->
        <section class="stats" aria-label="Aperçu des bénéfices pour le médecin">
            <div class="reveal stat-card stat-card--butter">
                <p class="stat-number-lg">0</p>
                <div>
                    <p class="stat-label">Conflit d'agenda dans l'aperçu actuel</p>
                    <div class="avatars">
                        <img src="${pageContext.request.contextPath}/images/avatar-1.jpg" width="40" height="40" loading="lazy" alt="Patient exemple" class="avatar">
                        <img src="${pageContext.request.contextPath}/images/avatar-2.jpg" width="40" height="40" loading="lazy" alt="Patient exemple" class="avatar">
                        <img src="${pageContext.request.contextPath}/images/avatar-3.jpg" width="40" height="40" loading="lazy" alt="Patient exemple" class="avatar">
                    </div>
                </div>
            </div>
            <div class="reveal stat-card stat-card--outline">
                <p class="stat-number-md">24</p>
                <p class="stat-label">Créneaux disponibles dans cette semaine d'exemple</p>
            </div>
        </section>

        <!-- FONCTIONNALITÉS -->
        <section id="fonctionnalites" class="section" aria-labelledby="t-fonc">
            <h2 id="t-fonc" class="reveal title-xl section-title-wide">Tout votre quotidien médical dans un seul espace.</h2>
            <div class="bento">
                <article class="reveal feature-card feature-card--butter feature-card--medium span-4">
                    <h3>Mon agenda</h3>
                    <p>Visualisez votre semaine, vos consultations et vos suivis dans une vue claire. Les rendez-vous sont organisés autour de vos disponibilités.</p>
                </article>
                <article id="disponibilites" class="reveal feature-card feature-card--dark span-2">
                    <h3>Mes disponibilités</h3>
                    <p>Définissez vos horaires, pauses, congés et périodes d'absence afin que seuls les créneaux réellement disponibles puissent être proposés.</p>
                </article>
                <article id="rendez-vous" class="reveal feature-card feature-card--outline span-2">
                    <h3>Rendez-vous sans chevauchement</h3>
                    <p>Le système vérifie automatiquement les créneaux occupés afin de limiter les doubles réservations.</p>
                </article>
                <article class="reveal feature-card feature-card--peach span-2">
                    <h3>Notes médicales</h3>
                    <p>Ajoutez votre note après une consultation terminée puis validez-la. Une note validée devient consultable sans modification.</p>
                </article>
                <article class="reveal feature-card feature-card--outline span-2">
                    <h3>Accès sécurisé par rôle</h3>
                    <p>Le médecin accède uniquement aux informations nécessaires à son activité et à son rôle.</p>
                </article>
                <article class="reveal feature-card feature-card--butter feature-card--wide span-6">
                    <h3>Historique médical centralisé</h3>
                    <p>Retrouvez les informations utiles du patient, les consultations précédentes et les éléments nécessaires à la continuité du suivi depuis un même dossier.</p>
                </article>
            </div>
        </section>

        <!-- JOURNÉE ORGANISÉE -->
        <section id="agenda" class="plan" aria-labelledby="t-plan">
            <div class="reveal plan-intro">
                <h2 id="t-plan" class="title-md">Une journée mieux organisée.</h2>
                <p class="text-soft">Exemple de planning médecin. Les données présentées ci-dessous sont fictives et servent uniquement à illustrer l'organisation de l'agenda.</p>
            </div>
            <div class="reveal plan-card">
                <div class="plan-head">
                    <p class="plan-name">Exemple — Dr. Amrani</p>
                    <span class="plan-pill">0 conflit</span>
                </div>
                <div class="plan-scroll">
                    <div class="plan-grid" role="table" aria-label="Exemple de planning hebdomadaire médecin">
                        <div></div>
                        <div class="plan-day">Lun</div>
                        <div class="plan-day">Mar</div>
                        <div class="plan-day">Mer</div>
                        <div class="plan-day">Jeu</div>
                        <div class="plan-day">Ven</div>
                        <div class="plan-time">09:00</div>
                        <div class="slot slot--yellow">Consultation<br><span>Patient exemple</span></div>
                        <div class="slot slot--empty"></div>
                        <div class="slot slot--rose">Suivi<br><span>Patient exemple</span></div>
                        <div class="slot slot--empty"></div>
                        <div class="slot slot--orange">Urgent<br><span>Patient exemple</span></div>
                        <div class="plan-time">10:30</div>
                        <div class="slot slot--empty"></div>
                        <div class="slot slot--sky">Consultation<br><span>Patient exemple</span></div>
                        <div class="slot slot--empty"></div>
                        <div class="slot slot--yellow">Suivi<br><span>Patient exemple</span></div>
                        <div class="slot slot--empty"></div>
                        <div class="plan-time">14:00</div>
                        <div class="slot slot--rose">Suivi<br><span>Patient exemple</span></div>
                        <div class="slot slot--orange">Urgent<br><span>Patient exemple</span></div>
                        <div class="slot slot--sky">Consultation<br><span>Patient exemple</span></div>
                        <div class="slot slot--empty"></div>
                        <div class="slot slot--yellow">Consultation<br><span>Patient exemple</span></div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ABSENCES -->
        <section id="absences" class="section" aria-labelledby="t-absence">
            <h2 id="t-absence" class="reveal title-xl">Votre disponibilité, selon votre rythme.</h2>
            <div class="bento">
                <article class="reveal feature-card feature-card--outline span-2">
                    <h3>Horaires</h3>
                    <p>Définissez les jours et horaires pendant lesquels vous acceptez les rendez-vous.</p>
                </article>
                <article class="reveal feature-card feature-card--butter span-2">
                    <h3>Pauses</h3>
                    <p>Réservez automatiquement vos périodes de pause afin qu'elles ne soient jamais proposées aux patients.</p>
                </article>
                <article class="reveal feature-card feature-card--peach span-2">
                    <h3>Absences et congés</h3>
                    <p>Déclarez vos absences afin de garder un agenda cohérent et éviter les réservations pendant vos périodes indisponibles.</p>
                </article>
            </div>
        </section>

        <!-- FONCTIONNEMENT -->
        <section id="fonctionnement" class="section" aria-labelledby="t-how">
            <h2 id="t-how" class="reveal title-xl">Une organisation simple, étape par étape.</h2>
            <ol class="steps">
                <li class="reveal step">
                    <span class="step-number" aria-hidden="true">1</span>
                    <h3>Configurez vos disponibilités</h3>
                    <p>Définissez vos horaires, pauses, absences et périodes de congé.</p>
                </li>
                <li class="reveal step">
                    <span class="step-number" aria-hidden="true">2</span>
                    <h3>Consultez votre agenda</h3>
                    <p>Retrouvez vos rendez-vous et votre organisation quotidienne dans une vue claire.</p>
                </li>
                <li class="reveal step">
                    <span class="step-number" aria-hidden="true">3</span>
                    <h3>Réalisez vos consultations</h3>
                    <p>Consultez les informations nécessaires au suivi du patient pendant votre consultation.</p>
                </li>
                <li class="reveal step">
                    <span class="step-number" aria-hidden="true">4</span>
                    <h3>Ajoutez et validez vos notes</h3>
                    <p>Ajoutez votre note médicale puis validez-la lorsque la consultation est terminée.</p>
                </li>
            </ol>
        </section>

        <!-- SÉCURITÉ -->
        <section id="securite" class="section" aria-labelledby="t-sec">
            <div class="reveal security-box">
                <div>
                    <h2 id="t-sec" class="title-md">Vos données médicales restent protégées.</h2>
                    <p class="text-soft">Clinic Manager sépare les espaces utilisateurs et applique les autorisations selon le rôle. Le médecin dispose uniquement des accès nécessaires à son activité.</p>
                </div>
                <ul class="security-list">
                    <li><strong>Gestion des rôles</strong>Médecin, Patient, Admin et Staff disposent d'espaces et de permissions distincts.</li>
                    <li><strong>Accès limité</strong>Chaque utilisateur accède uniquement aux informations nécessaires à son rôle.</li>
                    <li><strong>Journal d'audit</strong>Les actions importantes peuvent être suivies afin d'améliorer la traçabilité.</li>
                    <li><strong>Notes protégées</strong>Une note médicale validée n'est plus modifiable dans le parcours prévu par l'application.</li>
                    <li><strong>Session sécurisée</strong>L'espace médecin reste séparé des espaces destinés aux autres utilisateurs.</li>
                    <li><strong>Données médicales</strong>Les informations de santé sont traitées avec des contrôles d'accès adaptés.</li>
                </ul>
            </div>
        </section>

        <!-- TÉMOIGNAGE -->
        <section class="section" aria-labelledby="t-tem">
            <h2 id="t-tem" class="reveal title-xl">Pensé pour le quotidien des médecins.</h2>
            <div class="testimonials">
                <figure class="reveal testimonial testimonial--gradient">
                    <blockquote>« Je retrouve rapidement mes rendez-vous, je contrôle mes disponibilités et je n'ai plus besoin de vérifier plusieurs supports pour organiser ma journée. »</blockquote>
                    <figcaption>
                        <img src="${pageContext.request.contextPath}/images/avatar-1.jpg" width="40" height="40" loading="lazy" alt="Portrait d'un médecin exemple" class="avatar avatar--plain">
                        <span><strong>Dr Salma Amrani</strong><br>Médecin généraliste — témoignage d'exemple</span>
                    </figcaption>
                </figure>
                <figure class="reveal testimonial testimonial--butter">
                    <blockquote>« La gestion de mes absences et de mes créneaux est beaucoup plus claire. Je garde la maîtrise de mon agenda tout en facilitant la prise de rendez-vous. »</blockquote>
                    <figcaption>
                        <img src="${pageContext.request.contextPath}/images/avatar-2.jpg" width="40" height="40" loading="lazy" alt="Portrait d'un médecin exemple" class="avatar avatar--plain">
                        <span><strong>Dr Karim Benjelloun</strong><br>Médecin — témoignage d'exemple</span>
                    </figcaption>
                </figure>
                <article class="reveal testimonial testimonial--outline">
                    <blockquote>« Un espace unique pour mon agenda, mes consultations et mes notes médicales. L'organisation de ma journée devient beaucoup plus lisible. »</blockquote>
                    <p class="text-soft">Exemple de présentation d'un retour utilisateur médecin.</p>
                </article>
            </div>
        </section>

        <!-- CTA -->
        <section class="cta-wrap" aria-labelledby="t-cta">
            <div class="reveal cta">
                <h2 id="t-cta" class="title-xl">Reprenez le contrôle de votre journée médicale.</h2>
                <p>Organisez vos disponibilités, consultez votre agenda et gérez vos notes médicales depuis un espace conçu pour votre pratique.</p>
                <div class="cta-buttons">
                    <a href="${pageContext.request.contextPath}/register" class="btn-white-pill">Créer mon compte médecin</a>
                    <a href="${pageContext.request.contextPath}/login" class="btn-ghost-pill">Se connecter</a>
                </div>
            </div>
        </section>
    </main>

    <!-- FOOTER -->
    <footer class="site-footer">
        <div class="footer-grid">
            <div>
                <p class="footer-brand">CLINIC MANAGER</p>
                <p class="footer-text">Votre espace de travail médical, simple et sécurisé.</p>
            </div>
            <nav aria-label="Navigation médecin">
                <p class="footer-title">Mon espace</p>
                <ul class="footer-list">
                    <li><a href="#fonctionnalites">Fonctionnalités</a></li>
                    <li><a href="#disponibilites">Disponibilités</a></li>
                    <li><a href="#rendez-vous">Rendez-vous</a></li>
                </ul>
            </nav>
            <div>
                <p class="footer-title">Sécurité</p>
                <ul class="footer-list">
                    <li><a href="#securite">Protection des données</a></li>
                    <li><a href="#fonctionnement">Fonctionnement</a></li>
                </ul>
            </div>
            <div>
                <p class="footer-title">Compte</p>
                <ul class="footer-list">
                    <li><a href="${pageContext.request.contextPath}/login">Se connecter</a></li>
                    <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
                </ul>
            </div>
        </div>
        <p class="copyright">© 2026 Clinic Manager. Tous droits réservés.</p>
    </footer>
</div>

<script>
    (function () {
        var reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
        var burger = document.getElementById('burger');
        var menu = document.getElementById('mobile-menu');
        if (burger && menu) {
            burger.addEventListener('click', function () {
                var open = menu.classList.toggle('is-open');
                burger.setAttribute('aria-expanded', String(open));
            });
            menu.addEventListener('click', function (e) {
                if (e.target.tagName === 'A') {
                    menu.classList.remove('is-open');
                    burger.setAttribute('aria-expanded', 'false');
                }
            });
        }
        var items = document.querySelectorAll('.reveal');
        if (reduce || !('IntersectionObserver' in window)) {
            items.forEach(function (el) {
                el.classList.add('in');
            });
        } else {
            var io = new IntersectionObserver(function (entries) {
                entries.forEach(function (entry) {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('in');
                        io.unobserve(entry.target);
                    }
                });
            }, { threshold: 0.12 });
            items.forEach(function (el) {
                io.observe(el);
            });
        }
    })();
</script>
</body>
</html>