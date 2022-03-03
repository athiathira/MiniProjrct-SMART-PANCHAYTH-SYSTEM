from flask import *
from database import *
import uuid


admin=Blueprint('admin',__name__)

@admin.route('/adminhome')
def adminhome():
	return render_template('adminhome.html')

@admin.route('/admin_view_users',methods=['get','post'])
def admin_view_users():
	data={}
	q="select * from user"
	res=select(q)
	data['user']=res
	return render_template("admin_view_users.html",data=data)	
	

@admin.route('/adminmanage_certificate',methods=['get','post'])
def adminmanage_certificate():
	data={}
	if 'ADD' in request.form:
		certificate=request.form['ct']
		description=request.form['dp']
		q="insert into certidetails values(NULL,'%s','%s')"%(certificate,description)
		insert(q)

	q="select * from certidetails"
	res=select(q)
	data['certidetails']=res

	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None

	if action=="delete":
		q="delete from certidetails where cdetails_id='%s'"%(id)
		delete(q)
		return redirect(url_for('admin.adminmanage_certificate'))

	if action=="update":
			q="select * from certidetails where cdetails_id='%s'"%(id)
			res=select(q)
			data['cer']=res
	if 'update' in request.form:
			certificate=request.form['ct']
			description=request.form['dp']
			q="update certidetails set certificate='%s',description='%s' where cdetails_id='%s'"%(certificate,description,id)
			update(q)
			return redirect(url_for('admin.adminmanage_certificate'))

	return render_template('adminmanage_certificate.html',data=data)


@admin.route('/adminview_request_for_certificates',methods=['get','post'])
def adminview_request_for_certificates():
	data={}
	

	q="select * from certirequest inner join user using(user_id) inner join certidetails using(cdetails_id)"
	res=select(q)
	data['certficates']=res

	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None
	if action=="approve":
		q="update certirequest set status='approve' where crequest_id='%s'"%(id)
		update(q)
		return redirect(url_for('admin.adminview_request_for_certificates'))
	if action=="reject":
		q="update certirequest set status='reject' where crequest_id='%s'"%(id)
		update(q)
		return redirect(url_for('admin.adminview_request_for_certificates'))
	return render_template('adminview_request_for_certificates.html',data=data)


@admin.route('/admin_view_upload_files',methods=['get','post'])
def admin_view_upload_files():
	cid=request.args['cid']
	data={}
	q="select * from cimages where crequest_id='%s'"%(cid)
	res=select(q)
	data['upload']=res
	
	return render_template("admin_view_upload_files.html",data=data)


@admin.route('/admin_upload_certficate',methods=['get','post'])
def admin_upload_certficate():
	cid=request.args['cid']
	if 'UPLOAD' in request.form:
		files=request.files['files']
		path="static/"+str(uuid.uuid4())+files.filename
		files.save(path)
		q="update certirequest set files='%s',status='sanction' where crequest_id='%s'"%(path,cid)
		update(q)
		return redirect(url_for('admin.adminview_request_for_certificates',cid=cid))

		
	return render_template("admin_upload_certificate.html")


 
@admin.route('/adminview_complaints',methods=['get','post'])
def adminview_complaints():
	data={}
	

	q="select * from complaint inner join user using(user_id)"
	res=select(q)
	data['complaints']=res



	return render_template('adminview_complaints.html',data=data)




@admin.route('/admin_send_reply',methods=['get','post'])
def admin_send_reply():
	cid=request.args['cid']
	if 'SEND' in request.form:
		reply=request.form['reply']
		q="update complaint set reply='%s' where complaint_id='%s'"%(reply,cid)
		update(q)
		flash("send successfully")
		return redirect(url_for('admin.adminview_complaints'))


	return render_template('admin_send_reply.html')




@admin.route('/admin_make_tax_payment',methods=['get','post'])
def admin_make_tax_payment():
	data={}
	q="select * from user"
	res=select(q)
	data['user']=res
	
	if 'ADD' in request.form:
		user=request.form['user']
		types=request.form['types']
		amount=request.form['amount']
		q="insert into tax values(NULL,'%s','%s','%s','pending')"%(user,types,amount)
		insert(q)
	return render_template("admin_make_tax_payment.html",data=data)


@admin.route('/admin_loan',methods=['get','post'])
def admin_loan():
	data={}
	q="select * from loan"
	res=select(q)
	data['loan']=res


	if 'SUBMIT' in request.form:
		loan=request.form['loan']
		amount=request.form['amount']
		q="insert into loan values(NULL,'%s','%s')"%(loan,amount)
		insert(q)
	
	return render_template("admin_loan.html",data=data)


@admin.route('/admin_view_request_for_loan',methods=['get','post'])
def admin_view_request_for_loan():
	data={}
	q="select * from loan inner join request using(loan_id) inner join user using(user_id)"
	res=select(q)
	data['loan']=res

	if 'action' in request.args:
		action=request.args['action']
		rid=request.args['rid']
	else:
		action=None
	if action=="accept":
		q="update request set status='accept' where request_id='%s'"%(rid)
		update(q)
		return redirect(url_for('admin.admin_view_request_for_loan',rid=rid))
	if action=="reject":
		q="update request set status='reject' where request_id='%s'"%(rid)
		update(q)
		return redirect(url_for('admin.admin_view_request_for_loan',rid=rid))
	return render_template("admin_view_request_for_loan.html",data=data)
