-- Table clients pour Renovacieux CRM
CREATE TABLE IF NOT EXISTS clients (
  id BIGSERIAL PRIMARY KEY,
  nom TEXT,
  prenom TEXT,
  tel TEXT,
  email TEXT,
  cimetiere TEXT,
  formule_demandee TEXT,
  message TEXT,
  position_tombe TEXT,
  notes TEXT,
  formule_choisie TEXT,
  statut TEXT DEFAULT 'nouveau',
  facile_trouver TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Activer RLS (Row Level Security)
ALTER TABLE clients ENABLE ROW LEVEL SECURITY;

-- Politique pour permettre toutes les opérations (simple pour un CRM privé)
CREATE POLICY "Allow all operations" ON clients
  FOR ALL
  USING (true)
  WITH CHECK (true);

-- Index pour les recherches fréquentes
CREATE INDEX IF NOT EXISTS idx_clients_statut ON clients(statut);
CREATE INDEX IF NOT EXISTS idx_clients_created ON clients(created_at DESC);
