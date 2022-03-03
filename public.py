from flask import *
from database import *


public=Blueprint('public',__name__)

@public.route('/')
def home():
	return render_template('home.html')

@public.route('/login',methods=['get','post'])
def login():
	if "LOGIN" in request.form:
		username=request.form['uname']
		password=request.form['pwd']
		q="select * from login  where username='%s' and password='%s'"%(username,password)
		res=select(q)
		print(res)
		if res:
			lid=res[0]['login_id']
			if res[0]['user_type']=="admin":
				return redirect(url_for('admin.adminhome'))
			elif res[0]['user_type']=="user":
				q="select * from user where login_id='%s'"%(lid)
				res=select(q)
				session['uid']=res[0]['user_id']
				return redirect(url_for('user.userhome'))
		else:
			flash("COMPLETE YOUR REGISTRATION BEFORE TRY TO LOGIN")
	return render_template('login.html')

@public.route('/userregistration',methods=['get','post'])
def userregistration():
	if "REGISTER" in request.form:
		firstname=request.form['fname']
		lastname=request.form['lname']
		place=request.form['plc']
		phone=request.form['ph']
		email=request.form['em']
		gender=request.form['gender']
		address=request.form['add']
		state=request.form['state']
		district=request.form['district']
		pincode=request.form['pin']
		username=request.form['uname']
		password=request.form['pwd']

		q="insert into login values(NULL,'%s','%s','user')"%(username,password)
		loginid=insert(q)
		q="insert into user values(NULL,'%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')"%(loginid,firstname,lastname,place,phone,email,gender,address,state,district,pincode)
		insert(q)

		flash("Register sucessfully")
		return redirect(url_for('public.userregistration'))

	return render_template("userregistration.html")