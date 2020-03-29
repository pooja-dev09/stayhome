from config.database import db
from helper import *
import datetime


def login(aadhar):
    my_cursor = db.cursor()
    my_cursor.execute("SELECT AadharNo from User WHERE AadharNo = '" + str(aadhar) + "'")
    row_cursor = my_cursor.fetchall()
    if len(str(aadhar)) == 12:
        if len(row_cursor) > 0:
            return {'Message': 'Congratulation login successfully', 'Status': 1}
        else:
            return {'Message': 'Sorry Wrong Credentials', 'Status': 0}
    else:
        return {'Message': 'Please enter valid data', 'Status': 0}


def register(args):
    profile_pic = base64photo(args['Photo'])
    my_cursor = db.cursor()
    my_cursor.execute("SELECT AadharNo from User WHERE AadharNo = '" + str(args['AadharNo']) + "'")
    row_cursor = my_cursor.fetchall()
    if len(row_cursor) > 0:
        return {'Status': 0, 'Message': 'Account already exist for this aadhaar no :' + str(args['AadharNo'])}
    else:
        if len(str(args['Phoneno'])) == 10 and len(str(args['AadharNo'])) == 12:
            current_time = datetime.datetime.now()
            sql = "INSERT INTO User (Name,Phoneno,AadharNo,Latitude,Longitude,ProfilePic,OnDate) VALUES " \
                  "(%s,%s,%s,%s,%s,%s,%s)"
            val = (args['Name'], args['Phoneno'], args['AadharNo'], args['Latitude'], args['Longitude'],
                   profile_pic, current_time)
            my_cursor.execute(sql, val)
            db.commit()
            user_id = my_cursor.lastrowid
            db.close()
            return {'Message': 'Registered Successfully', 'UserID': user_id, 'Status': 1}
        else:
            return {'Message': 'Please enter valid data', 'Status': 0}
    # except Exception as e:
    #     return jsonify({'Status': 0, 'Message': 'Something went wrong,Please try again'})


def location_update(args):
    my_cursor = db.cursor()
    current_time = datetime.datetime.now()
    sql = "INSERT INTO Location (UserID,Latitude,Longitude,OnDate) VALUES (%s,%s,%s,%s)"
    val = (args['userid'], args['latitude'], args['longitude'], current_time)
    my_cursor.execute(sql, val)
    db.commit()
    return {'Message': 'Success', 'Status': 1}
