import random 
from flask import Flask, render_template, request
from flask import *
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'nykaa'


mysql = MySQL(app)



@app.route('/',methods=['GET','POST'])
def index():
    return render_template("Nykaa.html")


@app.route('/login',methods=['POST'])
def login():

    
    if request.method == 'POST':
 
        password = request.form['password']
        username = request.form['username']
        cur = mysql.connection.cursor()
        cur.execute("SELECT cust_id FROM customers WHERE email_id = %s and pswd = %s",(username,password))
        global current
        current = cur.fetchall()
        if len(current)==0:
            del current
            mysql.connection.commit()
            cur.close()
            return render_template('fail.html')
        mysql.connection.commit()
        cur.close()
        return render_template('homepage.html')
    else:

        return render_template('Nykaa.html')


@app.route('/logout')
def logout():
    cust_id = 0
    current = 0
    return redirect('/')

@app.route('/add', methods=['GET', 'POST'])
def add():
    if request.method == 'POST':
        p_id = request.form['p_id']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO `cart`(`p_id`, `c_quantity`, `cust_id`) VALUES (%s,%s,%s)",(p_id,1,current[0][0]))
        data = cur.fetchall()
        mysql.connection.commit()
        cur.close()
    return redirect('/products.html')


def calc(data):
    t = 0
    for i in data:
        t+=int(i[2])

    return t

@app.route('/cart.html', methods=['GET', 'POST'])
def cart():
    cur = mysql.connection.cursor()
    cur.execute("SELECT p.p_id,p.p_name,p.p_cost,p.color FROM products p ,cart c WHERE c.p_id = p.p_id;")
    data = cur.fetchall()
    global total
    total = calc(data)
    mysql.connection.commit()
    cur.close()
    return render_template('cart.html',data = data,total = total)

@app.route('/payment.html',methods = ['GET','POST'])
def adress():
    cur = mysql.connection.cursor()
    cur.execute("SELECT p.p_id,p.p_name,p.p_cost,p.color FROM products p ,cart c WHERE c.p_id = p.p_id;")
    data = cur.fetchall()
    global total
    total = calc(data)
    mysql.connection.commit()
    cur.close()
    # if request.method == 'POST':

    #     pay_type = request.method["p_type"]
    #     card_no = request.method["CN"]
    #     cvv = request.method["cvv"]
    #     expiry = request.method["mon"]
    #     cur = mysql.connection.cursor()
    #     cur.execute("INSERT INTO payment(pay_type,amount,card_no,cvv,expiry,cust_id) VALUES(%s,%s,%s,%s,%s,%s)",(pay_type,total,card_no,cvv,expiry,current[0]))
    #     mysql.connection.commit()
    #     cur.close()
    #     return redirect("/paymentSucceessful.html")

    return render_template('payment.html',total=total,n=len(data))

@app.route('/paycheck',methods = ['GET','POST'])
def paycheck():

        pay_type = request.method["p_type"]
        card_no = request.method["CN"]
        cvv = request.method["cvv"]
        expiry = request.method["mon"]
        print(pay_type,card_no,cvv,expiry)
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO payment(pay_type,amount,card_no,cvv,expiry,cust_id) VALUES(%s,%s,%s,%s,%s,%s)",(pay_type,total,card_no,cvv,expiry,current[0]))
        mysql.connection.commit()
        cur.close()
        return redirect("/paymentSucceessful.html")    

@app.route('/registrationform.html')
def sign_up():
   
    return render_template('registrationform.html')

@app.route("/register",methods = ["GET","Post"])
def register():
    
    # cust_id = random.randint(100000,999999)
    firstname = request.form['firstname']
    lastname = request.form['lastname']
    phone = request.form['Contact']
    address = request.form['address']
    email = request.form['email']
    password = request.form['password']
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO customers(firstname,phone_no,email_id,address,lastname,pswd) VALUES(%s,%s,%s,%s,%s,%s)",(firstname,phone,email,address,lastname,password))
    mysql.connection.commit()
    cur.close()
    return redirect("/")

@app.route('/products.html')
def skin():

    cur = mysql.connection.cursor()
    cur.execute("SELECT p_id,p_name,p_cost,color FROM products")
    data = cur.fetchall()
    mysql.connection.commit()
    cur.close() 
    return render_template('nykaa_skin.html',data = data)

@app.route("/paymentSucceessful.html")
def final():
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM cart WHERE cust_id = %s",current[0])
    data = cur.fetchall()
    cur.execute("SELECT pay_id FROM payment WHERE cust_id = %s",current[0])
    trxn = cur.fetchall()    
    mysql.connection.commit()
    cur.close()    
    return render_template("paymentSucceessful.html",trxn = trxn[0][0])


@app.route('/homepage.html')
def refresh():

    
    return render_template('homepage.html')


if __name__ == '__main__':

    global cust_id

    app.run(debug=True)

    # current is for registered  user
    # global current 
    # cust_id is for new registration
   # global cust_id 
    