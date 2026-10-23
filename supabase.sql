-- Tabla para el historial compartido del Cotizador de Seguros.
-- Pegar en Supabase: SQL Editor -> New query -> Run.
create table if not exists public.cotizaciones (
  id uuid primary key default gen_random_uuid(),
  creado timestamptz not null default now(),
  actualizado timestamptz not null default now(),
  productor_id text not null,
  productor text,
  cliente text,
  vehiculo text,
  datos jsonb not null
);
create index if not exists cotizaciones_actualizado_idx on public.cotizaciones (actualizado desc);
alter table public.cotizaciones enable row level security;
drop policy if exists "cotizador lee y escribe" on public.cotizaciones;
create policy "cotizador lee y escribe" on public.cotizaciones
  for all to anon using (true) with check (true);
