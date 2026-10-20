-- WoW: Forever Horde Guild HQ
-- Paste this into Supabase SQL Editor and run it.
create extension if not exists pgcrypto;

create table if not exists public.players (
  id uuid primary key default gen_random_uuid(),
  player_name text not null,
  race text not null,
  class_name text not null,
  role text,
  commitment text,
  notes text,
  created_at timestamptz not null default now()
);
create table if not exists public.guild_ideas (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  suggested_by text not null,
  reason text,
  created_at timestamptz not null default now()
);
create table if not exists public.guild_votes (
  id uuid primary key default gen_random_uuid(),
  voter_name text not null,
  guild_name text not null,
  created_at timestamptz not null default now()
);

alter table public.players enable row level security;
alter table public.guild_ideas enable row level security;
alter table public.guild_votes enable row level security;

-- Public guild signup page permissions: anyone with the site link can read/submit.
-- These policies do not prevent duplicate votes; votes are honor-system.
drop policy if exists "Public can view players" on public.players;
create policy "Public can view players" on public.players for select to anon, authenticated using (true);
drop policy if exists "Public can add players" on public.players;
create policy "Public can add players" on public.players for insert to anon, authenticated with check (true);

drop policy if exists "Public can view guild ideas" on public.guild_ideas;
create policy "Public can view guild ideas" on public.guild_ideas for select to anon, authenticated using (true);
drop policy if exists "Public can add guild ideas" on public.guild_ideas;
create policy "Public can add guild ideas" on public.guild_ideas for insert to anon, authenticated with check (true);

drop policy if exists "Public can view guild votes" on public.guild_votes;
create policy "Public can view guild votes" on public.guild_votes for select to anon, authenticated using (true);
drop policy if exists "Public can add guild votes" on public.guild_votes;
create policy "Public can add guild votes" on public.guild_votes for insert to anon, authenticated with check (true);

grant select, insert on public.players to anon, authenticated;
grant select, insert on public.guild_ideas to anon, authenticated;
grant select, insert on public.guild_votes to anon, authenticated;
