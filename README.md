# Homebrew sparkling

`brew sparkling install` to install iOS apps over Lightning.

## Features

 * Search sparkling recipe.
 * Install iOS app to your device via lingtning cable.
 * Manage iOS app installed by brew sparkling. (not yet)

## Install

```
brew install codefirst/sparkling/brew-sparkling --HEAD
```

## Development

### Requirements

 * Xcode 7.0 beta 5 (7A176x)
 * [SparklingHelper](https://github.com/codefirst/SparklingHelper)

### Build

```
bundle
bundle exec ./bin/brew-sparkling help
```

### Usage
#### Show xcode information

```sh
# Discover SparklingHelper
brew sparkling discover

# show all accounts
brew sparkling accounts

# show all certificates
brew sparkling certificates

# show all iOS devices
brew sparkling devices
```

#### Build iOS App

```sh
# install recipe
brew sparkling install <recipe name>
```

#### Manage Recipe

```sh
# list all recipes
brew sparkling list

# search recipes
brew sparkling search <search word>
```

## Limitations
Because Sparkling uses [free provisioning](https://developer.apple.com/library/prerelease/ios/documentation/IDEs/Conceptual/AppDistributionGuide/LaunchingYourApponDevices/LaunchingYourApponDevices.html#//apple_ref/doc/uid/TP40012582-CH27) to instal app, there are some limitations.

 * Cannot use any capability(e.g. AppGroup, AppInPurchase, ...)
 * Reinstall each apps per 3 months.

