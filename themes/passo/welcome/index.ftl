<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PaSSO | Single Sign-On Portal</title>
    <link rel="icon" type="image/png" href="${resourcesPath}/img/passo-logo-icon.png">
    <#if properties.stylesCommon?has_content>
      <#list properties.stylesCommon?split(' ') as style>
        <link rel="stylesheet" href="${resourcesCommonPath}/${style}">
      </#list>
    </#if>
    <#if properties.styles?has_content>
      <#list properties.styles?split(' ') as style>
        <link rel="stylesheet" href="${resourcesPath}/${style}">
      </#list>
    </#if>
  </head>
  <body>
    <div class="welcome-container">
      <div class="welcome-card">
        <div class="logo-banner-wrapper">
          <img src="${resourcesPath}/img/passo-logo-full.png" alt="PaSSO" class="logo-banner-img" />
        </div>
        
        <h1 class="welcome-title">Single Sign-On Portal</h1>
        <p class="welcome-subtitle">Identity & Access Management Service</p>

        <#if adminConsoleEnabled>
          <div class="welcome-actions">
            <a class="btn-primary" href="${adminUrl}">
              Administration Console
            </a>
            <a class="btn-secondary" href="${baseUrl}realms/master/account/">
              User Account Portal
            </a>
          </div>
        </#if>

        <#if bootstrap?? && bootstrap>
          <div style="margin-top: 24px; text-align: left;">
            <#if localUser>
              <form method="post" novalidate>
                <#if errorMessage?has_content>
                  <p style="color: #DC2626; font-size: 13px;">${errorMessage}</p>
                </#if>
                <div style="margin-bottom: 12px;">
                  <label style="display:block; font-size: 13px; font-weight: 600; margin-bottom: 4px;">Username</label>
                  <input style="width:100%; padding: 8px 12px; border: 1px solid #CBD5E1; border-radius: 6px;" id="username" type="text" name="username" required>
                </div>
                <div style="margin-bottom: 12px;">
                  <label style="display:block; font-size: 13px; font-weight: 600; margin-bottom: 4px;">Password</label>
                  <input style="width:100%; padding: 8px 12px; border: 1px solid #CBD5E1; border-radius: 6px;" id="password" type="password" name="password" required>
                </div>
                <div style="margin-bottom: 12px;">
                  <label style="display:block; font-size: 13px; font-weight: 600; margin-bottom: 4px;">Password confirmation</label>
                  <input style="width:100%; padding: 8px 12px; border: 1px solid #CBD5E1; border-radius: 6px;" id="password-confirmation" type="password" name="passwordConfirmation" required>
                </div>
                <input name="stateChecker" type="hidden" value="${stateChecker}">
                <button class="btn-primary" type="submit" style="width: 100%;">Create admin user</button>
              </form>
            </#if>
          </div>
        </#if>

        <div class="welcome-footer">
          Secured by PaSSO Identity Architecture
        </div>
      </div>
    </div>
  </body>
</html>
