import sys
import os
import wx

class main_window(wx.Frame):

    def __init__(self,parent,id,title):
        wx.Frame.__init__(self,parent,-1,title,size=(500,300))
        self.control = wx.TextCtrl(self,-1,style=wx.TE_MULTILINE)
        self.Show(True)

class App(wx.App):

    def OnInit(self):
        self.frame = main_window(None,-1,"wxpyton")
        self.SetTopWindow(self.frame)
        return True

if __name__ == '__main__':
    app = App()
    app.MainLoop()
