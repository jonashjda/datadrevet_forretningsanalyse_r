# Course Repo (R + RStudio) — README

This repository is organized as a **course monorepo** containing many small RStudio *projects* as subfolders (each with its own `*.Rproj`). Development happens in **RStudio**, and version control uses **GitHub Desktop** (plus the RStudio Git pane/Terminal when convenient). The workflow assumes a solo “edit → commit → push to `main`” approach with no pull requests.

---

## Prerequisites
- R (≥ 4.1) and RStudio/Posit IDE installed
- Git installed and available on PATH
- GitHub account + credentials set up (HTTPS with token or SSH)
- Optional: GitHub Desktop, GitHub CLI (`gh`)

---

## Repository layout (suggested)
```
course-2025/
  README.md
  .gitignore
  assignments/
    01-intro/
      intro.Rproj
      renv/            # created by renv::init()
      renv.lock
      data/
      R/
      scripts/
      reports/
    02-regression/
      regression.Rproj
      renv/
      renv.lock
      data/
      R/
      scripts/
      reports/
  shared/               # optional: shared utils, small datasets, templates
    R/
    templates/
```

> Each subfolder like `assignments/01-intro/` is an **independent RStudio project** because it contains its own `*.Rproj`. Open the `.Rproj` you want to work in and RStudio treats that folder as the project root.

---

## New subproject checklist
1. Create a folder: `assignments/NN-name/`.
2. In RStudio: **File → New Project → Existing Directory…** → choose that folder (this creates `name.Rproj` there).
3. (Optional) Isolate packages: open the new project → run `renv::init()` → commit `renv.lock` and the `renv/` folder.
4. Add subfolders you like (`data/`, `R/`, `scripts/`, `reports/`, `output/`).
5. Use `here::here()` for all file paths (see below).
6. Commit the new project (README update optional).

---

## Using `here()` and paths
`here::here()` resolves relative to the **active project’s root** (the folder containing the open `*.Rproj`). This keeps each assignment self‑contained and portable.

```r
# In assignments/02-regression/regression.Rproj
install.packages("here"); library(here)
here::here("data", "raw.csv")   # -> assignments/02-regression/data/raw.csv
```

> If you also keep a **top‑level** `.Rproj`, open only one project at a time. Opening the top‑level project changes where `here()` points, which can be confusing.

---

## Package management (`renv`) per subproject (optional but recommended)
```r
# inside a subproject
install.packages("renv")
renv::init()       # snapshot current state; creates renv/ and renv.lock
# later, on another machine or fresh clone
renv::restore()    # reproduces the exact package versions
```
Commit `renv.lock` and the `renv/` directory for reliable reproduction.

---

## Daily Git Workflow (RStudio + GitHub Desktop)

1) **Start of day: sync `main`**
   - **GitHub Desktop:** `Fetch origin` → `Pull origin` (main).
   - **RStudio (optional):** Git pane → **Pull** (or Terminal: `git pull --rebase`).

2) **Work in a subproject**
   - Open the specific `*.Rproj` (e.g., `assignments/02-regression/regression.Rproj`).
   - Edit, run, and save files (scripts, Quarto/Rmd, etc.).
   - Prefer small, focused commits with clear messages.

3) **Commit**
   - **GitHub Desktop:** review diffs → select only the files related to the current assignment → write a clear summary (e.g., `feat: add monthly revenue plot`) → **Commit to main**.
   - **RStudio (optional):** Git pane → stage files → **Commit**.

4) **Push to GitHub**
   - **GitHub Desktop:** **Push origin**.
   - **RStudio (optional):** **Push**.

> Tip: Commit as you go; do a final commit + push when you wrap for the day.

---

## If something bumps you

- **Push rejected (remote changed):**
  - **GitHub Desktop:** `Fetch` → `Pull origin`. If conflicts appear, use the conflict UI: open files, resolve, **Mark as resolved**, **Commit merge**, then **Push**.
  - **Terminal (equivalent):**
    ```bash
    git pull --rebase origin main
    # resolve conflicts in your editor
    git add <fixed-files>
    git rebase --continue
    git push
    ```

- **Undo last commit (keep the changes):**
  - **GitHub Desktop:** `History` → right‑click last commit → **Revert** (creates a new commit) or **Amend last commit** if it’s unpushed.
  - **Terminal:** `git reset --soft HEAD~1`

- **Discard local edits to a file:**
  - **GitHub Desktop:** right‑click file → **Discard changes**.
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

## One‑time Git setup (reference)
```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global pull.rebase true
git config --global rebase.autoStash true
```
If first push from a new machine: `git push -u origin main`.

---

## .gitignore (repo‑wide; covers all subprojects)
```
**/.Rproj.user/
**/.Rhistory
**/.RData
**/.Ruserdata
**/.Renviron
**/output/
.DS_Store
```
> Keep secrets in `.Renviron` (don’t commit). Avoid committing files >100 MB (use Git LFS if necessary).

---

## Monorepo vs. multiple repos
- **Monorepo (this):** one GitHub repo with many subprojects. Pros: centralization, shared templates. Cons: commits show changes across assignments unless you stage carefully.
- **Multiple repos:** one repo per assignment. Pros: clean history and sharing. Cons: more setup/overhead.

Choose what fits your course requirements.

---

## Optional: Quarto/R Markdown
- Prefer **Quarto** (`.qmd`) for reproducible reports. Render with the IDE’s **Render** button or `quarto render` in Terminal.
- For R Markdown, use `rmarkdown::render()` or **Knit** in the IDE.

---

## Good hygiene
- Descriptive commit messages (`type: summary`), e.g., `fix: handle NA dates`.
- Keep generated artifacts in each subproject’s `output/` (ignored if not needed in history).
- Never commit API keys or secrets; use `.Renviron` / environment variables.
- Consider `renv` to lock package versions per subproject for reproducibility.
