-- Run this in Supabase SQL Editor after the properties table/policies have been created.
create table if not exists public.loan_rates (
  id text primary key,
  name text not null,
  rate text not null,
  note text not null default 'Indicative p.a.',
  icon text not null default '',
  sort_order integer not null default 0
);
alter table public.loan_rates enable row level security;
grant select on public.loan_rates to anon, authenticated;
grant insert, update, delete on public.loan_rates to authenticated;
drop policy if exists "Public can read loan rates" on public.loan_rates;
create policy "Public can read loan rates" on public.loan_rates for select to anon, authenticated using (true);
drop policy if exists "Admin can insert loan rates" on public.loan_rates;
create policy "Admin can insert loan rates" on public.loan_rates for insert to authenticated with check ((auth.jwt() ->> 'email') = 'dharmesh9666445@gmail.com');
drop policy if exists "Admin can update loan rates" on public.loan_rates;
create policy "Admin can update loan rates" on public.loan_rates for update to authenticated using ((auth.jwt() ->> 'email') = 'dharmesh9666445@gmail.com') with check ((auth.jwt() ->> 'email') = 'dharmesh9666445@gmail.com');
drop policy if exists "Admin can delete loan rates" on public.loan_rates;
create policy "Admin can delete loan rates" on public.loan_rates for delete to authenticated using ((auth.jwt() ->> 'email') = 'dharmesh9666445@gmail.com');
insert into public.loan_rates (id,name,rate,note,icon,sort_order) values
('home','Home Loan','7.25% – 20%','Indicative p.a.','🏠',1),
('personal','Personal Loan','10% – 24%','Indicative p.a.','💳',2),
('business','Business Loan','10% – 24%','Indicative p.a.','🏢',3),
('mortgage','Mortgage / LAP','8.5% – 18%','Indicative p.a.','🔑',4),
('car','Car Loan','7.25% – 15%','Indicative p.a.','🚗',5),
('education','Education Loan','8% – 15%','Indicative p.a.','🎓',6)
on conflict (id) do nothing;
