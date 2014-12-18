import wx

class ButtonFrame(wx.Frame):

    def __init__(self):
        wx.Frame.__init__(self,None,-1,"Button Test",size=(300,300))
        panel = wx.Panel(self,-1)
        self.button = wx.Button(panel,-1,"hello",pos=(50,20))
        self.Bind(wx.EVT_BUTTON,self.OnClick,self.button)
        self.button.SetDefault()

    def OnClick(self,event):
        self.button.SetLabel("clicked")

if __name__ == '__main__':
    app = wx.PySimpleApp()
    frame = ButtonFrame()
    frame.Show()
    app.MainLoop()
