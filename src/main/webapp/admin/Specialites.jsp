<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex, nofollow">
    <title>Spécialités — Clinic Manager</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Instrument+Serif:ital@0;1" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/departments.css">
</head>
<body class="adm-body">
<svg class="adm-sprite" aria-hidden="true" focusable="false">
    <symbol id="i-dash" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="7" height="9" rx="2"/><rect x="14" y="3" width="7" height="5" rx="2"/><rect x="14" y="12" width="7" height="9" rx="2"/><rect x="3" y="16" width="7" height="5" rx="2"/></g></symbol>
    <symbol id="i-users" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><circle cx="9" cy="8" r="3.5"/><path d="M2.5 20a6.5 6.5 0 0 1 13 0"/><path d="M16 4.6a3.5 3.5 0 0 1 0 6.8M18 14.5a6.5 6.5 0 0 1 3.5 5.5"/></g></symbol>
    <symbol id="i-steth" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M6 3v6a4 4 0 0 0 8 0V3M4 3h4M12 3h4"/><path d="M10 13v2a5 5 0 0 0 10 0v-1"/><circle cx="20" cy="12" r="2"/></g></symbol>
    <symbol id="i-tag" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M3 12V4a1 1 0 0 1 1-1h8l9 9-9 9z"/><circle cx="8" cy="8" r="1.4"/></g></symbol>
    <symbol id="i-building" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M4 21V5a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v16M16 9h2a2 2 0 0 1 2 2v10M2 21h20"/><path d="M8 7h4M8 11h4M8 15h4"/></g></symbol>
    <symbol id="i-id" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="5" width="18" height="14" rx="2"/><circle cx="9" cy="11" r="2"/><path d="M6 16a3 3 0 0 1 6 0M14 10h4M14 14h3"/></g></symbol>
    <symbol id="i-search" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"><circle cx="11" cy="11" r="7"/><path d="M20 20l-3.5-3.5"/></g></symbol>
    <symbol id="i-plus" viewBox="0 0 24 24"><path d="M12 5v14M5 12h14" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"/></symbol>
    <symbol id="i-x" viewBox="0 0 24 24"><path d="M6 6l12 12M18 6L6 18" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"/></symbol>
    <symbol id="i-menu" viewBox="0 0 24 24"><path d="M4 7h16M4 12h16M4 17h16" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"/></symbol>
    <symbol id="i-logout" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4M16 17l5-5-5-5M21 12H9"/></g></symbol>
    <symbol id="i-alert" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><circle cx="12" cy="12" r="10"/><path d="M12 8v4M12 16h.01"/></g></symbol>
    <symbol id="i-check" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M8 12.5l2.7 2.7L16 9.5"/></g></symbol>
