.PHONY: analyze
analyze:
	dart format --set-exit-if-changed .
	dart analyze;

.PHONY: app
app:
	flutter run --profile

.PHONY: generate
generate:
	flutter pub run build_runner build --delete-conflicting-outputs; \
    flutter gen-l10n;

.PHONY: test
test:
	flutter test
