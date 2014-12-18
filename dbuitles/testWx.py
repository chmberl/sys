import wx

class Frame(wx.Frame):

    def __init__(self,id):
        wx.Frame.__init__(self,None,id,"my frame",(100,100),(500,500))

class MyApp(wx.App):

    def OnInit(self):
        id = wx.NewId()
        self.frame = Frame(id)
        print self.frame.GetId()
        self.frame.Show()
        self.SetTopWindow(self.frame)
        return True

def main():
    app = MyApp()
    app.MainLoop()

if __name__ == '__main__':
    main()
