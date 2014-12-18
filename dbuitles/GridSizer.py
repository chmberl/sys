import wx
import BlockWindow

labels = "one two three four five six seven eight nine".split()

class GridSizerFrame(wx.Frame):

    def __init__(self):
        wx.Frame.__init__(self,None,-1,"Basic Grid",size=(400,400))
        sizer = wx.GridSizer(rows=3,cols=3,hgap=5,vgap=5)
        for label in labels:
            bw = BlockWindow.BlockWindow(self,label=label)
            sizer.Prepend(bw,0,flag=wx.ALL|wx.EXPAND,border=10)
        center = self.FindWindowByName("five")
        center.SetMinSize((150,150))
        self.SetSizer(sizer)
        self.Fit()

if __name__ == '__main__':
    app = wx.App()
    GridSizerFrame().Show()
    app.MainLoop()
