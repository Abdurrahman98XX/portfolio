# requirments when developing this app

## creating entities

### the easy way

- (vscode snippets) type entity and it'll create it for ya, type the `Name` for class then the new `prop` name and then the `prop`'s `Type`

### manual way

- extend `BaseEntity` class when creating a new entity class
- annotate with `@JsonSerializable(converters: converters)`
- define the new `prop`
- add it to `copyWith` parameter (make it nullable)

---

- **VERY IMPORTANT !!!** : you must add every new `property` you declare to the `equality` list, in order to make the entity functional (used for hasing and equality assertion)

- never use string literals for UI, use localization

a pub to be add {connectivity_plus}