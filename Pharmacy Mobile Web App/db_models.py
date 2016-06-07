from google.appengine.ext import ndb


class Model(ndb.Model):
	def to_dict(self):
		d = super(Model, self).to_dict()
		d['key'] = self.key.id()
		return d
		
class Patients(Model):
	pID = ndb.IntegerProperty(required = True)
	name = ndb.StringProperty(required = True)
	age = ndb.IntegerProperty(required = True)
	sex = ndb.StringProperty(required = True)
	pharm = ndb.StringProperty(required = True)
	height = ndb.IntegerProperty()
	weight = ndb.IntegerProperty()
	cholesterol = ndb.IntegerProperty() # optional cholesterol number
	bloodsug = ndb.IntegerProperty()  # optional blood sugar number
	bpresSyst = ndb.IntegerProperty() # optional Systolic blood pressure number 
	bpresDias = ndb.IntegerProperty() # optional Diastolic blood pressure number
	assocdID = ndb.IntegerProperty()

	
class Drugs(Model):
	entryKey = ndb.IntegerProperty(required = True)
	assocID = ndb.IntegerProperty()
	dID = ndb.IntegerProperty()
	name = ndb.StringProperty()
	price = ndb.FloatProperty()
	qty = ndb.IntegerProperty()
	refills = ndb.IntegerProperty()
	expMonth = ndb.IntegerProperty()
	expDay = ndb.IntegerProperty()
	expYear = ndb.IntegerProperty()
	expiration = ndb.DateProperty()