</svg>
<c:set var="adminName" value="${not empty sessionScope.user.name ? sessionScope.user.name : 'Admin'}"/>
<a href="#contenu" class="adm-skip">Aller au contenu</a>
<div class="adm-shell">
    <div class="adm-overlay" id="adm-overlay" hidden></div>
    <aside class="adm-sidebar" id="adm-sidebar" aria-label="Navigation administrateur">
        <a href="${pageContext.request.contextPath}/admin/Dashboard" class="adm-brand">
            <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><path d="M12 2v20M3.3 7l17.4 10M3.3 17L20.7 7"/></svg>
            <span>CLINIC MANAGER</span>
        </a>
        <nav class="adm-nav">
            <a href="${pageContext.request.contextPath}/admin/Dashboard" class="adm-link"><svg width="20" height="20"><use href="#i-dash"/></svg>Dashboard</a>
            <a href="${pageContext.request.contextPath}/admin/patients" class="adm-link"><svg width="20" height="20"><use href="#i-users"/></svg>Patients</a>
            <a href="${pageContext.request.contextPath}/admin/Doctors" class="adm-link"><svg width="20" height="20"><use href="#i-steth"/></svg>Médecins</a>
            <a href="${pageContext.request.contextPath}/admin/specialities" class="adm-link is-active" aria-current="page"><svg width="20" height="20"><use href="#i-tag"/></svg>Spécialités</a>
            <a href="${pageContext.request.contextPath}/admin/departements" class="adm-link"><svg width="20" height="20"><use href="#i-building"/></svg>Départements</a>
        </nav>
        <div class="adm-user">
            <div class="adm-user-row">
                <span class="adm-avatar" aria-hidden="true">${fn:toUpperCase(fn:substring(adminName, 0, 1))}</span>
                <div>
                    <p class="adm-user-name"><c:out value="${adminName}"/></p>
                    <p class="adm-user-role">Administrateur</p>
                </div>
            </div>
            <form method="post" action="${pageContext.request.contextPath}/logout">
                <input type="hidden" name="csrfToken" value="${csrfToken}">
                <button type="submit" class="adm-logout"><svg width="18" height="18"><use href="#i-logout"/></svg>Déconnexion</button>
            </form>
        </div>
    </aside>
    <div class="adm-main">
        <header class="adm-topbar">
            <button type="button" class="adm-burger" id="adm-burger" aria-label="Ouvrir le menu" aria-controls="adm-sidebar" aria-expanded="false">
                <svg width="22" height="22"><use href="#i-menu"/></svg>
            </button>
            <span class="adm-topbar-title">CLINIC MANAGER</span>
        </header>
        <main id="contenu" class="adm-content">
            <nav aria-label="Fil d'Ariane" class="adm-crumbs">
                <span>Admin</span><span aria-hidden="true">›</span><span aria-current="page">Spécialités</span>
            </nav>
            <div class="adm-head">
                <div>
                    <h1 class="adm-title">Spécialités</h1>
                    <p class="adm-sub">Les spécialités médicales de votre clinique, par département</p>
                </div>
                <div>
                    <button type="button" class="adm-btn adm-btn--dark" data-open-dialog ${empty departements ? 'disabled' : ''}>
                        <svg width="16" height="16"><use href="#i-plus"/></svg>Ajouter une spécialité
                    </button>
                    <c:if test="${empty departements}">
                        <p class="adm-sub">Créez d'abord un département : <a href="${pageContext.request.contextPath}/admin/departments">Aller aux départements</a></p>
                    </c:if>
                </div>
            </div>
            <c:if test="${not empty success}">
                <div class="adm-alert adm-alert--success" role="status">
                    <svg width="18" height="18"><use href="#i-check"/></svg>
                    <p><c:out value="${success}"/></p>
                    <button type="button" class="adm-alert-close" data-dismiss aria-label="Fermer"><svg width="16" height="16"><use href="#i-x"/></svg></button>
                </div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="adm-alert adm-alert--error" role="alert">
                    <svg width="18" height="18"><use href="#i-alert"/></svg>
                    <p><c:out value="${error}"/></p>
                    <button type="button" class="adm-alert-close" data-dismiss aria-label="Fermer"><svg width="16" height="16"><use href="#i-x"/></svg></button>
                </div>
            </c:if>
            <section class="adm-stats" aria-label="Statistiques">
                <div class="adm-stat adm-stat--yellow">
                    <p class="adm-stat-num">${empty specialites ? 0 : fn:length(specialites)}</p>
                    <p class="adm-stat-label">Total spécialités</p>
                </div>
                <div class="adm-stat adm-stat--mint">
                    <p class="adm-stat-num">${empty departements ? 0 : fn:length(departements)}</p>
                    <p class="adm-stat-label">Départements</p>
                </div>
            </section>
            <c:choose>
                <c:when test="${not empty specialites}">
                    <div class="dep-search">
                        <label for="dep-search-input" class="adm-sr">Rechercher une spécialité</label>
                        <svg class="dep-search-icon" width="18" height="18"><use href="#i-search"/></svg>
                        <input id="dep-search-input" type="search" class="dep-search-input" placeholder="Rechercher une spécialité" autocomplete="off">
                    </div>
                    <div class="dep-field">
                        <label for="dep-filter" class="dep-label">Département</label>
                        <select id="dep-filter" class="dep-input">
                            <option value="">Tous les départements</option>
                            <c:forEach var="d" items="${departements}">
                                <option value="${fn:escapeXml(d.name)}"><c:out value="${d.name}"/></option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="dep-actions">
                        <button type="button" class="adm-btn adm-btn--outline" id="dep-reset">Réinitialiser</button>
                    </div>
                    <ul class="dep-grid" id="dep-grid">
                        <c:forEach var="s" items="${specialites}" varStatus="st">
                            <li class="dep-card dep-tone-${st.index % 5}" data-name="${fn:escapeXml(s.name)}" data-department="${fn:escapeXml(s.departement.name)}">
                                <span class="dep-icon" aria-hidden="true"><svg width="26" height="26"><use href="#i-steth"/></svg></span>
                                <h2 class="dep-name"><c:out value="${s.name}"/></h2>
                                <span class="dep-pill">
                                    <c:choose>
                                        <c:when test="${not empty s.departement}">
                                            <c:out value="${s.departement.name}"/>
                                        </c:when>
                                        <c:otherwise>Sans département</c:otherwise>
                                    </c:choose>
                                </span>
                            </li>
                        </c:forEach>
                    </ul>
                    <p class="dep-noresult" id="dep-noresult" hidden>Aucun résultat</p>
                </c:when>
                <c:otherwise>
                    <section class="dep-empty">
                        <svg width="120" height="120" viewBox="0 0 120 120" fill="none">
                            <circle cx="60" cy="60" r="56" fill="#fff3b0"/>
                            <path d="M44 28v26a16 16 0 0 0 32 0V28M38 28h12M70 28h12" stroke="#171717" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
                            <path d="M60 70v8a18 18 0 0 0 36 0v-6" stroke="#171717" stroke-width="2.5" stroke-linecap="round"/>
                            <circle cx="96" cy="66" r="6" fill="#d7f5e4" stroke="#171717" stroke-width="2.5"/>
                        </svg>
                        <h2 class="dep-empty-title">Aucune spécialité pour le moment</h2>
                        <p class="dep-empty-text">Ajoutez votre première spécialité médicale et rattachez-la à un département de la clinique.</p>
                        <button type="button" class="adm-btn adm-btn--dark" data-open-dialog ${empty departements ? 'disabled' : ''}>
                            <svg width="16" height="16"><use href="#i-plus"/></svg>Ajouter une spécialité
                        </button>
                    </section>
                </c:otherwise>
            </c:choose>
        </main>
    </div>
