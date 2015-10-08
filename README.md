# Chiffrer des secrets dans les pillars de Salt

## Je crée une paire de clés

Sur le serveur, je crée une clé publique et une clé privée :

```
$ sudo gpg --gen-key --homedir /etc/salt/gpgkeys
```

Je note l'ID et j'exporte la clé publique :

```
$ sudo gpg --armor --homedir /etc/salt/gpgkeys --armor --export XXXXXXXX >/vagrant/production.pub
```

## Je chiffre mes secrets

Sur ma machine, j'importe la clé publique :

```
$ gpg --import production.pub
```

Je chiffre un secret avec cette clé publique :

```
$ echo "MySuperSecret" | gpg --armor --encrypt -r XXXXXXXX
```

Je colle le résultat dans les pillars.

## J'active le renderer GPG

J'édite le fichier `/etc/salt/minion` pour ajouter la ligne :

```
renderer: jinja | yaml | gpg
```

Je redémarre le minion :

```
$ sudo service salt-minion restart
```

Je relance un `highstate`:

```
$ sudo salt-call --local state.highstate
```
