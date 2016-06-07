import webapp2
from google.appengine.ext import ndb
import db_models
import json
import drugs

class Patients(webapp2.RequestHandler):
	def post(self):
		# self.response.headers['Access-Control-Allow-Origin'] = 'https://web.engr.oregonstate.edu'
		self.response.headers.add_header('Access-Control-Allow-Origin', 'https://ptfinalproject.appspot.com/assignment4')
		self.response.headers['Content-Type'] = 'application/json'
		# creates a Patient entity
		# nick - required nickname
		# email - email address
		# name - real name
		
		if 'application/json' not in self.request.accept:
			self.response.status = 406
			self.response.status_message = 'Not Acceptable, API only supports application/json MIME type'
			return
		new_patient = db_models.Patients()

		pID = self.request.get('pID', default_value = None)
		name = self.request.get('name', default_value = None)
		age = self.request.get('age', default_value = None)
		sex = self.request.get('sex', default_value = None)
		pharm = self.request.get('pharm', default_value = None)

		height = self.request.get('height', default_value = None)
		weight = self.request.get('weight', default_value = None)
		cholesterol = self.request.get('cholesterol', default_value = None)
		bloodsug = self.request.get('bloodsug', default_value = None)
		bpresSyst = self.request.get('bpresSyst', default_value = None)
		bpresDias = self.request.get('bpresDias', default_value = None)
		assocdID = self.request.get('assocdID', default_value = None)


		entryKey = self.request.get('entryKey', default_value = None)
		assocID = self.request.get('assocID', default_value = None)

		if pID:
			new_patient.pID = int(pID)
		else:
			self.response.status = 400
			self.response.status_message = 'Invalid request. Patient ID is required'
		if name:
			new_patient.name = name
		else:
			self.response.status = 400
			self.response.status_message = 'Invalid request. Patient name is required'
		if age:
			new_patient.age = int(age)
		else:
			self.response.status = 400
			self.response.status_message = 'Invalid request. Patient age is required'
		if sex:
			new_patient.sex = sex
		else:
			self.response.status = 400
			self.response.status_message = 'Invalid request. Patient sex is required'
		if pharm:
			new_patient.pharm = pharm
		else:
			self.response.status = 400
			self.resonse.status_message = 'Invalid request. Pharmacist name is required'

		# not required information		
		if height:
			new_patient.height = int(height)
		if weight:
			new_patient.weight = int(weight)
		if cholesterol:
			new_patient.cholesterol = int(cholesterol)
		if bloodsug:
			new_patient.bloodsug = int(bloodsug)
		if bpresSyst:
			new_patient.bpresSyst = int(bpresSyst)
		if bpresDias:
			new_patient.bpresDias = int(bpresDias)	

		patKey = new_patient.put() # create key and ID pairing
		patKeyID = patKey.id() # grab the ID specifically
		
		# START ENTRY FOR DRUG
		new_drug = db_models.Drugs()
		
		new_drug.entryKey = patKeyID # set the entry key to be the same as the ID for the patient entry
		new_drug.assocID = int(pID) # set the associated ID to be the same as the Patient's ID
		drugKey = new_drug.put() # create key and ID pairing for a drug
		drugKeyID = drugKey.id() # grab the ID specifically
		new_patient.assocdID = drugKeyID
		new_patient.put()

		outDrug = new_drug.to_dict()
		outPat = new_patient.to_dict()

		self.response.write(json.dumps(outPat)) # write out json data
		# self.response.write(json.dumps(outDrug))


	def get(self, **kwargs):
		self.response.headers.add_header('Access-Control-Allow-Origin', 'https://ptfinalproject.appspot.com/assignment4')
		self.response.headers['Content-Type'] = 'application/json'
		# Query a Patient entity
		if 'application/json' not in self.request.accept:
			self.response.status = 406
			self.response.status_message = 'Not Acceptable, API only supports application/json MIME type'
			return
		if 'id' in kwargs:
			out = ndb.Key(db_models.Patients, int(kwargs['id'])).get().to_dict()
			self.response.write(json.dumps(out))
		else:
			q = db_models.Patients.query()
			keys = q.fetch(keys_only = True)
			results = {'keys': [x.id() for x in keys]}
			self.response.write(json.dumps(results))


	def delete(self, **kwargs):
		# Delete a Patient entity (and the associated drug entity)
		self.response.headers.add_header('Access-Control-Allow-Origin', 'https://ptfinalproject.appspot.com/assignment4')
		self.response.headers['Content-Type'] = 'application/json'
		if 'application/json' not in self.request.accept:
			self.response.status = 406
			self.response.status_message = 'Not Acceptable, API only supports application/json MIME type'
			return
		if 'id' in kwargs:
			key = ndb.Key(db_models.Patients, int(kwargs['id']))
			# self.response.write(key)

			# LOOK UP DRUG BASED ON ENTRY KEY WHICH EQUALS ID OF PATIENT ENTITY
			# RETURNS ME A DRUG ENTITY
			qry = db_models.Drugs.query(db_models.Drugs.entryKey == int(kwargs['id'])).get().to_dict()
			# RETURNS ME THE KEY OF THE DRUG ENTITY!!!
			tester = qry.get('key')
			# self.response.write(tester)
			drugKey = ndb.Key(db_models.Drugs, tester)
			drugKey.delete()
			
			key.delete()
		else:
			self.response.status = 400
			self.response.status_message = 'Invalid request. No key found.'


	def put(self, **kwargs):
		self.response.headers.add_header('Access-Control-Allow-Origin', 'https://ptfinalproject.appspot.com/assignment4')
		self.response.headers['Content-Type'] = 'application/json'
		# Modify a Patients Entity
		pID = self.request.get('pID', default_value = None)
		name = self.request.get('name', default_value = None)
		age = self.request.get('age', default_value = None)
		sex = self.request.get('sex', default_value = None)
		pharm = self.request.get('pharm', default_value = None)

		height = self.request.get('height', default_value = None)
		weight = self.request.get('weight', default_value = None)
		cholesterol = self.request.get('cholesterol', default_value = None)
		bloodsug = self.request.get('bloodsug', default_value = None)
		bpresSyst = self.request.get('bpresSyst', default_value = None)
		bpresDias = self.request.get('bpresDias', default_value = None)
		assocdID = self.request.get('assocdID', default_value = None)

		entryKey = self.request.get('entryKey', default_value = None)
		assocID = self.request.get('assocID', default_value = None)

		if 'application/json' not in self.request.accept:
			self.response.status = 406
			self.response.status_message = 'Not Acceptable, API only supports application/json MIME type'
			return
		if 'id' in kwargs:
			patkey = ndb.Key(db_models.Patients, int(kwargs['id']))
			keynum = int(patkey.id())
			patObj = patkey.get()

			# LOOK UP DRUG BASED ON ENTRY KEY WHICH EQUALS ID OF PATIENT ENTITY
			# RETURNS ME A DRUG ENTITY
			qry = db_models.Drugs.query(db_models.Drugs.entryKey == int(kwargs['id'])).get().to_dict()
			# RETURNS ME THE KEY OF THE DRUG ENTITY!!!
			tester = qry.get('key')
			#self.response.write(tester)

			drugKey = ndb.Key(db_models.Drugs, tester)
			drugObj = drugKey.get()

			if pID:
				patObj.pID = int(pID)
				drugObj.assocID = int(pID)
			if name:
				patObj.name = name
			if age:
				patObj.age = int(age)
			if sex:
				patObj.sex = sex
			if pharm:
				patObj.pharm = pharm
			if height:
				patObj.height = int(height)
			if weight:
				patObj.weight = int(weight)
			if cholesterol:
				patObj.cholesterol = int(cholesterol)
			if bloodsug:
				patObj.bloodsug = int(bloodsug)
			if bpresSyst:
				patObj.bpresSyst = int(bpresSyst)
			if bpresDias:
				patObj.bpresDias = int(bpresDias)	

			patObj.put()
			drugObj.put()
			patient = patObj.to_dict()
			self.response.write(patient)

		else:
			self.response.status = 400
			self.response.status_message = 'Invalid request. No key found.'

	def options(self):
		self.response.headers['Access-Control-Allow-Origin'] = 'https://ptfinalproject.appspot.com/assignment4'
		self.response.headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept'
		self.response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE'