</div>
<dialog id="add-dialog" class="dep-dialog" aria-modal="true" aria-labelledby="dlg-title" ${not empty addError ? 'data-autoopen="true"' : ''}>
    <div class="dep-dialog-card">
        <div class="dep-dialog-head">
            <div>
                <h2 id="dlg-title" class="dep-dialog-title">Nouvelle spécialité</h2>
                <p class="dep-dialog-sub">Choisissez un nom et un département.</p>
            </div>
            <button type="button" class="dep-dialog-close" data-close-dialog aria-label="Fermer"><svg width="18" height="18"><use href="#i-x"/></svg></button>
        </div>
        <c:if test="${not empty addError}">
            <div class="adm-alert adm-alert--error" role="alert">
                <svg width="18" height="18"><use href="#i-alert"/></svg>
                <p><c:out value="${addError}"/></p>
            </div>
        </c:if>
        <form id="dep-form" method="post" action="${pageContext.request.contextPath}/admin/Specialities" novalidate>
            <input type="hidden" name="csrfToken" value="${csrfToken}">
            <div class="dep-field">
                <label for="dep-name" class="dep-label">Nom de la spécialité</label>
                <input id="dep-name" name="name" type="text" class="dep-input" maxlength="60" autocomplete="off" placeholder="Ex. Cardiologie" aria-describedby="err-name" value="${fn:escapeXml(param.name)}">
                <p id="err-name" class="dep-err" aria-live="polite"></p>
            </div>
            <div class="dep-field">
                <label for="dep-select" class="dep-label">Département</label>
                <select id="dep-select" name="departementId" class="dep-input" required aria-describedby="err-dep">
                    <option value="" disabled selected>Choisir un département</option>
                    <c:forEach var="d" items="${departements}">
                        <option value="${d.id}" ${param.departementId == d.id ? 'selected' : ''}>
                            <c:out value="${d.name}"/>
                        </option>
                    </c:forEach>
                </select>
                <p id="err-dep" class="dep-err" aria-live="polite"></p>
            </div>
            <div class="dep-actions">
                <button type="button" class="adm-btn adm-btn--outline" data-close-dialog>Annuler</button>
                <button type="submit" class="adm-btn adm-btn--dark" id="dep-submit">
                    <svg class="dep-spinner" width="16" height="16" viewBox="0 0 24 24" fill="none">
                        <circle cx="12" cy="12" r="9" stroke="currentColor" stroke-width="3" opacity=".3"/>
                        <path d="M21 12a9 9 0 0 0-9-9" stroke="currentColor" stroke-width="3" stroke-linecap="round"/>
                    </svg>
                    <span>Ajouter</span>
                </button>
            </div>
        </form>
    </div>
