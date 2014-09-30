__author__ = 'williano'
from Tkinter import *

class Application(Frame):
    def __init__(self, master=None):
        Frame.__init__(self, master)
        self.msg = Label(self, text="Williano Serpa")
        self.msg.pack ()
        self.bye = Button (self, text="Adeus", command=self.quit)
        self.bye.pack ()
        self.pack()

app = Application()
mainloop()