#/bin/bbash
erl -setcookie lager -name lager_test@127.0.0.1 -pa ./_build/dev/lib/*/ebin -config ./config/sys.config 
