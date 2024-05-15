import os
from flask import Flask, render_template, redirect, url_for, request
from flask_mysqldb import MySQL

app = Flask(__name__, static_folder='static')



# Dummy logged in status
logged_in = False



# MySQL Configuration
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = '1q2w3e4r' 
app.config['MYSQL_DB'] = 'cloud' 
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
mysql = MySQL(app)



# Login route
@app.route('/login', methods=['GET', 'POST'])
def login():
    global logged_in
    error = None
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        print("Received username:", username)
        print("Received password:", password)
        
        # Check if username and password are admin
        if username == 'admin' and password == 'admin':
            logged_in = True
            print("Login successful. Redirecting to home.")
            # Redirect to home page
            return redirect(url_for('home'))  # Updated redirection URL
        else:
            # If not admin, set error message
            error = 'Invalid username or password. Please try again.'
            print("Login failed. Error:", error)

    # If request method is GET or login is unsuccessful, render the login page with error message
    return render_template('login.html', error=error)


# Home route
@app.route('/')
def home():
    
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM student")
    rows = cur.fetchall()
    
    global logged_in
    print("Inside home route")
    print("Logged in:", logged_in)
    # Check if the user is logged in
    if not logged_in:
        # Redirect to login page if not logged in
        return redirect(url_for('login'))
    
    # Fetch data from the database
    
    return render_template('home.html')

if __name__ == '__main__':
    app.run(debug=True,port=5000)
