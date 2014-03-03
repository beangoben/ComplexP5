/* 1D PALETE */

class Palete1D
{
    PImage img;
    int posX=0,posY=0;
    int currentIndex;

    Palete1D()
    {
        currentIndex=(int)random(1,61);
        img =loadImage("1d/"+str(currentIndex)+"h.png");
    }

    color next()
    {
        posX++;
        if(posX == img.width)
        {
            posX=0;
            posY++;
            if(posY == img.height)
            {
                posY=0;
            }
        }
        return img.get(posX,posY);
    }


    color randomC()
    {
        return img.get(int(random(img.width)),int(random(img.height)));
    }

    void nextPalete()
    {
        currentIndex++;
        if(currentIndex > 60)currentIndex=1;
        img =loadImage("1d/"+str(currentIndex)+"h.png");
    }

    void randomPalete()
    {
        img = loadImage("1d/"+str((int)random(1,61))+"h.png");
    }

    color get(int x,int y)
    {
        if(x > img.width)x=0;
        if(y > img.height)y=0;
        return img.get(x,y);
    }
    
    color get(int index)
    {
        int x=index/img.width;
        int y=index%img.width;
        if(x > img.width)x=0;
        if(y > img.height)y=0;
        return img.get(x,y);
    }

}

class DiscretePalete1D
{
    color c[];
    float t,step;
    int size;
    int now,next;
    int currentIndex;

    DiscretePalete1D(int frames,int index)
    {
        t=0;
        step=1.0/(float)frames;

        currentIndex=index;
        PImage img =loadImage("1d/"+str(currentIndex)+"h.png");
        size=img.width*img.height;
        now=(int)random(0,size-2);
        next=now+1;
        c=new color[size];
        for(int x=0; x < img.width; x++)
            for(int y=0; y < img.width; y++)
            {
                c[y*img.width+x]=img.get(x,y);
            }

    }

    void setPalete(int index)
    {
        currentIndex=constrain(index,0,60);
        PImage img =loadImage("1d/"+str(currentIndex)+"h.png");
        for(int x=0; x < img.width; x++)
            for(int y=0; y < img.width; y++)
            {
                c[y*img.width+x]=img.get(x,y);
            }
    }

    color next()
    {
        t+=step;
        if(t > 1.0f)
        {
            now++;
            next++;
            t=0.0f;
            if(now==size)now=0;
            if(next==size)next=0;
        }
        return lerpColor(c[now],c[next],t);
    }


    color randomC()
    {
        return c[(int)random(size)];
    }

    void nextPalete()
    {
        currentIndex++;
        if(currentIndex > 60)currentIndex=1;
        PImage img =loadImage("1d/"+str(currentIndex)+"h.png");
        for(int x=0; x < img.width; x++)
            for(int y=0; y < img.width; y++)
            {
                c[y*img.width+x]=img.get(x,y);
            }
    }

    void randomPalete()
    {
        PImage img =loadImage("1d/"+str(currentIndex)+"h.png");
        for(int x=0; x < img.width; x++)
            for(int y=0; y < img.width; y++)
            {
                c[y*img.width+x]=img.get(x,y);
            }
    }

    color get()
    {
        t+=step;
        if(t > 1.0f)
        {
            now++;
            next++;
            t=0.0f;
            if(now==size)now=0;
            if(next==size)next=0;
        }
        return lerpColor(c[now],c[next],t);
    }

}
/* SmoothPalete1D */

class SmoothPalete1D
{
    PImage img;
    PImage next;
    float t;
    boolean change;
    float step;
    int posX,posY;
    int index,nextIndex;

    SmoothPalete1D(int changeCount)
    {
        index=(int)random(1,61);
        nextIndex=index;
        while(nextIndex==index)
        {
            nextIndex=(int)random(1,61);
        }
        t=0;
        step=1/(float)changeCount;
        posX=0;
        posY=0;
        change=false;
        img = loadImage("1d/"+str(index)+"h.png");
        next = loadImage("1d/"+str(nextIndex)+"h.png");
    }

