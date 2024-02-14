enum StateStatus {
  initial,
  loading,
  success,
  failure,
  validationError,
  validated,
  edited
}

enum InfoProgressStatus { active, inactive }

enum PhotoTypes { frontId, backId, selfie }

enum TransportPhotoType { main, back, left, right, inside }

enum OrderButtonTypes {
  notAvailable,
  activate,
  orderTracking,
  complete,
  duplicate,
  start
}

enum OrderIcon {
  orderSize,
  dimensions,
  date,
  time,
  locationA,
  floor,
  riseToFloor,
  courier,
  locationB,
  none,
}
