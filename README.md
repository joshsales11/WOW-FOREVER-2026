# WoW: Forever Horde Guild HQ

This is a website-style signup and voting page. It is **not live/shared until you connect a Supabase database and publish it**.

## What it does
- Members choose Horde race + class, enter their player/Discord name, role, play style and optional notes.
- Shared guild roster and automatic class counts.
- Guild name vote with live totals.
- Member-submitted guild name suggestions.
- Responsive dark fantasy styling.

## Step 1 — Create the shared database (free tier may be available)
1. Go to https://supabase.com and create an account/project.
2. Open your project, then open **SQL Editor**.
3. Open `supabase.sql` from this folder, copy all of it into the SQL Editor, and click **Run**.
4. Go to **Project Settings → API** (or the project's API keys page).
5. Copy the **Project URL** and the **anon / publishable key**. Never use a `service_role` or secret key in this website.

## Step 2 — Connect the website
1. Open `index.html` in a text editor.
2. Find these lines near the bottom:
   `const SUPABASE_URL = "PASTE_SUPABASE_PROJECT_URL_HERE";`
   `const SUPABASE_ANON_KEY = "PASTE_SUPABASE_ANON_KEY_HERE";`
3. Replace the placeholders with your Project URL and anon/publishable key. Keep the quotation marks.
4. Save the file.

## Step 3 — Publish for free with GitHub Pages
1. Go to https://github.com and create/sign in to an account.
2. Create a new public repository, e.g. `wow-forever-guild`.
3. Upload `index.html` to the root of the repository. You can also upload this README and `supabase.sql`.
4. Open the repository's **Settings → Pages**.
5. Under Build and deployment, choose **Deploy from a branch**, choose `main` and `/ (root)`, then Save.
6. Wait for GitHub Pages to publish; the URL will look like `https://YOUR-USERNAME.github.io/wow-forever-guild/`.
7. Share that published URL with your guild.

## Important notes
- The included race/class dropdowns are starter classic-style Horde options. Verify/edit them for the exact WoW: Forever ruleset before publishing.
- Anyone with the public link can submit entries and votes. The included SQL allows public read/insert. Do not collect sensitive information.
- Voting is currently honor-system: duplicate votes are not blocked. The page asks voters to enter a name but doesn't verify identity.
- The anon/publishable key is intended for public frontend use; **never expose a service_role/secret key**.
- For stricter anti-spam, authenticated users, or one-vote-per-person enforcement, add authentication and server-side validation before public launch.
