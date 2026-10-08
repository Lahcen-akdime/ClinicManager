<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex, nofollow">
    <title>Médecins — Clinic Manager</title>
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
            .card {
                @apply rounded-3xl border border-neutral-200/70 bg-white shadow-[0_10px_30px_-18px_rgba(60,50,20,.25)];
            }
            .nav-link {
                @apply flex items-center gap-3 rounded-full px-4 py-3 text-sm font-medium text-neutral-700 transition hover:bg-butter/60;
            }
            .field {
                @apply w-full rounded-xl border border-neutral-300 bg-white px-4 py-3 text-sm outline-none transition focus:border-black focus:ring-4 focus:ring-black/10;
            }
            .lbl {
                @apply mb-1.5 block text-xs font-medium text-neutral-700;
            }
            .btn-line {
                @apply inline-flex items-center justify-center rounded-full border border-neutral-400 px-6 py-3 text-xs font-medium tracking-widest uppercase transition hover:bg-neutral-100;
            }
            .cell {
                @apply px-4 py-3.5 align-middle max-md:flex max-md:items-center max-md:justify-between max-md:gap-3 max-md:px-0 max-md:py-1.5 max-md:before:text-xs max-md:before:text-neutral-600 max-md:before:content-[attr(data-label)];
            }
        }
    </style>
    <style>
        body {
            background-color: #fffbe6;
            background-image:
                    radial-gradient(at 12% 8%, #fff3b0 0, transparent 45%),
                    radial-gradient(at 88% 12%, #f3e7d3 0, transparent 50%),
                    radial-gradient(at 80% 90%, #d9e1ea 0, transparent 50%),
                    radial-gradient(at 8% 85%, #efe6d0 0, transparent 45%);
            background-attachment: fixed;
        }
        :focus-visible {
            outline: 2px solid #000;
            outline-offset: 3px;
        }
        dialog::backdrop {
            background: rgba(0, 0, 0, .45);
        }
        @media (prefers-reduced-motion: reduce) {
            * {
                transition-duration: .01ms !important;
                scroll-behavior: auto !important;
            }
        }
    </style>
</head>
<body class="font-sans text-neutral-900 antialiased">
<c:set var="nTotal" value="${empty doctors ? 0 : fn:length(doctors)}"/>
<c:set var="nActive" value="0"/>

<c:forEach var="d" items="${doctors}">
    <c:if test="${d.user.active}">
        <c:set var="nActive" value="${nActive + 1}"/>
    </c:if>
</c:forEach>

<c:set var="nInactive" value="${nTotal - nActive}"/>
<%-- Nom de l'administrateur connecté --%>
<c:set var="adminName" value="Admin"/>
<c:if test="${not empty sessionScope.user}">
    <c:if test="${not empty sessionScope.user.name}">
        <c:set var="adminName" value="${sessionScope.user.name}"/>
    </c:if>
</c:if>

<a href="#contenu" class="sr-only focus:not-sr-only focus:fixed focus:top-3 focus:left-3 focus:z-50 focus:rounded-full focus:bg-black focus:px-4 focus:py-2 focus:text-white">
    Aller au contenu
</a>

<%-- Fond sombre du tiroir (mobile) --%>
<div id="overlay" class="fixed inset-0 z-30 hidden bg-black/40 lg:hidden" aria-hidden="true"></div>

<%-- ===== Barre latérale ===== --%>
<aside id="sidebar"
       class="fixed inset-y-3 left-3 z-40 flex w-64 -translate-x-[120%] flex-col rounded-3xl bg-white p-5 shadow-[0_20px_60px_-25px_rgba(60,50,20,.35)] transition-transform duration-300 lg:translate-x-0"
       aria-label="Barre latérale">

    <a href="${pageContext.request.contextPath}/admin/Dashboard" class="flex items-center gap-2 rounded-full px-1">
        <svg width="26" height="26" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true">
            <path d="M12 2v20M3.3 7l17.4 10M3.3 17L20.7 7"/>
        </svg>
        <span class="text-sm font-semibold tracking-widest">CLINIC MANAGER</span>
    </a>

    <nav class="mt-8 flex-1 overflow-y-auto" aria-label="Navigation administrateur">
        <ul class="space-y-1.5">
            <li>
                <a href="${pageContext.request.contextPath}/admin/Dashboard" class="nav-link">Dashboard</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/Patients" class="nav-link">Patients</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/Doctors" aria-current="page" class="flex items-center gap-3 rounded-full bg-black px-4 py-3 text-sm font-medium text-white">Médecins</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/Specialities" class="nav-link">Spécialités</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/departements" class="nav-link">Départements</a>
            </li>
        </ul>
    </nav>

    <div class="mt-4 rounded-2xl bg-cream p-4">
        <div class="flex items-center gap-3">
            <span id="avatar" class="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-butter text-sm font-semibold" aria-hidden="true">A</span>
            <div class="min-w-0">
                <p id="admin-name" class="truncate text-sm font-medium">
                    <c:out value="${adminName}"/>
                </p>
                <p class="text-xs text-neutral-600">Administrateur</p>
            </div>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/logout" class="mt-3">
            <input type="hidden" name="csrfToken" value="${fn:escapeXml(csrfToken)}">
            <button type="submit" class="w-full rounded-full border border-neutral-400 px-4 py-2.5 text-xs font-medium tracking-widest uppercase transition hover:bg-white">
                Déconnexion
            </button>
        </form>
    </div>
</aside>

<div class="px-4 py-4 sm:px-6 lg:ml-72 lg:py-6 lg:pr-6">

    <%-- ===== En-tête : burger, fil d'Ariane, titre ===== --%>
    <header class="flex items-center gap-3">
        <button id="burger" type="button" aria-label="Ouvrir le menu" aria-expanded="false" aria-controls="sidebar" class="inline-flex h-11 w-11 shrink-0 items-center justify-center rounded-full border border-neutral-300 bg-white lg:hidden">
            ☰
        </button>
        <div>
            <nav aria-label="Fil d'Ariane" class="text-xs text-neutral-600">
                <ol class="flex items-center gap-1.5">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/Dashboard" class="hover:text-black hover:underline">Admin</a>
                    </li>
                    <li aria-hidden="true">›</li>
                    <li aria-current="page" class="font-medium text-neutral-900">Médecins</li>
                </ol>
            </nav>
            <h1 class="font-serif text-4xl leading-tight tracking-tight sm:text-5xl">Médecins</h1>
            <p class="text-sm text-neutral-600">Consultez et gérez les comptes des médecins</p>
        </div>
    </header>

    <main id="contenu" class="mt-6 space-y-4">

        <%-- ===== Bandeaux de message ===== --%>
        <c:if test="${not empty success}">
            <div data-banner role="status" class="flex items-start gap-3 rounded-2xl bg-emerald-100 p-4 text-sm text-emerald-900">
                <p class="flex-1"><c:out value="${success}"/></p>
                <button type="button" data-dismiss aria-label="Fermer le message" class="rounded-full p-1 hover:bg-emerald-200">×</button>
            </div>
        </c:if>

        <c:if test="${not empty error}">
            <div data-banner role="alert" class="flex items-start gap-3 rounded-2xl bg-rose-50 p-4 text-sm text-rose-800">
                <p class="flex-1"><c:out value="${error}"/></p>
                <button type="button" data-dismiss aria-label="Fermer le message" class="rounded-full p-1 hover:bg-rose-100">×</button>
            </div>
        </c:if>

        <%-- ===== Mini-cartes de statistiques ===== --%>
        <section aria-label="Statistiques des médecins" class="grid gap-4 sm:grid-cols-3">
            <article class="flex items-center gap-4 rounded-3xl bg-yellow-100/70 p-5">
                <div>
                    <p class="font-serif text-4xl leading-none">${nTotal}</p>
                    <p class="mt-1 text-sm text-neutral-700">Total médecins</p>
                </div>
            </article>
            <article class="flex items-center gap-4 rounded-3xl bg-emerald-100/70 p-5">
                <div>
                    <p class="font-serif text-4xl leading-none">${nActive}</p>
                    <p class="mt-1 text-sm text-neutral-700">Comptes actifs</p>
                </div>
            </article>
            <article class="flex items-center gap-4 rounded-3xl bg-orange-100/70 p-5">
                <div>
                    <p class="font-serif text-4xl leading-none">${nInactive}</p>
                    <p class="mt-1 text-sm text-neutral-700">Comptes désactivés</p>
                </div>
            </article>
        </section>

        <%-- ===== Recherche et filtre (côté navigateur) ===== --%>
        <c:if test="${nTotal > 0}">
            <section class="card p-5" aria-label="Recherche et filtres">
                <form id="filters" class="grid gap-4 md:grid-cols-[2fr_1fr_auto] md:items-end">
                    <div>
                        <label for="q" class="lbl">Recherche</label>
                        <input id="q" type="search" class="field" placeholder="Nom, matricule, spécialité ou département" autocomplete="off">
                    </div>
                    <div>
                        <label for="status" class="lbl">Statut</label>
                        <select id="status" class="field">
                            <option value="">Tous</option>
                            <option value="ACTIVE">Actifs</option>
                            <option value="INACTIVE">Désactivés</option>
                        </select>
                    </div>
                    <button type="reset" class="btn-line">Réinitialiser</button>
                </form>
            </section>
        </c:if>

        <%-- ===== Liste des médecins ===== --%>
        <section class="card overflow-hidden" aria-label="Liste des médecins">

            <c:choose>

                <c:when test="${nTotal > 0}">

                    <div class="md:overflow-x-auto">
                        <table class="w-full text-left text-sm max-md:block">
                            <caption class="sr-only">Liste des médecins avec leur spécialité, leur département, leur matricule et le statut de leur compte</caption>

                            <thead class="bg-cream/70 text-xs text-neutral-700 max-md:sr-only">
                            <tr>
                                <th scope="col" class="px-4 py-3.5 font-medium">Médecin</th>
                                <th scope="col" class="px-4 py-3.5 font-medium">Spécialité</th>
                                <th scope="col" class="px-4 py-3.5 font-medium">Département</th>
                                <th scope="col" class="px-4 py-3.5 font-medium">Matricule</th>
                                <th scope="col" class="px-4 py-3.5 font-medium">Statut</th>
                                <th scope="col" class="px-4 py-3.5 font-medium">Actions</th>
                            </tr>
                            </thead>

                            <tbody id="doctors-body" class="max-md:block max-md:space-y-3 max-md:p-3 md:divide-y md:divide-neutral-100">

                            <c:forEach var="d" items="${doctors}" varStatus="st">

                                <%-- Valeurs préparées (sans jamais toucher au mot de passe ni à l'email) --%>
                                <c:set var="docFirst" value="${empty d.user.name ? '' : d.user.name}"/>
                                <c:set var="docLast" value="${empty d.user.lastName ? '' : d.user.lastName}"/>
                                <c:set var="docFull" value="${fn:trim(docFirst.concat(' ').concat(docLast))}"/>
                                <c:set var="docShown" value="${empty docFull ? 'Médecin' : docFull}"/>
                                <c:set var="specName" value="${empty d.specialite ? '' : d.specialite.name}"/>
                                <c:set var="deptName" value="${(empty d.specialite or empty d.specialite.departement) ? '' : d.specialite.departement.name}"/>
                                <c:set var="matricule" value="${empty d.matricule ? '' : d.matricule}"/>
                                <c:set var="searchText" value="${fn:toLowerCase(docFull)} ${fn:toLowerCase(matricule)} ${fn:toLowerCase(specName)} ${fn:toLowerCase(deptName)}"/>

                                <tr data-row
                                    data-status="${d.user.active ? 'ACTIVE' : 'INACTIVE'}"
                                    data-search="${fn:escapeXml(searchText)}"
                                    class="transition md:hover:bg-cream/70 max-md:block max-md:rounded-2xl max-md:border max-md:border-neutral-200 max-md:p-4">

                                        <%-- Médecin : avatar (initiales) + prénom et nom --%>
                                    <td class="px-4 py-3.5 align-middle max-md:block max-md:border-b max-md:border-neutral-100 max-md:px-0 max-md:pt-0 max-md:pb-3">
                                        <div class="flex items-center gap-3">
                                            <span class="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-yellow-200 text-xs font-semibold text-neutral-900" aria-hidden="true">
                                                <c:choose>
                                                    <c:when test="${empty docFirst and empty docLast}">M</c:when>
                                                    <c:otherwise><c:out value="${fn:toUpperCase(fn:substring(docFirst, 0, 1))}${fn:toUpperCase(fn:substring(docLast, 0, 1))}"/></c:otherwise>
                                                </c:choose>
                                            </span>
                                            <p class="min-w-0 truncate font-medium">
                                                <c:out value="${docShown}"/>
                                            </p>
                                        </div>
                                    </td>

                                        <%-- Spécialité --%>
                                    <td data-label="Spécialité" class="cell">
                                        <c:choose>
                                            <c:when test="${empty specName}">—</c:when>
                                            <c:otherwise><c:out value="${specName}"/></c:otherwise>
                                        </c:choose>
                                    </td>

                                        <%-- Département --%>
                                    <td data-label="Département" class="cell">
                                        <c:choose>
                                            <c:when test="${empty deptName}">—</c:when>
                                            <c:otherwise><c:out value="${deptName}"/></c:otherwise>
                                        </c:choose>
                                    </td>

                                        <%-- Matricule --%>
                                    <td data-label="Matricule" class="cell whitespace-nowrap">
                                        <c:choose>
                                            <c:when test="${empty matricule}">—</c:when>
                                            <c:otherwise><c:out value="${matricule}"/></c:otherwise>
                                        </c:choose>
                                    </td>

                                        <%-- Statut --%>
                                    <td data-label="Statut" class="cell">
                                        <c:choose>
                                            <c:when test="${d.user.active}">
                                                <span class="inline-flex items-center gap-1.5 rounded-full bg-emerald-100 px-2.5 py-1 text-xs font-medium text-emerald-800">
                                                    <span class="h-1.5 w-1.5 rounded-full bg-emerald-600"></span>
                                                    Actif
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="inline-flex items-center gap-1.5 rounded-full bg-rose-100 px-2.5 py-1 text-xs font-medium text-rose-800">
                                                    <span class="h-1.5 w-1.5 rounded-full bg-rose-500"></span>
                                                    Désactivé
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                        <%-- Actions : un seul bouton icône qui ouvre la modale de confirmation --%>
                                    <td data-label="Actions" class="cell">
                                        <c:choose>
                                            <c:when test="${d.user.active}">
                                                <button type="button" data-confirm
                                                        data-id="${fn:escapeXml(d.id)}"
                                                        data-name="${fn:escapeXml(docShown)}"
                                                        data-action="DEACTIVATE"
                                                        title="Désactiver"
                                                        aria-label="Désactiver le compte de ${fn:escapeXml(docShown)}"
                                                        class="inline-flex h-10 w-10 items-center justify-center rounded-full border border-neutral-300 bg-white text-neutral-800 transition hover:bg-rose-50">
                                                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" aria-hidden="true">
                                                        <circle cx="12" cy="12" r="9"/><path d="M5.6 5.6l12.8 12.8"/>
                                                    </svg>
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button type="button" data-confirm
                                                        data-id="${fn:escapeXml(d.id)}"
                                                        data-name="${fn:escapeXml(docShown)}"
                                                        data-action="ACTIVATE"
                                                        title="Réactiver"
                                                        aria-label="Réactiver le compte de ${fn:escapeXml(docShown)}"
                                                        class="inline-flex h-10 w-10 items-center justify-center rounded-full border border-neutral-300 bg-white text-neutral-800 transition hover:bg-emerald-50">
                                                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                                                        <path d="M3 12a9 9 0 1 0 3-6.7L3 8"/><path d="M3 3v5h5"/>
                                                    </svg>
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                </tr>

                            </c:forEach>

                            </tbody>
                        </table>
                    </div>

                    <%-- Aucun résultat (filtre) --%>
                    <div id="no-result" class="hidden px-6 py-12 text-center">
                        <h2 class="font-serif text-3xl">Aucun résultat</h2>
                        <p class="mt-2 text-sm text-neutral-600">Aucun médecin ne correspond à votre recherche.</p>
                    </div>

                    <p class="border-t border-neutral-200 px-5 py-4 text-sm text-neutral-700" aria-live="polite">
                        <strong id="count">${nTotal}</strong>
                        médecin<span id="plural"><c:if test="${nTotal > 1}">s</c:if></span>
                        affiché<span id="plural2"><c:if test="${nTotal > 1}">s</c:if></span>
                    </p>

                </c:when>

                <%-- État vide --%>
                <c:otherwise>
                    <div class="flex flex-col items-center px-6 py-16 text-center">
                        <h2 class="font-serif text-3xl">Aucun médecin pour le moment</h2>
                        <p class="mt-2 max-w-sm text-sm text-neutral-600">
                            Les médecins apparaîtront ici dès qu'ils auront créé leur compte.
                        </p>
                    </div>
                </c:otherwise>

            </c:choose>

        </section>
    </main>

    <footer class="mt-8 pb-2 text-center text-xs text-neutral-600">
        © 2026 Clinic Manager · Espace administrateur
    </footer>

</div>

<%-- ===== Modale de confirmation (désactiver / réactiver) ===== --%>
<dialog id="confirm-dialog"
        aria-modal="true"
        aria-labelledby="confirm-title"
        aria-describedby="confirm-text"
        class="m-auto w-[min(92vw,28rem)] rounded-3xl border border-neutral-200/70 bg-white p-0 text-neutral-900 shadow-[0_30px_80px_-25px_rgba(60,50,20,.45)]">
    <div class="p-6">
        <div class="flex items-start justify-between gap-4">
            <h2 id="confirm-title" class="font-serif text-3xl leading-tight">Désactiver le compte ?</h2>
            <button type="button" data-close aria-label="Fermer" class="inline-flex h-10 w-10 shrink-0 items-center justify-center rounded-full border border-neutral-300 transition hover:bg-neutral-100">
                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" aria-hidden="true"><path d="M6 6l12 12M18 6L6 18"/></svg>
            </button>
        </div>
        <p id="confirm-text" class="mt-3 text-sm text-neutral-600"></p>

        <form id="status-form" method="post" action="${pageContext.request.contextPath}/admin/Doctors" class="mt-6">
            <input type="hidden" name="id" id="f-id" value="">
            <input type="hidden" name="action" id="f-action" value="DEACTIVATE">
            <input type="hidden" name="csrfToken" value="${fn:escapeXml(csrfToken)}">
            <div class="flex flex-wrap justify-end gap-3">
                <button type="button" id="btn-cancel" data-close class="btn-line">Annuler</button>
                <button type="submit" id="btn-confirm"
                        class="inline-flex items-center justify-center gap-2 rounded-full bg-black px-6 py-3 text-xs font-medium tracking-widest text-white uppercase transition hover:bg-neutral-800 disabled:cursor-not-allowed disabled:opacity-60">
                    <svg id="spinner" class="hidden h-4 w-4 animate-spin" viewBox="0 0 24 24" fill="none" aria-hidden="true">
                        <circle cx="12" cy="12" r="9" stroke="currentColor" stroke-width="3" opacity=".3"/>
                        <path d="M21 12a9 9 0 0 0-9-9" stroke="currentColor" stroke-width="3" stroke-linecap="round"/>
                    </svg>
                    <span id="btn-label">Désactiver</span>
                </button>
            </div>
        </form>
    </div>
</dialog>

<script>
    (function () {
        function $(id) {
            return document.getElementById(id);
        }

        // Sans accents ni majuscules
        function norm(s) {
            return (s || '')
                .normalize('NFD')
                .replace(/[\u0300-\u036f]/g, '')
                .toLowerCase()
                .trim();
        }

        // ----- Initiales de l'administrateur -----
        var adminName = $('admin-name');

        if (adminName) {
            var nm = (adminName.textContent || 'Admin')
                .trim()
                .split(/\s+/);

            $('avatar').textContent =
                (
                    (nm[0] || 'A').charAt(0) +
                    (nm[1] ? nm[1].charAt(0) : '')
                ).toUpperCase();
        }

        // ----- Fermeture des bandeaux -----
        document.querySelectorAll('[data-dismiss]')
            .forEach(function (button) {
                button.addEventListener('click', function () {
                    var box = button.closest('[data-banner]');
                    if (box) {
                        box.remove();
                    }
                });
            });

        // ----- Recherche et filtre par statut -----
        var rows = document.querySelectorAll('tr[data-row]');

        if (rows.length && $('filters')) {
            var q = $('q');
            var status = $('status');

            function applyFilters() {
                var term = norm(q.value);
                var shown = 0;

                rows.forEach(function (row) {
                    var matchSearch =
                        !term || norm(row.dataset.search).indexOf(term) !== -1;

                    var matchStatus =
                        !status.value || row.dataset.status === status.value;

                    var visible = matchSearch && matchStatus;

                    row.hidden = !visible;

                    if (visible) {
                        shown++;
                    }
                });

                $('count').textContent = shown;
                $('plural').textContent = shown > 1 ? 's' : '';
                $('plural2').textContent = shown > 1 ? 's' : '';

                $('no-result')
                    .classList
                    .toggle('hidden', shown > 0);
            }

            q.addEventListener('input', applyFilters);
            status.addEventListener('change', applyFilters);

            $('filters').addEventListener('reset', function () {
                setTimeout(applyFilters, 0);
            });
        }

        // ----- Modale de confirmation -----
        var dlg = $('confirm-dialog');
        var form = $('status-form');
        var title = $('confirm-title');
        var text = $('confirm-text');
        var label = $('btn-label');
        var spinner = $('spinner');
        var submit = $('btn-confirm');
        var cancel = $('btn-cancel');
        var fId = $('f-id');
        var fAction = $('f-action');
        var opener = null;

        function resetSubmit() {
            submit.disabled = false;
            spinner.classList.add('hidden');
        }

        document.querySelectorAll('[data-confirm]')
            .forEach(function (button) {
                button.addEventListener('click', function () {
                    opener = button;

                    var name = button.dataset.name;
                    var action = button.dataset.action;

                    fId.value = button.dataset.id;
                    fAction.value = action;

                    if (action === 'ACTIVATE') {
                        title.textContent = 'Réactiver le compte ?';
                        text.textContent = name + ' pourra de nouveau se connecter. Son historique est conservé.';
                        label.textContent = 'Réactiver';
                    } else {
                        title.textContent = 'Désactiver le compte ?';
                        text.textContent = name + ' ne pourra plus se connecter. Son historique est conservé et vous pourrez réactiver le compte à tout moment.';
                        label.textContent = 'Désactiver';
                    }

                    resetSubmit();
                    dlg.showModal();
                    cancel.focus();
                });
            });

        // Boutons « Annuler » et « × »
        dlg.querySelectorAll('[data-close]')
            .forEach(function (button) {
                button.addEventListener('click', function () {
                    dlg.close();
                });
            });

        // Clic sur l'arrière-plan
        dlg.addEventListener('click', function (event) {
            if (event.target === dlg) {
                dlg.close();
            }
        });

        // Fermeture (Échap compris) : retour du focus sur le bouton déclencheur
        dlg.addEventListener('close', function () {
            resetSubmit();
            if (opener) {
                opener.focus();
            }
        });

        // Anti double envoi + spinner
        form.addEventListener('submit', function () {
            submit.disabled = true;
            spinner.classList.remove('hidden');
        });

        window.addEventListener('pageshow', resetSubmit);

        // ----- Tiroir latéral (mobile) -----
        var sidebar = $('sidebar');
        var overlay = $('overlay');
        var burger = $('burger');

        var mediaQuery =
            window.matchMedia('(min-width: 1024px)');

        var open = false;

        function sync() {
            sidebar.inert =
                !mediaQuery.matches && !open;
        }

        function setOpen(value) {
            open = value;

            sidebar.classList.toggle(
                '-translate-x-[120%]',
                !value
            );

            overlay.classList.toggle(
                'hidden',
                !value
            );

            document.body.classList.toggle(
                'overflow-hidden',
                value && !mediaQuery.matches
            );

            burger.setAttribute(
                'aria-expanded',
                String(value)
            );

            sync();
        }

        burger.addEventListener(
            'click',
            function () {
                setOpen(!open);
            }
        );

        overlay.addEventListener(
            'click',
            function () {
                setOpen(false);
            }
        );

        document.addEventListener(
            'keydown',
            function (event) {
                if (
                    event.key === 'Escape' &&
                    open
                ) {
                    setOpen(false);
                    burger.focus();
                }
            }
        );

        mediaQuery.addEventListener('change', sync);

        sync();
    })();
</script>

</body>
</html>