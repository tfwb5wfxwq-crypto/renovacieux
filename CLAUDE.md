# Renovacieux - Nettoyage de Sépultures

## Accès

- **Site**: https://renovacieux.com (GitHub Pages)
- **GitHub**: https://github.com/tfwb5wfxwq-crypto/renovacieux
- **Supabase**: Project pour auth et données clients
- **Admin**: dimitri@renovacieux.com / Kikinou75?
- **Email contact**: dimitri@renovacieux.com

## Stack

- HTML/CSS/JS statique
- GitHub Pages
- Supabase (Auth + DB) - **CLI lié, utiliser `supabase db push` pour migrations**
- Stripe (paiements)

## Tarifs

### Forfait déplacement
- Base: 29€ (inclut 10km)
- Au-delà: 0.80€/km

### Travaux (prix unitaires)
- Nettoyage: 40€
- Karcher: 60€
- Lettres (redorure): 150€/jour
- Joints: 50€
- Fleurs: 50€ (prix fixe)

### Formules annuelles
- Sérénité: 160€/an
- Prestige: 320€/an

### Calcul prix
- Nettoyage/karcher/joints: coefficients (taille, état, matériau) seulement
- Lettres: × nombre de jours
- Fleurs: prix fixe, pas de coefficient

## Ce qui a été fait

### Session 02/02/2026 soir
- **Système de rappels complet**:
  - Champ `date_rappel` ajouté dans Supabase
  - Section "Rappels du jour" sur dashboard
  - Section "Rappels en retard" sur dashboard
  - Popup "Quand rappeler ?" avec boutons rapides (1h, demain matin, demain aprem, lundi)
  - Déclenchement auto du popup quand statut → à_rappeler
  - Bouton "Programmer rappel" dans fiche client
- **Recherche clients**: Barre de recherche (nom, prénom, tel, cimetière)
- **Boutons post-appel**:
  - "Pas répondu" → reprogramme rappel demain 10h auto
  - "Intéressé" → statut en_discussion
  - "Veut devis" → statut devis_envoye
  - "Perdu" → statut perdu

### Session 02/02/2026
- Footer simplifié: "© 2026 Renovacieux | CGU"
- Enlevé "Responsable: Dimitri" des CGU (juste "Dimitri")
- Séparateur pipe avec espaces dans footer

### Sessions précédentes
- Pricing system complet avec forfait déplacement
- Pages villes: Cannes, Nice, Paris, Antibes, Grasse
- SEO: sitemap.xml, robots.txt, meta tags OG
- Faux avis Google supprimés (risque pénalité)
- Sécurité:
  - Mot de passe hardcodé supprimé
  - Supabase Auth implémenté
  - RLS (Row Level Security) sur les tables
  - Protection XSS (escapeHtml function)
- Page CGU créée avec mentions légales complètes
- Header hover effect: pill style
- Système de renouvellement automatique (loi Chatel)

## Fichiers clés

- `index.html` - page principale
- `gestion.html` - admin/CRM (protégé par auth)
- `cgu/index.html` - conditions générales
- `cannes/`, `nice/`, `paris/`, `antibes/`, `grasse/` - pages villes
- `robots.txt` - bloque gestion.html
- `sitemap.xml` - toutes les pages

## TODO - Améliorations CRM

### A. Système de Rappels ✅ FAIT
- [x] Champ `date_rappel` dans table clients (Supabase)
- [x] Section "Rappels du jour" sur dashboard
- [x] Section "Rappels en retard"
- [x] Popup "Quand rappeler ?" quand statut = à_rappeler
- [x] Boutons rapides : "Dans 1h", "Demain matin", "Lundi prochain"
- [ ] Ajouter rappels au feed iCal (optionnel)

### B. Recherche clients ✅ FAIT
- [x] Barre de recherche (nom, tel, cimetière)

### C. Workflow post-appel ✅ FAIT
- [x] Boutons rapides : "Pas répondu", "Intéressé", "Veut devis", "Perdu"
- [x] "Pas répondu" → reprogramme rappel +1 jour auto

### D. Workflow Interventions (à définir)
- [ ] Quand client paie → programmer date intervention
- [ ] Sync avec Calendar de Dym (iPad)
- [ ] Gestion multi-passages (Sérénité 2/an, Prestige 4/an)

### E. Sécurité RLS ✅ FAIT
- **RLS activé** via Dashboard Supabase
- **Policies** : `anon_insert` + `auth_all`
- **Solution** : Fonction RPC `insert_client()` avec SECURITY DEFINER pour le formulaire contact
- **Résultat** :
  - Anon ne peut PAS lire les données (retourne `[]`)
  - Anon PEUT insérer via RPC (formulaire contact)
  - Authenticated peut tout faire (CRM gestion.html)
- **Outil installé** : supabase-pentest-skills (24 skills) pour futurs audits

### F. Infos manquantes
- Ajouter vrai numéro téléphone Dimitri
- Ajouter SIRET quand disponible
- Créer og-image.png (1200×630px)
- Google Business Profile (quand photos dispo)

## Contexte Dym
- Travaille sur **iPad**
- Appelle avec son **téléphone** séparé (pas depuis l'iPad)
- Donc : numéro bien visible + bouton copier, pas besoin de tel: link
