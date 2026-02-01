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
  dates_intervention TEXT,  -- JSON array of dates
  historique TEXT,          -- JSON array of history events
  prix_final DECIMAL,
  prix_note TEXT,
  mode_paiement TEXT,
  stripe_subscription_id TEXT,
  stripe_customer_id TEXT,
  photos TEXT,              -- JSON array of {date, avant, apres, sent}
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Add columns if table already exists
ALTER TABLE clients ADD COLUMN IF NOT EXISTS dates_intervention TEXT;
ALTER TABLE clients ADD COLUMN IF NOT EXISTS historique TEXT;
ALTER TABLE clients ADD COLUMN IF NOT EXISTS prix_final DECIMAL;
ALTER TABLE clients ADD COLUMN IF NOT EXISTS prix_note TEXT;
ALTER TABLE clients ADD COLUMN IF NOT EXISTS mode_paiement TEXT;
ALTER TABLE clients ADD COLUMN IF NOT EXISTS stripe_subscription_id TEXT;
ALTER TABLE clients ADD COLUMN IF NOT EXISTS stripe_customer_id TEXT;
ALTER TABLE clients ADD COLUMN IF NOT EXISTS photos TEXT;

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
