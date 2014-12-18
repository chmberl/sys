import wx

class MouseEventFrame(wx.Frame):

    def __init__(self,parent,id):
        wx.Frame.__init__(self,parent,id,'Frame With Button',size=(400,400))
        self.panel = wx.Panel(self)
        self.button = wx.Button(self.panel,label="Not Over",pos=(200,200))
        self.Bind(wx.EVT_BUTTON,self.OnButtonClick,self.button)
        self.button.Bind(wx.EVT_ENTER_WINDOW,self.OnEnterWindow)
        self.button.Bind(wx.EVT_LEAVE_WINDOW,self.OnLeaveWindow)
        self.flag=True

    def OnButtonClick(self,event):
        if self.flag is True:
            self.panel.SetBackgroundColour('Green')
            self.flag = False
        else:
            self.panel.SetBackgroundColour('White')
            self.flag = True
        self.panel.Refresh()

    def OnEnterWindow(self,event):
        self.button.SetLabel("Over me")
        event.Skip()

    def OnLeaveWindow(self,event):
        self.button.SetLabel("Not Over")
        event.Skip()

if __name__ == '__main__':
    app = wx.App()
    frame = MouseEventFrame(parent=None,id=-1)
    frame.Show()
    app.MainLoop()
