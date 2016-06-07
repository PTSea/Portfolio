import webapp2
from google.appengine.ext import ndb
import db_models
import json
import patients
import datetime

class Drugs(webapp2.RequestHandler):
	def post(self):
		self.response.headers.add_header('Access-Control-Allow-Origin', 'https://pharmassig3a.appspot.com/assignment4')
		self.response.headers['Content-Type'] = 'application/json'
		# creates a Patient entity
		# nick - required nickname
		# email - email address
		# name - real name
		
		if 'application/json' not in self.request.accept:
			self.response.status = 406
			self.response.status_message = 'Not Acceptable, API only supports application/json MIME type'
			return
		new_drugs = db_models.Drugs()
		today = datetime.date.today()
		entryKey = self.request.get('entryKey', default_value = None)
		assocID = self.request.get('assocID', default_value = None)
		dID = self.request.get('dID', default_value = None)
		name = self.request.get('name', default_value = None)
		price = self.request.get('price', default_value = None)
		qty = self.request.get('qty', default_value = None)
		refills = self.request.get('refills', default_value = None)
		expMonth = self.request.get('expMonth', default_value = today.month)
		expDay = self.request.get('expDay', default_value = today.day)
		expYear = self.request.get('expYear', default_value = today.year)
		expiration = self.request.get('expiration', default_value = None)

		if entryKey:
			new_drug.entryKey = int(entryKey)
		else:
			self.response.status = 400
			self.response.status_message = 'Invalid request. EntryKey is required'
		if assocID:
			new_drug.assocID = int(assocID)
		else:
			self.response.status = 400
			self.response.status_message = 'Invalid request. AssocID is required'
		if dID:
			new_drug.dID = int(dID)
		else:
			self.response.status = 400
			self.response.status_message = 'Invalid request. Drug ID is required'
		if name:
			new_drug.name = name
		else:
			self.response.status = 400
			self.response.status_message = 'Invalid request. Drug Name is required'
		if price:
			new_drug.price = float(price)
		else:
			self.response.status = 400
			self.response.status_message = 'Invalid request. Drug Price is required'
		if qty:
			new_drug.qty = int(qty)
		else:
			self.response.status = 400
			self.response.status_message = 'Invalid request. Drug qty is required'
		if refills:
			new_drug.refills = int(refills)
		else:
			self.response.status = 400
			self.response.status_message = 'Invalid request. Drug refill count is required'
		if expDay:
			new_drug.expDay = int(expDay)
		else:
			self.response.status = 400
			self.response.status_message = 'Invalid request. Expiration day is required'
		if expMonth:
			new_drug.expMonth = int(expMonth)
		else:
			self.response.status = 400
			self.response.status_message = 'Invalid request. Expiration month is required'
		if expYear:
			new_drug.expYear = int(expYear)
		else:
			self.response.status = 400
			self.response.status_message = 'Invalid request. Expiration year is required'
		new_drug.expiration = datetime.date(expYear, expMonth, expDay)


		key = new_drug.put()
		out = new_drug.to_dict()
		self.response.write(json.dumps(out))


	def get(self, **kwargs):
		self.response.headers.add_header('Access-Control-Allow-Origin', 'https://pharmassig3a.appspot.com/assignment4')
		self.response.headers['Content-Type'] = 'application/json'
		# Query a Drug entity
		if 'application/json' not in self.request.accept:
			self.response.status = 406
			self.response.status_message = 'Not Acceptable, API only supports application/json MIME type'
			return
		if 'id' in kwargs:
			out = ndb.Key(db_models.Drugs, int(kwargs['id'])).get().to_dict()
			self.response.write(json.dumps(out))
		else:
			q = db_models.Drugs.query()
			keys = q.fetch(keys_only = True)
			results = {'keys': [x.id() for x in keys]}
			self.response.write(json.dumps(results))


	def delete(self, **kwargs):
		self.response.headers.add_header('Access-Control-Allow-Origin', 'https://pharmassig3a.appspot.com/assignment4')
		self.response.headers['Content-Type'] = 'application/json'
		# Delete a Drug entity
		if 'application/json' not in self.request.accept:
			self.response.status = 406
			self.response.status_message = 'Not Acceptable, API only supports application/json MIME type'
			return
		if 'id' in kwargs:
			key = ndb.Key(db_models.Drugs, int(kwargs['id']))
			key.delete()
		else:
			self.response.status = 400
			self.response.status_message = 'Invalid request. No key found.'


	def put(self, **kwargs):
		self.response.headers.add_header('Access-Control-Allow-Origin', 'https://pharmassig3a.appspot.com/assignment4')
		self.response.headers['Content-Type'] = 'application/json'
		# Modify a Drug Entity
		today = datetime.date.today()
		entryKey = self.request.get('entryKey', default_value = None)
		assocID = self.request.get('assocID', default_value = None)
		dID = self.request.get('dID', default_value = None)
		name = self.request.get('name', default_value = None)
		price = self.request.get('price', default_value = None)
		qty = self.request.get('qty', default_value = None)
		refills = self.request.get('refills', default_value = None)
		expMonth = self.request.get('expMonth', default_value = today.month)
		expDay = self.request.get('expDay', default_value = today.day)
		expYear = self.request.get('expYear', default_value = today.year)
		expiration = self.request.get('expiration', default_value = None)

		if 'application/json' not in self.request.accept:
			self.response.status = 406
			self.response.status_message = 'Not Acceptable, API only supports application/json MIME type'
			return
		if 'id' in kwargs:
			key = ndb.Key(db_models.Drugs, int(kwargs['id']))
			# self.response.write(key)
			keynum = int(key.id())
			# self.response.write(keynum)
			
			drugObj = key.get()
			
			if assocID:
				drugObj.assocID = int(assocID)
			if dID:
				drugObj.dID = int(dID)
			if name:
				drugObj.name = name
			if price:
				drugObj.price = float(price)
			if qty:
				drugObj.qty = int(qty)
			if refills:
				drugObj.refills = int(refills)
			if expDay:
				drugObj.expDay = int(expDay)
			if expMonth:
				drugObj.expMonth = int(expMonth)
			if expYear:
				drugObj.expYear = int(expYear)
			drugObj.expiration = datetime.date(expYear, expMonth, expDay)				

			drugObj.put()
			drug = drugObj.to_dict()
			self.response.write(drug)

		else:
			self.response.status = 400
			self.response.status_message = 'Invalid request. No key found.'

	def options(self):
		self.response.headers['Access-Control-Allow-Origin'] = 'https://pharmassig3a.appspot.com/assignment4'
		self.response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept'
		self.response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE'

