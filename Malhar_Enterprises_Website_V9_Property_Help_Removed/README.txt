MALHAR ENTERPRISES WEBSITE — SUPABASE ADMIN STARTER

Files:
- index.html: public website; reads published property listings and loan rates from Supabase when configured.
- admin.html: admin login and property/rate editor.
- supabase-config.js: put Project URL and Publishable key here.
- supabase-setup.sql: run in Supabase SQL Editor to create loan_rates and its RLS policies. Your properties table and its policies are expected to already exist from the earlier SQL.

SETUP
1. In Supabase Dashboard → Project Settings → API Keys, copy the Project URL and Publishable key. Edit supabase-config.js, replacing both placeholders. Never use a secret/service_role key in browser code.
2. In Supabase SQL Editor, run supabase-setup.sql.
3. In Authentication → Sign In / Providers, disable new user signups (admin account already created). Keep email/password enabled. Ensure the admin account email is confirmed and use its password to sign in.
4. In Authentication → URL Configuration, set Site URL to the eventual Vercel URL and add the Vercel URL plus local testing URL (e.g. http://localhost:5500/**) to Redirect URLs after deploying/testing.
5. Serve the folder through a local web server (e.g. VS Code Live Server), not file://. Test admin.html login and CRUD, and check public index.html only shows published listings.
6. Deploy the complete folder to Vercel as a static site. Keep config file with public URL/publishable key only.

SECURITY NOTES
- Browser-side authorization is not relied on alone: database RLS policies restrict insert/update/delete to the exact admin email claim. Anyone can read published listings and public loan rates.
- Protect the admin account with a unique strong password and MFA where available. Do not share admin credentials or secret/service_role keys.
- This package uses image URLs, not direct photo upload. Use trusted image hosting and HTTPS image URLs.
- Loan rates are illustrative only; verify lender-specific rates before publishing.
- Verify the RLS policies in Supabase and test with an unauthorized account before public launch. No deployment or live connection is completed by this ZIP alone.
