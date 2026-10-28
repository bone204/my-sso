# PaSSO - Modern Clean Minimalist Keycloak 26 Theme

A modern, clean, and minimalist Single Sign-On (SSO) theme for **Keycloak 26**, extending `keycloak.v2` with inspiration from `mmlabs.online/apps/sso`.

## Design Highlights
- **Background**: Soft `#F8FAFC` canvas with a technical micro dot-grid pattern (`radial-gradient(#E2E8F0 1px, transparent 1px)`).
- **Form Card**: Pure white `#FFFFFF` card with thin border (`1px solid #E2E8F0`), `16px` border radius, and soft ambient shadow.
- **Brand Identity**: Prominent **PaSSO | Single Sign-On** typography with dual presentation options (App Icon vs Full Brand Logo).
- **Form Controls**: Crisp `#FFFFFF` input fields with `8px` rounded corners and vibrant Cyan `#0284C7` focus rings.
- **Primary CTA**: Elegant Slate `#0F172A` button with interactive elevation and smooth transition to Cyan `#0284C7` on hover.
- **Identity Providers**: Clean flat-bordered buttons for Google, GitHub, and other OIDC/SAML providers.

---

## Directory Structure

```
PaSSO/
├── .env.example                # Environment variables template
├── .env                        # Active environment configuration (Supabase credentials)
├── .gitignore                  # Prevents accidental commits of secrets
├── docker-compose.yml          # Container orchestration for Keycloak 26
├── preview.html                # Visual comparison of logo styles
└── themes/
    └── passo/                  # Theme ID: passo
        └── login/
            ├── theme.properties
            ├── login.ftl
            └── resources/
                ├── css/
                │   └── custom.css
                └── img/
                    ├── passo-logo-icon.png
                    └── passo-logo-full.png
```

---

## Supabase PostgreSQL Integration

Supabase provides a hosted PostgreSQL instance that works seamlessly with Keycloak. Configure your credentials in `.env`:

```ini
KC_DB=postgres

# Option 1: Direct Connection (Port 5432)
KC_DB_URL=jdbc:postgresql://db.YOUR_PROJECT_REF.supabase.co:5432/postgres?sslmode=require
KC_DB_USERNAME=postgres
KC_DB_PASSWORD=YOUR_SUPABASE_PASSWORD

# Option 2: Session Pooler (Port 5432, IPv4 compatible)
# NOTE: You MUST use port 5432 (Session mode). DO NOT use port 6543 (Transaction mode)
# because Keycloak migrations require PostgreSQL session-level advisory locks.
# KC_DB_URL=jdbc:postgresql://aws-0-ap-southeast-2.pooler.supabase.com:5432/postgres?sslmode=require
# KC_DB_USERNAME=postgres.YOUR_PROJECT_REF
# KC_DB_PASSWORD=YOUR_SUPABASE_PASSWORD

KC_BOOTSTRAP_ADMIN_USERNAME=admin
KC_BOOTSTRAP_ADMIN_PASSWORD=admin
```

> [!IMPORTANT]
> **Keycloak & Supabase Technical Requirements:**
> 1. Keycloak uses Liquibase to manage schema initialization on startup, which relies on PostgreSQL session-level advisory locks. If using Supabase Connection Pooler, **always use port 5432 (Session mode)**, never port 6543 (Transaction mode).
> 2. The `?sslmode=require` query parameter is strictly mandatory because Supabase enforces encrypted SSL connections.

---

## Quick Start

```bash
# Launch Keycloak connected to Supabase
docker compose up -d

# View live container logs
docker compose logs -f keycloak
```

*(To run an offline local PostgreSQL instance instead of Supabase: `docker compose --profile local-db up -d`)*

---

## Logo Display Options

You can toggle between two logo presentations in `themes/passo/login/theme.properties`:

```properties
# Option 2: Full logo with brand typography (Active default)
passoLogoStyle=full

# Option 1: App Icon
# passoLogoStyle=icon
```

Double-click `preview.html` in your browser to inspect both layouts side-by-side.

---

## Activating the PaSSO Theme

1. Open Keycloak Admin Console at `http://localhost:8080/admin` (Credentials: `admin` / `admin`).
2. Select your Realm (e.g. `master` or your custom realm).
3. Navigate to **Realm settings** $\rightarrow$ **Themes** tab.
4. Set **Login theme** to **`passo`**.
5. Click **Save** to apply immediately.