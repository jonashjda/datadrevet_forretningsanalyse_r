# R Project — README

This repo uses **RStudio** for development and **GitHub Desktop** (plus the RStudio Git pane/Terminal) for version control. The workflow assumes a solo “edit → commit → push to `main`” approach with no pull requests.

---

## Prerequisites
- R (≥ 4.1) and RStudio/Posit IDE installed
- Git installed and available on PATH
- GitHub account + credentials set up (HTTPS with token or SSH)
- Optional tools: GitHub Desktop, GitHub CLI (`gh`)

---

## One-time setup
```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global rebase.autoStash true
```

Add a sensible `.gitignore` at the repo root:
```
.Rproj.user/
.Rhistory
.RData
.Ruserdata
.Renviron
.DS_Store
output/
```
> Keep secrets in `.Renviron` (don’t commit). Avoid committing files >100 MB (use Git LFS if needed).

---

## Daily Git Workflow (RStudio + GitHub Desktop)

1) **Start of day: sync `main`**
   - **GitHub Desktop:** `Fetch origin` → `Pull origin` (main).
   - **RStudio (optional):** Git pane → **Pull** (or Terminal: `git pull --rebase`).

2) **Work in RStudio**
   - Edit, run, and save files (scripts, notebooks, Quarto/Rmd).
   - Prefer small, focused commits with clear messages.

3) **Commit**
   - **GitHub Desktop:** review diffs → select files to stage → write a clear summary (e.g., `feat: add monthly revenue plot`) → **Commit to main**.
   - **RStudio (optional):** check files → **Commit** → message → **Commit**.

4) **Push to GitHub**
   - **GitHub Desktop:** **Push origin**.
   - **RStudio (optional):** **Push**.

> Tip: Commit as you go; do a final commit + push when you wrap up for the day.

---

## If something bumps you

- **Push rejected (remote changed):**
  - **GitHub Desktop:** `Fetch` → `Pull origin`. If conflicts appear, use the built-in conflict UI: open files, resolve, **Mark as resolved**, **Commit merge**, then **Push**.
  - **Terminal (equivalent):**
    ```bash
    git pull --rebase origin main
    # resolve conflicts in your editor
    git add <fixed-files>
    git rebase --continue
    git push
    ```

- **Undo last commit (keep the changes):**
  - **GitHub Desktop:** `History` → right-click last commit → **Revert** (creates a new commit) or use **Amend last commit** if it’s unpushed.
  - **Terminal:** `git reset --soft HEAD~1`

- **Discard local edits to a file:**
  - **GitHub Desktop:** right-click file → **Discard changes**.
  - **Terminal:** `git restore --source=HEAD -- <path>`

---

## Quick task map

| Task                     | GitHub Desktop                         | RStudio (optional)     | Terminal (equivalent)            |
|--------------------------|----------------------------------------|------------------------|----------------------------------|
| Pull latest              | Fetch → Pull                           | Git pane → Pull        | `git pull --rebase`              |
| Stage + commit           | Select files → Commit to main          | Git pane → Commit      | `git add -A && git commit -m ""` |
| Push                     | Push origin                            | Git pane → Push        | `git push`                       |
| View diffs               | Changes tab                            | Git pane → Diff        | `git diff` / `git diff --staged` |
| Resolve conflicts        | Guided conflict UI                     | Edit + Commit          | Manual edit + `git add`          |

---

## Good hygiene
- Descriptive commit messages (`type: summary`), e.g., `fix: handle NA dates`.
- Keep generated artifacts in `output/` (ignore if not needed in history).
- Never commit API keys or secrets; use `.Renviron` / environment variables.
- For reproducibility, consider using `renv` to lock package versions.

---

## Optional: RStudio project structure (suggested)
```
project/
  data/          # raw data (read-only)
  data-raw/      # scripts to build cleaned data
  R/             # functions (.R)
  scripts/       # analysis scripts
  output/        # results (csv, figs)
  reports/       # Quarto/Rmd
  project.Rproj
```
