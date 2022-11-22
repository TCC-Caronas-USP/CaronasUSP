import 'package:json_annotation/json_annotation.dart';

const String DEV_URL = '10.0.2.2:8551';
const String HOMOL_URL = 'caronasuspuserservice-production.up.railway.app';
const String PROD_URL = 'caronasuspuserservice-production.up.railway.app';

const String SERVER_URL = PROD_URL;
const String SERVER_HOST = PROD_URL;
const int SERVER_PORT = 8551;

const String URI_SCHEME = "https";

const String ALLOWED_EMAIL_DOMAIN = 'usp.br';

const String TIME_ZONE = 'America/Sao_Paulo';

enum AppPage {
  pegar,
  historico,
  oferecer,
  aceitar
}

enum RidePassengerStatus {
  @JsonValue(0) rejected,
  @JsonValue(1) waiting,
  @JsonValue(2) approved
}

enum InfoDetails {
  location,
  price,
  driver,
  car,
  passenger,
  whatsapp,
  maps
}

const String ONESIGNAL_APP_ID = '36a6876f-a1dd-490e-ad39-f38befcff578';
