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
- Supabase (Auth + DB)
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

## TODO
- Ajouter vrai numéro téléphone Dimitri
- Ajouter SIRET quand disponible
- Créer og-image.png (1200×630px)
- Google Business Profile (quand photos dispo)
