<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex, nofollow">
    <title>Départements — Clinic Manager</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Instrument+Serif:ital@0;1&display=swap" rel="stylesheet">
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
            <a href="${pageContext.request.contextPath}/admin/Dashboard" class="adm-link"><svg width="20" height="20" aria-hidden="true"><use href="#i-dash"/></svg>Dashboard</a>
            <a href="${pageContext.request.contextPath}/admin/Patients" class="adm-link"><svg width="20" height="20" aria-hidden="true"><use href="#i-users"/></svg>Patients</a>
            <a href="${pageContext.request.contextPath}/admin/Doctors" class="adm-link"><svg width="20" height="20" aria-hidden="true"><use href="#i-steth"/></svg>Médecins</a>
            <a href="${pageContext.request.contextPath}/admin/Specialities" class="adm-link"><svg width="20" height="20" aria-hidden="true"><use href="#i-tag"/></svg>Spécialités</a>
            <a href="${pageContext.request.contextPath}/admin/departements" class="adm-link is-active" aria-current="page"><svg width="20" height="20" aria-hidden="true"><use href="#i-building"/></svg>Départements</a>
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
                <button type="submit" class="adm-logout"><svg width="18" height="18" aria-hidden="true"><use href="#i-logout"/></svg>Déconnexion</button>
            </form>
        </div>
    </aside>
    <div class="adm-main">
        <header class="adm-topbar">
            <button type="button" class="adm-burger" id="adm-burger" aria-label="Ouvrir le menu" aria-controls="adm-sidebar" aria-expanded="false">
                <svg width="22" height="22" aria-hidden="true"><use href="#i-menu"/></svg>
            </button>
            <span class="adm-topbar-title">CLINIC MANAGER</span>
        </header>
        <main id="contenu" class="adm-content">
            <nav aria-label="Fil d'Ariane" class="adm-crumbs">
                <span>Admin</span><span aria-hidden="true">›</span><span aria-current="page">Départements</span>
            </nav>
            <div class="adm-head">
                <div>
                    <h1 class="adm-title">Départements</h1>
                    <p class="adm-sub">Organisez les services de votre clinique</p>
                </div>
                <button type="button" class="adm-btn adm-btn--dark" data-open-dialog>
                    <svg width="16" height="16" aria-hidden="true"><use href="#i-plus"/></svg>Ajouter un département
                </button>
            </div>
            <c:if test="${not empty success}">
                <div class="adm-alert adm-alert--success" role="status">
                    <svg width="18" height="18" aria-hidden="true"><use href="#i-check"/></svg>
                    <p><c:out value="${success}"/></p>
                    <button type="button" class="adm-alert-close" data-dismiss aria-label="Fermer le message"><svg width="16" height="16" aria-hidden="true"><use href="#i-x"/></svg></button>
                </div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="adm-alert adm-alert--error" role="alert">
                    <svg width="18" height="18" aria-hidden="true"><use href="#i-alert"/></svg>
                    <p><c:out value="${error}"/></p>
                    <button type="button" class="adm-alert-close" data-dismiss aria-label="Fermer le message"><svg width="16" height="16" aria-hidden="true"><use href="#i-x"/></svg></button>
                </div>
            </c:if>
            <section class="adm-stats" aria-label="Statistiques">
                <div class="adm-stat adm-stat--yellow">
                    <p class="adm-stat-num">${empty departments ? 0 : fn:length(departments)}</p>
                    <p class="adm-stat-label">Total départements</p>
                </div>
            </section>
            <c:choose>
                <c:when test="${not empty departments}">
                    <div class="dep-search">
                        <label for="dep-search-input" class="adm-sr">Rechercher un département</label>
                        <svg class="dep-search-icon" width="18" height="18" aria-hidden="true"><use href="#i-search"/></svg>
                        <input id="dep-search-input" type="search" class="dep-search-input" placeholder="Rechercher un département" autocomplete="off">
                    </div>
                    <ul class="dep-grid" id="dep-grid">
                        <c:forEach var="d" items="${departments}" varStatus="st">
                            <li class="dep-card dep-tone-${st.index % 5}" data-name="${fn:escapeXml(d.name)}">
                                <span class="dep-icon" aria-hidden="true"><svg width="26" height="26"><use href="#i-building"/></svg></span>
                                <h2 class="dep-name"><c:out value="${d.name}"/></h2>
                                <c:choose>
                                    <c:when test="${not empty d.descreption}">
                                        <p class="dep-desc"><c:out value="${d.descreption}"/></p>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="dep-desc dep-desc--empty">Aucune description</p>
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:forEach>
                    </ul>
                    <p class="dep-noresult" id="dep-noresult" hidden>Aucun résultat</p>
                </c:when>
                <c:otherwise>
                    <section class="dep-empty">
                        <svg width="120" height="120" viewBox="0 0 120 120" fill="none" aria-hidden="true">
                            <circle cx="60" cy="60" r="56" fill="#fff3b0"/>
                            <rect x="34" y="30" width="38" height="62" rx="6" fill="#fff" stroke="#171717" stroke-width="2"/>
                            <rect x="72" y="52" width="16" height="40" rx="4" fill="#d7f5e4" stroke="#171717" stroke-width="2"/>
                            <path d="M42 44h8M56 44h8M42 58h8M56 58h8M42 72h8M56 72h8" stroke="#171717" stroke-width="2" stroke-linecap="round"/>
                        </svg>
                        <h2 class="dep-empty-title">Aucun département pour le moment</h2>
                        <p class="dep-empty-text">Créez votre premier département pour structurer les services de la clinique.</p>
                        <button type="button" class="adm-btn adm-btn--dark" data-open-dialog>
                            <svg width="16" height="16" aria-hidden="true"><use href="#i-plus"/></svg>Ajouter un département
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
                <h2 id="dlg-title" class="dep-dialog-title">Nouveau département</h2>
                <p class="dep-dialog-sub">Donnez un nom et une courte description.</p>
            </div>
            <button type="button" class="dep-dialog-close" data-close-dialog aria-label="Fermer"><svg width="18" height="18" aria-hidden="true"><use href="#i-x"/></svg></button>
        </div>
        <c:if test="${not empty addError}">
            <div class="adm-alert adm-alert--error" role="alert">
                <svg width="18" height="18" aria-hidden="true"><use href="#i-alert"/></svg>
                <p><c:out value="${addError}"/></p>
            </div>
        </c:if>
        <form id="dep-form" method="post" action="${pageContext.request.contextPath}/admin/departements" novalidate>
            <input type="hidden" name="csrfToken" value="${csrfToken}">
            <div class="dep-field">
                <label for="dep-name" class="dep-label">Nom du département</label>
                <input id="dep-name" name="name" type="text" class="dep-input" maxlength="60" autocomplete="off" placeholder="Ex. Cardiologie" aria-describedby="err-name" value="${fn:escapeXml(param.name)}">
                <p id="err-name" class="dep-err" aria-live="polite"></p>
            </div>
            <div class="dep-field">
                <label for="dep-desc" class="dep-label">Description <span class="dep-optional">(facultatif)</span></label>
                <textarea id="dep-desc" name="descreption" class="dep-input dep-textarea" maxlength="250" rows="4" aria-describedby="dep-count">${fn:escapeXml(param.descreption)}</textarea>
                <p id="dep-count" class="dep-count">0 / 250</p>
            </div>
            <div class="dep-actions">
                <button type="button" class="adm-btn adm-btn--outline" data-close-dialog>Annuler</button>
                <button type="submit" class="adm-btn adm-btn--dark" id="dep-submit">
                    <svg class="dep-spinner" width="16" height="16" viewBox="0 0 24 24" fill="none" aria-hidden="true"><circle cx="12" cy="12" r="9" stroke="currentColor" stroke-width="3" opacity=".3"/><path d="M21 12a9 9 0 0 0-9-9" stroke="currentColor" stroke-width="3" stroke-linecap="round"/></svg>
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
        var burger = $('#adm-burger'), side = $('#adm-sidebar'), overlay = $('#adm-overlay');
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
                b.closest('.adm-alert').remove();
            });
        });
        var input = $('#dep-search-input');
        if (input) {
            var cards = $$('.dep-card'), none = $('#dep-noresult');
            input.addEventListener('input', function () {
                var q = norm(input.value), shown = 0;
                cards.forEach(function (c) {
                    var ok = norm(c.getAttribute('data-name')).indexOf(q) !== -1;
                    c.hidden = !ok;
                    if (ok) shown++;
                });
                none.hidden = shown !== 0;
            });
        }
        var dlg = $('#add-dialog'), form = $('#dep-form');
        var nameI = $('#dep-name'), descI = $('#dep-desc'), count = $('#dep-count'), err = $('#err-name'), submit = $('#dep-submit');
        var opener = null;
        var existing = $$('.dep-card').map(function (c) {
            return norm(c.getAttribute('data-name'));
        });
        function updateCount() {
            count.textContent = descI.value.length + ' / 250';
        }
        function setErr(msg) {
            err.textContent = msg || '';
            if (msg) {
                nameI.setAttribute('aria-invalid', 'true');
            } else {
                nameI.removeAttribute('aria-invalid');
            }
            return !msg;
        }
        function resetBtn() {
            submit.disabled = false;
            submit.classList.remove('is-loading');
        }
        $$('[data-open-dialog]').forEach(function (b) {
            b.addEventListener('click', function () {
                opener = b;
                dlg.showModal();
                nameI.focus();
            });
        });
        $$('[data-close-dialog]').forEach(function (b) {
            b.addEventListener('click', function () {
                dlg.close();
            });
        });
        dlg.addEventListener('click', function (e) {
            if (e.target === dlg) dlg.close();
        });
        dlg.addEventListener('close', function () {
            form.reset();
            nameI.value = '';
            descI.value = '';
            setErr('');
            updateCount();
            resetBtn();
            var ba = $('.adm-alert', dlg);
            if (ba) ba.remove();
            if (opener) opener.focus();
        });
        descI.addEventListener('input', updateCount);
        nameI.addEventListener('input', function () {
            if (nameI.value.trim()) setErr('');
        });
        form.addEventListener('submit', function (e) {
            var v = nameI.value.trim(), msg = '';
            if (!v) {
                msg = 'Veuillez saisir le nom du département.';
            } else if (v.length < 2) {
                msg = 'Le nom doit contenir au moins 2 caractères.';
            } else if (existing.indexOf(norm(v)) !== -1) {
                msg = 'Ce département existe déjà.';
            }
            if (!setErr(msg)) {
                e.preventDefault();
                nameI.focus();
                return;
            }
            submit.disabled = true;
            submit.classList.add('is-loading');
        });
        window.addEventListener('pageshow', resetBtn);
        updateCount();
        if (dlg.getAttribute('data-autoopen') === 'true') {
            dlg.showModal();
            nameI.focus();
        }
    })();
</script>
</body>
</html>
