<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex, nofollow">
    <title>Patients — Clinic Manager</title>
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

<c:set var="nTotal" value="${empty patients ? 0 : fn:length(patients)}"/>
<c:set var="nActive" value="0"/>
<c:forEach var="p" items="${patients}">
    <c:if test="${p.isActive}">
        <c:set var="nActive" value="${nActive + 1}"/>
    </c:if>
</c:forEach>
<c:set var="nInactive" value="${nTotal - nActive}"/>

<c:set var="adminName" value="Admin"/>
<c:if test="${not empty sessionScope.user}">
    <c:if test="${not empty sessionScope.user.name}">
        <c:set var="adminName" value="${sessionScope.user.name}"/>
    </c:if>
</c:if>

<a href="#contenu" class="sr-only focus:not-sr-only focus:fixed focus:top-3 focus:left-3 focus:z-50 focus:rounded-full focus:bg-black focus:px-4 focus:py-2 focus:text-white">
    Aller au contenu
</a>

<div id="overlay" class="fixed inset-0 z-30 hidden bg-black/40 lg:hidden" aria-hidden="true"></div>

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
                <a href="${pageContext.request.contextPath}/admin/patients" aria-current="page" class="flex items-center gap-3 rounded-full bg-black px-4 py-3 text-sm font-medium text-white">Patients</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/doctors" class="nav-link">Médecins</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/specialities" class="nav-link">Spécialités</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/departments" class="nav-link">Départements</a>
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
            <input type="hidden" name="csrfToken" value="${csrfToken}">
            <button type="submit" class="w-full rounded-full border border-neutral-400 px-4 py-2.5 text-xs font-medium tracking-widest uppercase transition hover:bg-white">
                Déconnexion
            </button>
        </form>
    </div>
</aside>

