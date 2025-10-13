# Example script (e.g., build.sh)
FLAVOR=$1
case $FLAVOR in
  "dev")
    cp firebase_dev.json firebase.json
    flutterfire configure --out=lib/firebase_options_dev.dart --yes
    ;;
  "prod")
    cp firebase_prod.json firebase.json
    flutterfire configure --out=lib/firebase_options_prod.dart --yes
    ;;
  "staging")
    cp firebase_staging.json firebase.json
    flutterfire configure --out=lib/firebase_options_staging.dart --yes
    ;;
esac
flutter run --flavor=$FLAVOR