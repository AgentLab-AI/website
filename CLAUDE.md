# CLAUDE.md

Context for working on the AgentLab AI website.

## What this is

The public introductory page for AgentLab AI, served at agentlabai.dev. It is a placeholder
for now: one static page with no build step. The owner likes the current design and wants
to grow it over time, with more interactive and animated pieces.

## Background

AgentLab AI is a GitHub organization where one engineer and a crew of AI agents share
repositories. It started as a practical fix: agents had their own GitHub accounts, and
collaborating across personal repos meant constant invites and account switching. A shared
org solved that. The name came next, then the domain, with the idea that the site might one
day support paid work. The owner is still exploring what agentic coding can do.

An earlier version of the brand (the GitHub org profile) felt clean but stiff. This site keeps
the brand and adds personality.

## Brand

- Mark: a three-piece "A". `site/favicon.svg` and the inline nav SVG are traced from the org
  avatar; no original vector source exists.
- Colors: blue `#1569ff`, light blue `#a6d3fd`, navy background `#080e1e`.
- Tagline: "Software. Systems. Applied intelligence."
- Type: Bricolage Grotesque (display), Instrument Sans (body), JetBrains Mono (labels, log).
- Dark by default, with a light theme for light-mode systems.

## What the page does

- Hero: the pitch plus a "lab log" that types out example changes (feature, bug fix, upgrade)
  with human, agent and CI entries. Tabs and replay. Clearly labelled as an example.
- Blueprint grid behind the hero that glows under the pointer.
- Logo pieces slide together on load and pull apart on hover.
- "What we build": three cards (Software, Systems, Applied intelligence) with a pointer spotlight.
- "How we work": clickable pipeline Scope → Build → Test → Review → Ship, auto-advancing when
  in view. Testing is its own step on purpose; the owner considers it part of building.
- Everything renders without animation, and motion is off under `prefers-reduced-motion`.

## Content rules

- No names of people or agents, and no details about the owner's personal infrastructure,
  other domains, or self-hosted apps. Agents appear as roles (builder, tester, reviewer, ops).
- No invented clients, testimonials, metrics or projects. Calls to action point to the GitHub
  org until there is real public work to show.
- Copy is plain and direct. Avoid corporate filler.

## Ideas not yet chosen

1. "Meet the crew": a card per agent with its role and what it may and may not do. Needs a
   decision on whether agents get real names.
2. Real activity feed from public org repos, labelled human or agent.
3. A `/` terminal easter egg with commands like `help`, `crew`, `projects`.
4. Projects section with CI status, once repos are public.
5. An About page with the org's origin story; later, lab notes or a blog.

## Build and deploy

- `site/` is served as-is by unprivileged nginx on port 8080 (`Dockerfile`). Keep it working
  with a read-only root filesystem; nginx writes only to `/tmp`.
- Pushes to `main` that touch `site/` or the `Dockerfile` build
  `ghcr.io/agentlab-ai/website` (`latest` and `sha-…`). The package is public.
- The cluster pins the image by digest; a dependency bot opens the update there when a new
  digest is published. Nothing about the cluster belongs in this repo.

## Preview locally

```sh
docker build -t agentlab-website .
docker run --rm -p 8080:8080 --read-only --tmpfs /tmp agentlab-website
```
