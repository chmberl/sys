import wx

if __name__ == '__main__':
    app = wx.PySimpleApp()
    dialog = wx.TextEntryDialog(None,'what',"text entry","default",style=wx.OK|wx.CANCEL)
    if dialog.ShowModal() == wx.ID_OK:
        print "you entered:%s" % dialog.GetValue()
    user=wx.GetTextFromUser("user_name","name")
    print "user:%s" % user
    dialog.Destroy()
