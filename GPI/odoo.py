import xmlrpc.client as xc

"""url = 'https://drusq.odoo.com'
db = 'drusq'
username = 'cgardillacurada7@gmail.com'
password = '120696'

#info = xmlrpc.client.ServerProxy('https://drusq.odoo.com').start()
#url, db, username, password = \
#    info['host'], info['database'], info['user'], info['password']

common = xc.ServerProxy('{}/xmlrpc/2/common'.format(url))
print (common.version())

uid = common.authenticate(db, username, password, {})

models = xc.ServerProxy('{}/xmlrpc/2/object'.format(url))
models.execute_kw(db, uid, password,
    'res.partner', 'check_access_rights',
    ['read'], {'raise_exception': False})

print (models.execute_kw(
    db, uid, password, 'res.partner', 'fields_get',
    [], {'attributes': ['string', 'help', 'type']}))



j=ids = models.execute_kw(db, uid, password,
    'res.partner', 'search',
    [[['is_product', '=', True], ['customer', '=', True]]],
    {'limit': 1})
[record] = models.execute_kw(db, uid, password,
    'res.partner', 'read', [ids])

print(j)"""

############################################
############################################
############################################
class ODOO():
    def _init_(self, url, db, username, password):
        self.url = url
        self.db = db
        self.username = username
        self.password = password
        self.common = None
        self.uid = None
        self.models = None

    def connect(self):
        try:
            self.common = xc.ServerProxy('{}/xmlrpc/2/common'.format(self.url))
            self.uid = self.common.authenticate(self.db, self.username, self.password, {})
            self.models = xc.ServerProxy('{}/xmlrpc/2/object'.format(self.url))
            return self.models
        except:
            return "error in connection"

    def search(self, model_name, params):
        print(self.models.execute_kw(self.db, self.uid, self.password, 'purchase.order', 'search_read', [], {
            'fields': ['partner_id', 'state', 'amount_total', 'data_order', 'notes', 'order_line']}))
        try:
            self.connect()
            print(self.models.execute_kw(self.db, self.uid, self.password, 'purchase.order', 'search_read', [],{'fields': ['partner_id', 'state', 'amount_total', 'data_order', 'notes', 'order_line']} ))
            return self.models.execute_kw(self.db, self.uid, self.password,'purchase.order', 'search_read', params,{'fields': ['partner_id', 'state', 'amount_total', 'data_order', 'notes', 'order_line']})
            #print(self.models.execute_kw(self.db, self.uid, self.password, 'purchase.order', 'fields_get',[], {'attributes': ['string', 'help', 'type']}))
            #ids = self.models.execute_kw(self.db, self.uid, self.password, model_name, 'search', [params])
            #print(self.models.execute_kw(self.db, self.uid, self.password,'product.order', 'read',[ids], {'fields': ['name',]}))
            #self.models.execute_kw(self.db, self.uid, self.password, model_name, 'search', [params])
        except:
            return -1