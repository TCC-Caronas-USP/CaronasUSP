const String DEV_URL = '10.0.2.2:8551';
const String HOMOL_URL = 'caronasuspuserservice-production.up.railway.app';
const String PROD_URL = 'caronasuspuserservice-production.up.railway.app';

const String SERVER_URL = DEV_URL;
const String SERVER_HOST = "10.0.2.2";
const int SERVER_PORT = 8551;

const String ALLOWED_EMAIL_DOMAIN = 'usp.br';

const String TIME_ZONE = 'America/Sao_Paulo';

const String ONESIGNAL_APP_ID = '';

enum AccountStatus {
  banned,
  loggedIn,
  loggedOut,
  domainNotAllowed
}

enum AppPage {
  pegar,
  historico,
  oferecer
}
