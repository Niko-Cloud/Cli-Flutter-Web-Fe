# CLI Flutter Web Frontend

A terminal-style portfolio web application built with **Flutter Web** and **Riverpod State Management**.  
This app simulates a real CLI (Command-Line Interface) experience in the browser, powered by a Go backend API.

DEMO : [Here](https://niko-cloud.github.io/Cli-Flutter-Web-Fe/)

➡️ Frontend for the backend: [Here](https://github.com/Niko-Cloud/CLI-Go-Web-Backend)

---

## Overview

This project renders your portfolio data as a **CLI UI in the browser**, with features like:

- Command parsing (`whoami`, `help`, `skills`, `showcase`, `work`, `education`, `contact`)
- Interactive terminal input
- Async API fetching with mock fallback
- Auto-scroll and cursor simulation
- Clickable links in output
- Terminal command history
- Realistic terminal UI (Mac style)

---

## Key Features

✔ Terminal UI (CLI-like)  
✔ Input editing (Arrow keys, backspace, paste)  
✔ Async remote API calls (Dio)  
✔ Mock fallback when backend unreachable  
✔ Riverpod for state management  
✔ Responsive and clean UI  
✔ Clickable links (GitHub, LinkedIn, etc.)

---

## Tech Stack

| Layer | Technology |
|-------|------------|
| Frontend | Flutter Web |
| State Management | Riverpod 3.x |
| HTTP Client | Dio |
| URL Handling | `Link` widget |
| Terminal UI | Custom Flutter widgets |
| Backend Integration | REST API (Go Gin) |

---
## Getting Started

### Requirements

- Flutter 3.0+  
- Dart 2.18+  
- Optional: Go backend running (locally or deployed)

---

