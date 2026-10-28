# PaSSO - Test Client Applications (Cross-Origin SSO Demonstration)

This directory contains 2 independent client web applications designed to test and demonstrate cross-origin **Single Sign-On (SSO)** using PaSSO:

1. **`demo/app1/`**: Nova Workspace (Client ID: `passo-app1`, running on **Port 3001**)
2. **`demo/app2/`**: Pulse Analytics (Client ID: `passo-app2`, running on **Port 3002**)

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
|    App 1: Nova Workspace    | <=====> |   App 2: Pulse Analytics    |
|    http://localhost:3001    |         |    http://localhost:3002    |
+-----------------------------+         +-----------------------------+
```

1. You visit **Nova Workspace** at `http://localhost:3001` $\rightarrow$ Click **"Sign In with PaSSO"**.
2. It redirects to Keycloak at `http://localhost:8080` displaying the **PaSSO** custom theme.
3. You sign in once with your credentials.
4. You are redirected back to **Nova Workspace** as an authenticated user with an active session.
5. You open **Pulse Analytics** at `http://localhost:3002` in a new tab $\rightarrow$ **Pulse Analytics automatically detects your existing PaSSO session** (cross-origin SSO) and logs you in immediately without prompting for your credentials again!
6. Clicking **Sign Out** in either application terminates the central session on Keycloak.

---

## Running with Docker Compose (Recommended)

Both demo applications are pre-configured in `docker-compose.yml` to run in their own isolated Nginx containers:

```bash
docker compose up -d
```

- **App 1 (Nova Workspace)**: [http://localhost:3001](http://localhost:3001)
- **App 2 (Pulse Analytics)**: [http://localhost:3002](http://localhost:3002)

---

## Keycloak Client Configuration

Before live OIDC authentication, register both clients in the Keycloak Admin Console (`http://localhost:8080/admin`):

* **Client 1**:
  - Client ID: `passo-app1`
  - Client authentication: `Off` (Public Client)
  - Valid redirect URIs: `http://localhost:3001/*`
  - Web origins: `http://localhost:3001`

* **Client 2**:
  - Client ID: `passo-app2`
  - Client authentication: `Off` (Public Client)
  - Valid redirect URIs: `http://localhost:3002/*`
  - Web origins: `http://localhost:3002`

---

## Instant UI Simulation Mode (No Keycloak Required)

If Keycloak is not running, each app includes an interactive **"🧪 Test Simulation Mode"** button. This lets you inspect the authenticated layout, user profile card, decoded token viewer, and cross-application navigation directly in your browser.