<div class="px-4 py-4 sm:px-6 lg:ml-72 lg:py-6 lg:pr-6">

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
                    <li aria-current="page" class="font-medium text-neutral-900">Patients</li>
                </ol>
            </nav>
            <h1 class="font-serif text-4xl leading-tight tracking-tight sm:text-5xl">Patients</h1>
            <p class="text-sm text-neutral-600">Consultez et gérez les comptes des patients</p>
        </div>
    </header>

    <main id="contenu" class="mt-6 space-y-4">

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

        <section aria-label="Statistiques des patients" class="grid gap-4 sm:grid-cols-3">
            <article class="flex items-center gap-4 rounded-3xl bg-yellow-100/70 p-5">
                <div>
                    <p class="font-serif text-4xl leading-none">${nTotal}</p>
                    <p class="mt-1 text-sm text-neutral-700">Total patients</p>
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

        <c:if test="${nTotal > 0}">
            <section class="card p-5" aria-label="Recherche et filtres">
                <form id="filters" class="grid gap-4 md:grid-cols-[2fr_1fr_1fr_auto] md:items-end">
                    <div>
                        <label for="q" class="lbl">Recherche</label>
                        <input id="q" type="search" class="field" placeholder="Nom ou téléphone" autocomplete="off">
                    </div>
                    <div>
                        <label for="status" class="lbl">Statut</label>
                        <select id="status" class="field">
                            <option value="">Tous</option>
                            <option value="ACTIVE">Actifs</option>
                            <option value="INACTIVE">Désactivés</option>
                        </select>
                    </div>
                    <div>
                        <label for="genre" class="lbl">Genre</label>
                        <select id="genre" class="field">
                            <option value="">Tous</option>
                            <option value="MALE">Homme</option>
                            <option value="FEMALE">Femme</option>
                        </select>
                    </div>
                    <button type="reset" class="btn-line">Réinitialiser</button>
                </form>
            </section>
        </c:if>

        <section class="card overflow-hidden" aria-label="Liste des patients">

            <c:choose>

                <c:when test="${nTotal > 0}">

                    <div class="md:overflow-x-auto">
                        <table class="w-full text-left text-sm max-md:block">

                            <thead class="bg-cream/70 text-xs text-neutral-700 max-md:sr-only">
                            <tr>
                                <th class="px-4 py-3.5 font-medium">Patient</th>
                                <th class="px-4 py-3.5 font-medium">Téléphone</th>
                                <th class="px-4 py-3.5 font-medium">Genre</th>
                                <th class="px-4 py-3.5 font-medium">Groupe sanguin</th>
                                <th class="px-4 py-3.5 font-medium">Adresse</th>
                                <th class="px-4 py-3.5 font-medium">Statut</th>
                            </tr>
                            </thead>

                            <tbody id="patients-body" class="max-md:block max-md:space-y-3 max-md:p-3 md:divide-y md:divide-neutral-100">

                            <c:forEach var="p" items="${patients}" varStatus="st">

                                <c:set var="patientName" value="${empty p.name ? 'Patient' : p.name}"/>
                                <c:set var="patientPhone" value="${empty p.phone ? '' : p.phone}"/>
                                <c:set var="patientGenre" value="${empty p.genre ? '' : p.genre}"/>

                                <tr data-row
                                    data-status="${p.isActive ? 'ACTIVE' : 'INACTIVE'}"
                                    data-genre="${patientGenre}"
                                    data-search="${patientName} ${patientPhone}"
                                    class="transition md:hover:bg-cream/70 max-md:block max-md:rounded-2xl max-md:border max-md:border-neutral-200 max-md:p-4">

                                    <td class="px-4 py-3.5 align-middle max-md:block max-md:border-b max-md:border-neutral-100 max-md:px-0 max-md:pt-0 max-md:pb-3">
                                        <div class="flex items-center gap-3">
                                            <span class="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-yellow-200 text-xs font-semibold text-neutral-900" aria-hidden="true">
                                                <c:choose>
                                                    <c:when test="${fn:length(patientName) >= 2}">
                                                        <c:out value="${fn:toUpperCase(fn:substring(patientName, 0, 2))}"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:out value="${fn:toUpperCase(patientName)}"/>
                                                    </c:otherwise>
                                                </c:choose>
                                            </span>
                                            <p class="min-w-0 truncate font-medium">
                                                <c:out value="${patientName}"/>
                                            </p>
                                        </div>
                                    </td>

                                    <td data-label="Téléphone" class="cell whitespace-nowrap">
                                        <c:choose>
                                            <c:when test="${empty p.phone}">—</c:when>
                                            <c:otherwise><c:out value="${p.phone}"/></c:otherwise>
                                        </c:choose>
                                    </td>

                                    <td data-label="Genre" class="cell">
                                        <c:choose>
                                            <c:when test="${empty p.genre}">—</c:when>
                                            <c:when test="${p.genre == 'MALE'}">Homme</c:when>
                                            <c:when test="${p.genre == 'FEMALE'}">Femme</c:when>
                                            <c:otherwise><c:out value="${p.genre}"/></c:otherwise>
                                        </c:choose>
                                    </td>

                                    <td data-label="Groupe sanguin" class="cell">
                                        <c:choose>
                                            <c:when test="${empty p.groupSuinguin}">—</c:when>
                                            <c:otherwise>
                                                <span class="inline-block rounded-full bg-orange-100 px-2.5 py-1 text-xs font-medium text-orange-900">
                                                    <c:out value="${p.groupSuinguin}"/>
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                    <td data-label="Adresse" class="cell max-w-56 max-md:max-w-none">
                                        <span class="truncate max-md:text-right">
                                            <c:choose>
                                                <c:when test="${empty p.adress}">—</c:when>
                                                <c:otherwise><c:out value="${p.adress}"/></c:otherwise>
                                            </c:choose>
                                        </span>
                                    </td>

                                    <td data-label="Statut" class="cell">
                                        <form method="post" action="${pageContext.request.contextPath}/admin/Patients">
                                        <c:choose>
                                            <c:when test="${p.isActive}">
                                                <span class="inline-flex items-center gap-1.5 rounded-full bg-emerald-100 px-2.5 py-1 text-xs font-medium text-emerald-800">
                                                    <span class="h-1.5 w-1.5 rounded-full bg-emerald-600"></span>
                                                    Actif
                                                </span>
                                                <button type="submit" class="btn-line">Desactiver</button>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="inline-flex items-center gap-1.5 rounded-full bg-rose-100 px-2.5 py-1 text-xs font-medium text-rose-800">
                                                    <span class="h-1.5 w-1.5 rounded-full bg-rose-500"></span>
                                                    Désactivé
                                                </span>
                                                <button type="submit" class="btn-line">Activer</button>
                                            </c:otherwise>
                                        </c:choose>
                                            <input type="hidden" name="isActive" value=${p.isActive}"">
                                            <input type="hidden" name="id" value="${p.id}">
                                        </form>
                                    </td>

                                </tr>

                            </c:forEach>

                            </tbody>
                        </table>
                    </div>

                    <div id="no-result" class="hidden px-6 py-12 text-center">
                        <h2 class="font-serif text-3xl">Aucun résultat</h2>
                        <p class="mt-2 text-sm text-neutral-600">Aucun patient ne correspond à votre recherche.</p>
                    </div>

                    <p class="border-t border-neutral-200 px-5 py-4 text-sm text-neutral-700" aria-live="polite">
                        <strong id="count">${nTotal}</strong>
                        patient<span id="plural"><c:if test="${nTotal > 1}">s</c:if></span>
                        affiché<span id="plural2"><c:if test="${nTotal > 1}">s</c:if></span>
                    </p>

                </c:when>

                <c:otherwise>
                    <div class="flex flex-col items-center px-6 py-16 text-center">
                        <h2 class="font-serif text-3xl">Aucun patient pour le moment</h2>
                        <p class="mt-2 max-w-sm text-sm text-neutral-600">
                            Les patients apparaîtront ici dès qu'ils auront créé leur compte.
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

<script>
    (function () {
        function $(id) {
            return document.getElementById(id);
        }

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

        document.querySelectorAll('[data-dismiss]')
            .forEach(function (button) {
                button.addEventListener('click', function () {
                    var box = button.closest('[data-banner]');
                    if (box) {
                        box.remove();
                    }
                });
            });

        var rows = document.querySelectorAll('tr[data-row]');

        if (rows.length && $('filters')) {
            var q = $('q');
            var status = $('status');
            var genre = $('genre');

            function applyFilters() {
                var term = q.value.trim().toLowerCase();
                var shown = 0;

                rows.forEach(function (row) {
                    var search = (row.dataset.search || '').toLowerCase();
                    var rowStatus = row.dataset.status || '';
                    var rowGenre = row.dataset.genre || '';

                    var matchSearch =
                        !term || search.indexOf(term) !== -1;

                    var matchStatus =
                        !status.value || rowStatus === status.value;

                    var matchGenre =
                        !genre.value || rowGenre === genre.value;

                    var visible =
                        matchSearch &&
                        matchStatus &&
                        matchGenre;

                    row.style.display =
                        visible ? '' : 'none';

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
            genre.addEventListener('change', applyFilters);

            $('filters').addEventListener('reset', function () {
                setTimeout(applyFilters, 0);
            });
        }

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
                }
            }
        );

        sync();
    })();
</script>

</body>
</html>
