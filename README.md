# Smart Exam Cell — College Examination Management

A small Flask-based backend and frontend for managing college students, faculty, departments, courses, and exam scores. This repo contains a lightweight demo backend (`app.py`) and a single-page frontend served by Flask (`templates/index.html`).

## Features
- Demo authentication (admin/faculty/student) with in-memory sessions
- REST API endpoints for students, faculty, departments, courses, and scores
- Simple frontend with login, dashboard, CRUD operations

## Quick start (Windows / PowerShell)
1. Install Python 3.8+ and Git for Windows (if not already installed).
2. (Optional) create and activate a virtual environment:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
```

3. Install dependencies:

```powershell
pip install -r requirements.txt
```

4. Edit `app.py` DB_CONFIG to set your MySQL credentials (password/host/port) if needed.

5. Run the app:

```powershell
python -u "c:\Users\P MIDHUN\OneDrive\Documents\smart_exam_cell\app.py"
```

6. Open http://127.0.0.1:5000 in a browser.

## Demo credentials
- Admin: admin@college.edu / admin123
- Faculty: faculty@college.edu / faculty123
- Student: student@college.edu / student123

## Replace logo
Add the official Kumaraguru College of Technology logo to `static/` as `kct-logo.svg` or update `templates/index.html` to point to your logo filename.

## How to push to GitHub (PowerShell)
1. Create a new repository on GitHub (do not initialize with README).
2. Run these commands locally (replace `<GITHUB_URL>` with your repo URL):

```powershell
cd "c:\Users\P MIDHUN\OneDrive\Documents\smart_exam_cell"
# initialize git, add files, commit
git init
git add .
git commit -m "Initial commit — Smart Exam Cell (add README, logo, fixes)"
# add remote and push
git remote add origin <GITHUB_URL>
# replace main with your default branch if different
git branch -M main
git push -u origin main
```

If you need help creating the remote repo or want me to prepare a GitHub Actions file or license, tell me which license you prefer and I can add it.

## Notes
- This project uses MySQL — ensure a MySQL server is running and `DB_CONFIG` in `app.py` matches your connection details.
- The frontend uses the backend endpoints; make sure CORS and host/port are correct when serving from another host.

---
If you want, I can:
- Attempt to run git commands here if you install Git in the environment, or
- Help you create a GitHub repo and push using a provided remote URL (I will not ask for secrets; you'll run the final push locally).