</dialog>
<script>
    (function () {
        var $ = function (s, r) { return (r || document).querySelector(s); };
        var $$ = function (s, r) { return Array.prototype.slice.call((r || document).querySelectorAll(s)); };
        var norm = function (s) { return (s || '').normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase().trim(); };
        var burger = $('#adm-burger');
        var side = $('#adm-sidebar');
        var overlay = $('#adm-overlay');
        function drawer(open) {
            side.classList.toggle('is-open', open);
            overlay.hidden = !open;
            burger.setAttribute('aria-expanded', String(open));
        }
        burger.addEventListener('click', function () { drawer(!side.classList.contains('is-open')); });
        overlay.addEventListener('click', function () { drawer(false); });
        document.addEventListener('keydown', function (e) {
            if (e.key === 'Escape' && side.classList.contains('is-open')) {
                drawer(false);
                burger.focus();
            }
        });
        $$('[data-dismiss]').forEach(function (b) {
            b.addEventListener('click', function () {
                var alert = b.closest('.adm-alert');
                if (alert) alert.remove();
            });
        });
        var input = $('#dep-search-input');
        var filter = $('#dep-filter');
        var reset = $('#dep-reset');
        if (input && filter) {
            var cards = $$('.dep-card');
            var none = $('#dep-noresult');
            function applyFilters() {
                var q = norm(input.value);
                var dep = norm(filter.value);
                var shown = 0;
                cards.forEach(function (card) {
                    var name = norm(card.getAttribute('data-name'));
                    var department = norm(card.getAttribute('data-department'));
                    var matchName = !q || name.indexOf(q) !== -1;
                    var matchDepartment = !dep || department === dep;
                    var visible = matchName && matchDepartment;
                    card.hidden = !visible;
                    if (visible) shown++;
                });
                none.hidden = shown !== 0;
            }
            input.addEventListener('input', applyFilters);
            filter.addEventListener('change', applyFilters);
            if (reset) {
                reset.addEventListener('click', function () {
                    input.value = '';
                    filter.value = '';
                    applyFilters();
                    input.focus();
                });
            }
        }
        var dlg = $('#add-dialog');
        var form = $('#dep-form');
        var nameI = $('#dep-name');
        var depI = $('#dep-select');
        var errName = $('#err-name');
        var errDep = $('#err-dep');
        var submit = $('#dep-submit');
        var opener = null;
        var existing = $$('.dep-card[data-name]').map(function (card) {
            return norm(card.getAttribute('data-name'));
        });
        function setError(field, box, message) {
            box.textContent = message || '';
            if (message) {
                field.setAttribute('aria-invalid', 'true');
            } else {
                field.removeAttribute('aria-invalid');
            }
            return !message;
        }
        function resetButton() {
            submit.disabled = false;
            submit.classList.remove('is-loading');
        }
        $$('[data-open-dialog]').forEach(function (button) {
            button.addEventListener('click', function () {
                if (button.disabled) return;
                opener = button;
                dlg.showModal();
                nameI.focus();
            });
        });
        $$('[data-close-dialog]').forEach(function (button) {
            button.addEventListener('click', function () {
                dlg.close();
            });
        });
        dlg.addEventListener('click', function (event) {
            if (event.target === dlg) dlg.close();
        });
        dlg.addEventListener('close', function () {
            form.reset();
            setError(nameI, errName, '');
            setError(depI, errDep, '');
            resetButton();
            var alert = $('.adm-alert', dlg);
            if (alert) alert.remove();
            if (opener) opener.focus();
        });
        nameI.addEventListener('input', function () {
            if (nameI.value.trim()) setError(nameI, errName, '');
        });
        depI.addEventListener('change', function () {
            if (depI.value) setError(depI, errDep, '');
        });
        form.addEventListener('submit', function (event) {
            var name = nameI.value.trim();
            var nameError = '';
            if (!name) {
                nameError = 'Veuillez saisir le nom de la spécialité.';
            } else if (name.length < 2) {
                nameError = 'Le nom doit contenir au moins 2 caractères.';
            } else if (existing.indexOf(norm(name)) !== -1) {
                nameError = 'Cette spécialité existe déjà.';
            }
            var validName = setError(nameI, errName, nameError);
            var validDepartment = setError(depI, errDep, depI.value ? '' : 'Veuillez choisir un département.');
            if (!validName || !validDepartment) {
                event.preventDefault();
                (validName ? depI : nameI).focus();
                return;
            }
            submit.disabled = true;
            submit.classList.add('is-loading');
        });
        window.addEventListener('pageshow', resetButton);
        if (dlg.getAttribute('data-autoopen') === 'true') {
            dlg.showModal();
            nameI.focus();
        }
    })();
</script>
</body>
</html>
