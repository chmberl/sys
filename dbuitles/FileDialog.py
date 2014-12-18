import wx
import os

if __name__ == '__main__':
    app=wx.App()
    wildcard = "*.*"
    dialog = wx.FileDialog(None,"choose a file",os.getcwd(),"",wildcard,wx.OPEN)
    print dialog
    if dialog.ShowModal() == wx.ID_OK:
        print dialog.GetPath()

    dialog.Destroy()
    app.MainLoop()
