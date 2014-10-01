__author__ = 'williano'
from Tkinter import *
import psycopg2

class Application(Frame):
    def __init__(self, master=None):
        Frame.__init__(self, master)

        con = psycopg2.connect(host='localhost', user='williano', password='willy01',dbname='dbminhafarmacia')
        c = con.cursor()
        c.execute('SELECT * FROM tbtipo')

        self.msg = Label(self, text=c.fetchall())
        self.msg.pack ()
        self.bye = Button (self, text="Adeus", command=self.quit)
        self.bye.pack ()
        self.pack()

app = Application()
mainloop()