    color next()
    {
        posX++;
        if(posX == img.width)
        {
            posX=0;
            posY++;
            if(posY == img.height)
            {
                posY=0;
            }
        }

        if(change)
        {
            return lerpColor(img.get(posX,posY),next.get(posX,posY),t);
        }
        else
        {
            return img.get(posX,posY);
        }
    }

    color randomC()
    {

        if(change)
        {
            return lerpColor(int(random(img.width)),int(random(img.height)),t);
        }
        else
        {
            return img.get(int(random(img.width)),int(random(img.height)));
        }
    }

    void update()
    {
        if(change)
        {
            t+=step;
            if(t >=1)
            {
                change=false;
                t=0.0;
                img=next;
                index=nextIndex;
                while(nextIndex==index)
                {
                    nextIndex=(int)random(1,61);
                }
                next = loadImage("1d/"+str(nextIndex)+"h.png");
            }
        }
    }

    void changePalete()
    {
        if(!change)
        {
            change=true;
        }
    }

    color get(int x,int y)
    {

        if(change)
        {
            return lerpColor(img.get(posX,posY),next.get(posX,posY),t);
        }
        else
        {
            return img.get(posX,posY);
        }
    }
}


/* 2D PALETE */

class Palete2D
{
    PImage img;
    int posX=0,posY=0;
    int currentIndex;

    Palete2D()
    {
        currentIndex=(int)random(1,61);
        img =loadImage("2d/"+str(currentIndex)+"h.png");
    }

    color next()
    {
        posX++;
        if(posX == img.width)
        {
            posX=0;
            posY++;
            if(posY == img.height)
            {
                posY=0;
            }
        }
        return img.get(posX,posY);
    }

    color nextX()
    {
        posX++;
        if(posX == img.width)
        {
            posX=0;
        }
        return img.get(posX,posY);
    }

    color randomC()
    {
        return img.get(int(random(img.width)),int(random(img.height)));
    }

    void nextPalete()
    {
        currentIndex++;
        if(currentIndex > 61)currentIndex=1;
        img =loadImage("2d/"+str(currentIndex)+"h.png");
    }

    void randomPalete()
    {
        img = loadImage("2d/"+str((int)random(1,61))+"h.png");
    }

    color get(int x,int y)
    {
        if(x > img.width)x=0;
        if(y > img.height)y=0;
        return img.get(x,y);
    }

}
/* SMOOTH PALETE 2D */

class SmoothPalete2D
{
    PImage img;
    PImage next;
    float t;
    boolean change;
    float step;
    int posX,posY;
    int index,nextIndex;

    SmoothPalete2D(int changeCount)
    {
        index=(int)random(1,61);
        nextIndex=index;
        while(nextIndex==index)
        {
            nextIndex=(int)random(1,61);
        }
        t=0;
        step=1.0/(float)changeCount;
        posX=0;
        posY=0;
        change=false;
        img = loadImage("2d/"+str(index)+"h.png");
        next = loadImage("2d/"+str(nextIndex)+"h.png");
    }

    color next()
    {
        posX++;
        if(posX == img.width)
        {
            posX=0;
            posY++;
            if(posY == img.height)
            {
                posY=0;
            }
        }

        if(change)
        {
            return lerpColor(img.get(posX,posY),next.get(posX,posY),t);
        }
        else
        {
            return img.get(posX,posY);
        }
    }

    color randomXY()
    {

        if(change)
        {
            return lerpColor(int(random(img.width)),int(random(img.height)),t);
        }
        else
        {
            return img.get(int(random(img.width)),int(random(img.height)));
        }
    }

    void update()
    {
        if(change)
        {
            t+=step;
            if(t >=1)
            {
                change=false;
                t=0.0;
                img=next;
                index=nextIndex;
                while(nextIndex==index)
                {
                    nextIndex=(int)random(1,61);
                }
                next = loadImage("2d/"+str(nextIndex)+"h.png");
            }
        }
    }

    void changePalete()
    {
        if(!change)
        {
            change=true;
        }
    }

    color get(int x,int y)
    {
        if(change)
        {
            return lerpColor(img.get(posX,posY),next.get(posX,posY),t);
        }
        else
        {
            return img.get(posX,posY);
        }
    }

}


