# Changelog

The app runs the board's own releases; these are their notes, newest first. Every release is also on
https://github.com/joshua-d-miller/family-chalk-planner/releases

## 1.2.3

## 1.2.3 — The ☰ button stays out of the slideshow, on every wall screen
- **Fixed:** 1.2.2's fix for the ☰ button over the slideshow's photos needed a newer browser than some wall screens
  have (one older than Chrome 105, such as an older Android tablet's). The button and the tab bar now step aside for
  the slideshow on every browser the board supports.

Full notes: https://github.com/joshua-d-miller/family-chalk-planner/releases/tag/v1.2.3

## 1.1.1

## 1.1.1 — The wall moves to a new day by itself
- **A new day, without a reload:** at midnight every screen now moves to the new day by itself: today's ring, Up
  next, the countdowns, and a new month on the 1st. Before, a quiet wall could stay on yesterday until someone
  reloaded it. A screen that was asleep (turned off overnight) also catches up as soon as it's on again.
- **No more pull-to-refresh:** a swipe down on a wall or touch screen no longer reloads the board in Chrome-based
  browsers. In Fully Kiosk, also turn off its own pull-to-refresh setting if it's on.
- **A family screen where someone is also signed in** now opens the board ready to edit, with the cork or ☰ and
  working month arrows. Before, it showed the wall's view-only board instead.
- **The wall** no longer shows month arrows that do nothing.
- **↻ Reload the board** in the ☰ menu (instead of pull-to-refresh).
- **The ☰ button's drawer** is sized to the screen: it took about a third of a smaller wall screen.
- **Tested the way Colby runs it:** Chrome in kiosk mode on Linux, on 1080p, 2K and 4K touch screens, on every change.

Full notes: https://github.com/joshua-d-miller/family-chalk-planner/releases/tag/v1.1.1

## 1.1.0

## 1.1.0 — Countdowns, looks and big photo albums
Nothing to do when updating. Two things are on from the start, and both can be turned off: the next countdown on the
overnight slideshow (⚙️ Settings → Photos), and kids' tablets counting down in sleeps (⚙️ Settings → This screen,
or the admin console → 📺 Screens).

- **Countdowns, made fun:**
  - A **picture** for each starred countdown (🎉 🎂 🎄 🏖️ ✈️ ⚽ and more), and a **badge on its day** ("🎉 5 days",
    "🎉 Today!").
  - **Kids' tablets** show the next countdown big above their chores, in **sleeps** ("5 sleeps to go"), with a
    **paper chain**: one link for each day left.
  - **It's today!** with a short burst of confetti on the day.
  - The **overnight slideshow** shows the next countdown in a corner, from 30 days out (Settings → Photos to turn
    it off).
  - **Sleeps or days**, per screen: Settings → This screen, or any screen in the admin console → 📺 Screens.
- **🎨 Look of cards and menus**, at the bottom of the ☰ menu and in Settings → This screen. Each screen picks a
  look for its cards, ☰ menu and Settings: **Chalk** (as before), **Light**, **Dark** or **High contrast**, plus an
  **accent color** for headings and what's picked, and **larger text** (Large or Larger) for reading from further
  away. It's saved on the board, so clearing the browser doesn't lose it. The calendar keeps its own style (🎨 Board
  style).
- **More backgrounds** (🎨 Board style → Style, Every month): navy and burgundy chalkboards, a felt letter board,
  brick, burlap, white barnwood and graph paper, plus **Your photo**: pick any photo and it becomes the background,
  dimmed so the writing stays readable.
- **🎨 Board style on tabs:** Style, Days, Events, Notes and Lines, instead of one long card to scroll through. Save
  and Cancel stay at the bottom, and a small dot marks a tab with changes of its own.
- **A ✕ to close every card**, at its top right, and on the ☰ menu. It stays at the top while a long card
  scrolls, so there's no scrolling down to Cancel or tapping outside the card. Like Cancel, it doesn't save.
- **Big photo albums** (like an Immich album with thousands of photos), in the admin console → ⚙️ Board → Photos:
  - **Which photos:** every photo, **only the ones you pick** (a new **Pick photos…** grid to tick them), or **a
    few at random**, new ones each day.
  - **Copies on the board:** a copy of every photo as before, or **only the last few shown** (5 unless you pick
    another number), so a giant album isn't copied onto the board. The rest are fetched from the album when they
    come up. If the album can't be reached, the last photo shown stands in, with a small **📷 Photos are offline**
    note.
- **Immich 3:** albums and Immich share links work with Immich 3, which no longer lists an album's photos with
  the album (the board reads them from its timeline, the way Immich's own album page does). Favorites, Everything and
  On this day now read every photo, not just the newest 250.
- **Check connections** (admin console → ⚙️ Board): reads the calendar, any extra calendars and calendar links, and
  the photo album right now and says what's wrong, with an optional real round trip (a test event added, read back
  and deleted).
- **"It's not you, it's them":** when the calendar can't be reached, the board looks at **Apple's System Status** (for
  iCloud) or **Google's Workspace Status Dashboard** and, if they report a calendar problem, says so instead of a bare
  error.
- **Admin console → 📺 Screens:** a paired screen's list now always shows 🧒 Kid's tablet. Before anyone is added
  in 🧹 Chores it's greyed out and says to add the family there first (it used to be missing, leaving only View
  only and Family).
- **Node.js 26:** the Docker image and the Home Assistant app run on Node.js 26, and **Update now** moves a Linux
  board installed from NodeSource up to it. A **32-bit Raspberry Pi OS** stays on Node.js 22 (the newest Node.js
  built for it), supported until April 30, 2027; the [install guide](docs/install.md#nodejs) says how to move to
  the 64-bit Raspberry Pi OS to keep getting updates after that.
- **Tested against real servers** on every change, with no accounts anywhere: a real CalDAV server (Radicale, the
  protocol iCloud uses) and a real, fresh Immich.

Full notes: https://github.com/joshua-d-miller/family-chalk-planner/releases/tag/v1.1.0

## 1.0.0

The board becomes part of Home Assistant: it's in the sidebar, your Home Assistant login is your
board login (its administrators are the board's admins; everyone else gets a role you pick), it shows
the calendars and to-do lists already in Home Assistant, and it hides the sidebar while it's open.
Wall screens still use port 3002 and pair from the admin console.

Full notes: https://github.com/joshua-d-miller/family-chalk-planner/releases/tag/v1.0.0

## 0.17.1

The first version as a Home Assistant app: Home Assistant installs and updates the board, its data is
in Home Assistant's backups, and the app's Configuration tab can reset the admin for a family locked
out of the console.

Full notes: https://github.com/joshua-d-miller/family-chalk-planner/releases/tag/v0.17.1
