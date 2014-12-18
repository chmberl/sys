import wx

class ListFrame(wx.Frame):

    def __init__(self):
        wx.Frame.__init__(self,None,-1,"ListBox Example",size=(250,300))
        panel = wx.Panel(self,-1)

        sampleList = ['zero','one','two','three','four','five']

        wx.Choice(panel,-1,(85,18),choices=sampleList)

if __name__ == '__main__':
    app = wx.PySimpleApp()
    if wx.GetTextFromUser("userName") == "zhang" and wx.GetPasswordFromUser("password") == "bo":
        frame = ListFrame()
        frame.Show()
    app.MainLoop()
