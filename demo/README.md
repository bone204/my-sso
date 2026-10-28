# PaSSO - Test Client Applications (SSO Demonstration)

This directory contains 2 independent client web applications designed to test and demonstrate **Single Sign-On (SSO)** using PaSSO:

1. **`app1.html`**: PaSSO Workspace Portal (Client ID: `passo-app1`)
2. **`app2.html`**: PaSSO Analytics Portal (Client ID: `passo-app2`)

---

## How SSO Works Between App 1 and App 2

```
+-----------------------------------------------------------------+
|                        PaSSO (Keycloak 26)                      |
|                  http://localhost:8080/realms/master            |
+-----------------------------------------------------------------+
             ^                                       ^
             | 1. Authenticate Once                  | 2. Auto Single Sign-On
             v                                       v
+-----------------------------+         +-----------------------------+
|    App 1: Workspace Portal  | <=====> |    App 2: Analytics Portal  |
|         (app1.html)         |         |         (app2.html)         |
+-----------------------------+         +-----------------------------+
```

1. You log into **App 1** $\rightarrow$ It redirects to Keycloak with the **PaSSO** custom theme.
2. You sign in once with your credentials.
3. You are redirected back to **App 1** as an authenticated user.
4. You open **App 2** in a new tab $\rightarrow$ **App 2 automatically detects your existing PaSSO session** and signs you in immediately without asking for your password again!
5. When you click **Sign Out** in either app, it logs you out of the central PaSSO session.

---

## Quick Testing Options

### Option A: Instant UI Simulation (No Server Needed)
1. Double-click `app1.html` or `app2.html` directly in your browser.
2. Click **"🧪 Test Simulation Mode"** at the bottom of the card.
3. Experience the authenticated state, user profile card, decoded token viewer, and navigation between both apps.

---

### Option B: Live SSO Testing with Keycloak

#### 1. Configure Clients in Keycloak Admin Console
Log into `http://localhost:8080/admin` $\rightarrow$ Clients $\rightarrow$ Create client:

* **Client 1**:
  - Client ID: `passo-app1`
  - Client authentication: `Off` (Public Client)
  - Valid redirect URIs: `*` (or `http://localhost:*`)
  - Web origins: `*`

* **Client 2**:
  - Client ID: `passo-app2`
  - Client authentication: `Off` (Public Client)
  - Valid redirect URIs: `*` (or `http://localhost:*`)
  - Web origins: `*`

#### 2. Serve the Demo Pages via a Local HTTP Server
Because modern browsers restrict CORS requests from `file:///` URLs, serve the demo folder over HTTP:

```bash
# Using Python:
cd demo
python -m http.server 3000

# OR using Node.js:
npx serve demo -p 3000
```

Then visit:
- **App 1**: `http://localhost:3000/app1.html`
- **App 2**: `http://localhost:3000/app2.html`
