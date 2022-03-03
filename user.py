from flask import *
from database import *
import uuid

user=Blueprint('user',__name__)


@user.route('/userhome')
def userhome():
	uid=session['uid']
	print(uid)
	return render_template('userhome.html')


@user.route('/userview_certificate',methods=['get','post'])
def userview_certificate():
	uid=session['uid']
	data={}
	q="select * from certidetails"
	res=select(q)
	data['certidetails']=res
	print(res)
	# if 'action' in request.args:
	# 	action=request.args['action']
	# 	id=request.args['id']
	# 	q="insert into certirequest values(NULL,'%s','%s','pending','')"%(id,uid)
	# 	insert(q)
	return render_template('userview_certificate_details.html',data=data)

@user.route('/userview_request',methods=['get','post'])
def userview_request():
	uid=session['uid']
	data={}
	q="SELECT * FROM `certirequest` INNER JOIN `certidetails` USING(cdetails_id) INNER JOIN USER USING(user_id) where user_id='%s'"%(uid)
	res=select(q)
	data['certirequest']=res
	return render_template('userview_request.html',data=data)

@user.route('/user_send_complaint',methods=['get','post'])
def user_send_complaint():
	uid=session['uid']
	data={}
	q="select * from complaint"
	res=select(q)
	data['complaint']=res
	if 'SEND' in request.form:
		complaint=request.form['Cp']
		q="insert into complaint values (NULL,'%s','%s','pending',curdate())"%(uid,complaint)
		insert(q)
		flash("send successfully")
		return redirect(url_for('user.user_send_complaint'))
	return render_template('user_send_complaint.html',data=data)



@user.route('/userview_tax_payments',methods=['get','post'])
def userview_tax_payments():

	uid=session['uid']
	data={}
	q="select * from tax where user_id='%s'"%(uid)
	res=select(q)
	data['tax']=res
	return render_template('userview_tax_payments.html',data=data)



@user.route('/user_make_payments',methods=['get','post'])
def user_make_payments():
	uid=session['uid']
	data={}
	amount=request.args['amount']
	data['amount']=amount
	tid=request.args['tid']
	if 'pay' in request.form:
		q="insert into payment values(null,'%s','%s',curdate())"%(tid,amount)
		insert(q)
		q="update tax set status='paid' where user_id='%s'"%(uid)
		update(q)
		return redirect(url_for('user.userview_tax_payments'))
	

	return render_template('user_make_payment.html',data=data)


@user.route('/user_view_loan',methods=['get','post'])
def user_view_loan():
	uid=session['uid']
	data={}
	q="select * from loan"
	res=select(q)
	data['loan']=res
	# if 'action' in request.args:
	# 	action=request.args['action']
	# 	lid=request.args['lid']
	# else:
	# 	action=None
	# if action=="request":
	# 	q="insert into request values(null,'%s','%s','pending')"%(lid,uid)
	# 	insert(q)
	# 	return redirect(url_for('user.user_view_loan'))

	return render_template('user_view_loan.html',data=data)


@user.route('/user_upload_files',methods=['get','post'])
def user_upload_files():
	data={}
	q="select * from cimages"
	res=select(q)
	data['upload']=res
	cid=request.args['cid']
	if 'UPLOAD' in request.form:
		files=request.files['files']
		path="static/"+str(uuid.uuid4())+files.filename
		files.save(path)
		q="insert into cimages values(null,'%s','%s')"%(cid,path)
		insert(q)
		flash("Upload successfully")
		return redirect(url_for('user.user_upload_files',cid=cid))
	return render_template("user_upload_files.html",data=data)

@user.route('/user_view_request_for_loan',methods=['get','post'])
def user_view_request_for_loan():
	uid=session['uid']
	data={}
	q="select * from loan inner join request using(loan_id) where user_id='%s'"%(uid)
	res=select(q)
	data['loan']=res
	return render_template("user_view_request_for_loan.html",data=data)

@user.route('/user_request_for_certificate_details',methods=['get','post'])
def user_request_for_certificate_details():
	uid=session['uid']
	id=request.args['id']
	if 'submit' in request.form:
		q="insert into certirequest values(NULL,'%s','%s','pending','')"%(id,uid)
		insert(q)
		flash("Submit successfully")


	return render_template("user_request_for_certificate_details.html")


@user.route('/user_request_for_loan',methods=['get','post'])
def user_request_for_loan():
	uid=session['uid']
	lid=request.args['lid']
	if 'submit' in request.form:
		q="insert into request values(null,'%s','%s','pending')"%(lid,uid)
		insert(q)
		flash("Submit successfully")


	return render_template("user_request_for_loan.html")
