def pltcircles(p,r):
    g=Graphics()
    title="p={}    r={}".format(p,r)
    g+=text(title,(0,7))
    for n in srange(0, 2*math.pi+math.pi/14, math.pi/14):
        g+=circle(((p)*(math.sin(n)), (p)*math.cos(n)),r,rgbcolor=hue(n))
    g.show(xmin=-8,ymin=-8,xmax=8,ymax=8)
from sage.repl.ipython_kernel.interact import sage_interactive
sage_interactive(pltcircles,p=(1,3,0.5),r=(1,3,0.5))
