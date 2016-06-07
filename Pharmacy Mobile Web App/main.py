import webapp2
from google.appengine.api import oauth

app = webapp2.WSGIApplication([
	('/patients', 'patients.Patients'),
	('/drugs', 'drugs.Drugs'),
	], debug = True)

app.router.add(webapp2.Route(r'/patients/<id:[0-9]+><:/?>', 'patients.Patients'))
app.router.add(webapp2.Route(r'/drugs/<id:[0-9]+><:/?>', 'drugs.Drugs'))
