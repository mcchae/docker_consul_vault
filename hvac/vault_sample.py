import os
import hvac
import time

#client = hvac.Client()
print('VAULT_URL=%s' % os.environ['VAULT_URL'])
print('VAULT_TOKEN=%s' % os.environ['VAULT_TOKEN'])
client = hvac.Client(
    url=os.environ['VAULT_URL'],
    token=os.environ['VAULT_TOKEN']
)
print('is_authenticated? %s' % client.is_authenticated())
client.write('myroot/hello/world', key1='val1', key2='val2')
print(client.read('myroot/hello/world'))
client.logout()
