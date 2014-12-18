import wx

class StaticTextFrame(wx.Frame):

    def __init__(self):
        wx.Frame.__init__(self,None,-1,'Static Text Example',size=(400,300))
        panel = wx.Panel(self,-1)

        rev=wx.StaticText(panel,-1,"This is an example of static text",(100,10))
        rev.SetForegroundColour('White')
        rev.SetBackgroundColour('Black')


if __name__ == '__main__':
    app = wx.PySimpleApp()
    frame = StaticTextFrame()
    frame.Show()
    app.MainLoop()
