# Family Chalk Planner

A chalkboard-style family wall calendar: your real calendar on a screen on the wall, decorated by
hand from a tablet, with weather, trash day, countdowns, a meal plan, chores and kids' reward jars.

The full guide is in the board's own documentation:
**[Getting started](https://github.com/joshua-d-miller/family-chalk-planner/blob/main/docs/getting-started.md)**.
This page covers what's different when it runs as a Home Assistant app.

## 1. Install and start

1. **Settings → Apps → App store** (bottom right), find **Family Chalk Planner**, and tap **Install**.
2. Turn on **Show in sidebar**, then tap **Start**. The first start takes about a minute while it
   unpacks its pictures.
3. Tap **Family Board** in the sidebar.

There's no separate account to make: **your Home Assistant login is your board login.** Home
Assistant's administrators open the board's admin console; everyone else goes straight to the board.

## 2. Who can do what

In the admin console, **👪 People** lists everyone with a Home Assistant login:

- **Home Assistant administrators** are the board's admins (the console, settings, screens).
- **Everyone else** gets the role you pick: **View only**, **Family** (tick chores, fill jars,
  timers) or **Editor** (change events, draw, everything but the console). People you haven't set
  get the **default** role, shown at the top of the list (Family to start with).

## 3. Calendars and to-do lists

The board uses what's already in Home Assistant. In the admin console, **⚙️ Board**:

- **Calendar:** **🏠 Home Assistant** is picked for you. Tap **List Home Assistant's calendars**,
  tick the ones to show, give each a color, and make one the **main** calendar (new events go
  there). Local Calendar, Google Calendar, CalDAV, Outlook... anything Home Assistant shows as a
  calendar. Events are added, changed and deleted from the board where Home Assistant allows it;
  a calendar it can't change shows read-only. Prefer the board's own iCloud or Google connection?
  Pick it there instead.
- **Home Assistant to-do lists:** tick the lists to show on the board's **Chores** page (Shopping
  List, Local To-do, Google Tasks...). Ticking one off on the board ticks it off in Home Assistant.
- **Weather:** search for your town.

Tap **Save and restart**. The board restarts inside the app in a few seconds. The time zone comes
from Home Assistant.

## 4. Full screen and the wall

**Inside Home Assistant** the board hides Home Assistant's sidebar while it's open (Home
Assistant's ☰ button brings it back), and puts it back as it was when you leave.

**On the wall**, use the board's own address so there's nothing of Home Assistant around it:

1. On the wall screen, open `http://<your Home Assistant>:3002/` (for example
   `http://homeassistant.local:3002/`). It shows a pairing code.
2. In the admin console (from the sidebar), **📺 Screens**: type the code, name the screen, pick
   **View only** (a wall display) or **Family** (a shared touch screen), and tap **Pair it**.

For an Android screen or tablet, [Fully Kiosk Browser](https://www.fully-kiosk.com/) keeps the board
full screen and the screen on. Set its Start URL to the address above.

## Updates

When a new version of the board is released, Home Assistant shows **Update** on this app. Your
calendar, drawings and settings stay.

## Backups

Everything the board keeps is in the app's own data folder, so **Home Assistant's backups include
it**: the database, the key for saved passwords, uploaded GIFs and the board's own nightly copies.
The picture and photo caches are left out; they rebuild themselves.

## Good to know

- **Port:** wall screens use port 3002. To change it, set a different host port under the app's
  **Network** settings. The sidebar doesn't use the port.
- **Starting over with screens:** in the app's **Configuration** tab, turn on **Reset the admin**,
  save, and restart the app. Every paired screen (and any board account) is removed; the calendar,
  drawings and settings stay. Turn the option off again afterwards and pair the screens again.

## Help

Questions and problems: [the board's issues on GitHub](https://github.com/joshua-d-miller/family-chalk-planner/issues).
