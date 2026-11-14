# Family Chalk Planner

A chalkboard-style family wall calendar: your real calendar on a screen on the wall, decorated by
hand from a tablet, with weather, trash day, countdowns, a meal plan, chores and kids' reward jars.

The full guide is in the board's own documentation:
**[Getting started](https://github.com/joshua-d-miller/family-chalk-planner/blob/main/docs/getting-started.md)**.
This page covers what's different when it runs as a Home Assistant app.

## 1. Install and start

1. **Settings → Apps → Install app** (the app store), find **Family Chalk Planner**, and tap **Install**.
2. Tap **Start**. The first start takes about a minute while it unpacks its pictures.
3. Open the **Log** tab and look for the line with the **setup code** (it looks like `ABCD-EFGH`).
   It works once.

## 2. Create the admin account

1. Tap **Open web UI** (or open `http://<your Home Assistant>:3002/admin`, for example
   `http://homeassistant.local:3002/admin`).
2. Type the setup code, choose a username and password, and scan the QR code with an authenticator
   app (Google Authenticator, Microsoft Authenticator, 1Password, Authy...).

## 3. Connect your calendar

In the admin console, **⚙️ Board**:

- **Calendar:** iCloud (with an app-specific password) or any CalDAV server, then **Find my
  calendars**; or Google Calendar.
- **Weather:** search for your town.
- **Photos** (optional): a shared album link.

Tap **Save and restart**. The board restarts inside the app in a few seconds; you don't need to restart
the app yourself. The time zone comes from Home Assistant.

## 4. Put it on the wall

Open `http://<your Home Assistant>:3002/` on the wall screen. It shows a pairing code. In the admin
console, **📺 Screens**, type the code, name the screen, pick **View only** (a wall display) or
**Family** (a shared touch screen), and tap **Pair it**.

For an Android screen or tablet, [Fully Kiosk Browser](https://www.fully-kiosk.com/) keeps the board
full screen and the screen on. Set its Start URL to the address above.

Then invite whoever edits from a tablet or phone: **👪 People → Make invite link**.

## Updates

When a new version of the board is released, Home Assistant shows **Update** on this app. Your
calendar, drawings and settings stay. The board's own **Updates** section in the admin console just
says Home Assistant takes care of it.

## Backups

Everything the board keeps is in the app's own data folder, so **Home Assistant's backups include
it**: the database, the key for saved passwords, uploaded GIFs and the board's own nightly copies.
The picture and photo caches are left out; they rebuild themselves.

## Good to know

- **Port:** the board uses port 3002. To change it, set a different host port under the app's
  **Network** settings, and open the board at that port.
- **Passkeys** (Face ID, Touch ID, fingerprint) need the board on an `https://` name, through a
  reverse proxy (for example the NGINX or Caddy apps, or Nginx Proxy Manager). Password +
  authenticator code works without it. Enter the https address in ⚙️ Board → **On your network**.
- **Inside Home Assistant's sidebar and dashboards:** not yet. The board opens on its own port, in
  its own browser tab or kiosk.
- **Locked out of every admin account?** In the app's **Configuration** tab, turn on **Reset the
  admin**, save, and restart the app. Every account and paired screen is removed (the calendar,
  drawings and settings stay), and the **Log** shows a new setup code. Turn the option off again
  afterwards, create the admin in `/admin`, and pair the screens again.

## Help

Questions and problems: [the board's issues on GitHub](https://github.com/joshua-d-miller/family-chalk-planner/issues).
