# Family Chalk Planner for Home Assistant

[![Add this repository to my Home Assistant](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fjoshua-d-miller%2Ffamily-chalk-planner-ha)

[Family Chalk Planner](https://github.com/joshua-d-miller/family-chalk-planner) as a Home Assistant app:
a chalkboard-style family wall calendar, installed, updated and backed up by Home Assistant.

## Install

1. Tap the button above, or in Home Assistant go to **Settings → Apps → Install app**, open the **⋮**
   menu → **Repositories**, and add `https://github.com/joshua-d-miller/family-chalk-planner-ha`.
2. Find **Family Chalk Planner** in the app store, **Install**, then **Start**.
3. Follow the app's **Documentation** tab (the same as [DOCS.md](family-chalk-planner/DOCS.md)).

Works on Home Assistant OS and Supervised installs on 64-bit machines (amd64, aarch64: a Raspberry Pi 4
or 5 with the 64-bit OS, a mini PC, a VM).

## How this repository works

There's no code here. The app runs the board's own image,
`ghcr.io/joshua-d-miller/family-chalk-planner`, the same one Docker installs use, at the version in
[`family-chalk-planner/config.yaml`](family-chalk-planner/config.yaml).

When the board publishes a release, [a workflow](.github/workflows/follow-releases.yaml) moves that
version forward (once the image is up) and adds the release notes to the app's
[CHANGELOG.md](family-chalk-planner/CHANGELOG.md). Home Assistant then shows **Update** on the app.
Changes to the board itself go to [the board's repository](https://github.com/joshua-d-miller/family-chalk-planner).

## License

The board is under the GNU Affero General Public License v3.0 or later; see its
[LICENSE](https://github.com/joshua-d-miller/family-chalk-planner/blob/main/LICENSE). The files in this
repository are under the same license.
