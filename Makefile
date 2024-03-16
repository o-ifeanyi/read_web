configure:
	flutterfire configure --project=read-web

deploy:
	flutter clean
	flutter pub get
	flutter build web
	firebase deploy


.PHONY: configure deploy
