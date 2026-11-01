# AgentLab AI website

The public introduction page for AgentLab AI. It's a single static page with no build step.

## Layout

- `site/index.html`: the page (inline CSS and JS; fonts from Google Fonts)
- `site/favicon.svg`: the AgentLab mark
- `Dockerfile`: serves `site/` with unprivileged nginx on port 8080

## Preview locally

```sh
docker build -t agentlab-website .
docker run --rm -p 8080:8080 agentlab-website
# open http://localhost:8080
```

## Release

Every push to `main` builds `ghcr.io/agentlab-ai/website:latest` (plus a `sha-…` tag).
The cluster pins the image by digest, and Renovate opens the update when a new digest lands.
