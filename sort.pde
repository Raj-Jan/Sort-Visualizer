import java.util.*;

int[] data = new int[100];
float size;
float height_;

String title;

void setup()
{
  size(1200, 720);
  
  colorMode(RGB, 1, 1 , 1);
  
  thread("Sort");
  
  size = (float)width / data.length;
  height_ = height / 101.0;
}

void draw()
{
  background(0, 0, 0);
  
  float x = 0;
  
  fill(0, 1, 1);
  textSize(100);
  textAlign(CENTER, TOP);
  text(title, 610, 10);
  
  fill(1, 1, 1);
  
  for (int i = 0; i < data.length; i++)
  {
    x += size;
    
    rect(x, height_ * data[i], size, size);
  }
}

void Generate()
{
  Random random = new Random();
  
  for (int i = 0; i < data.length; i++)
  {
      data[i] = random.nextInt(100);
  }
}

void Sort()
{
  title = "Merge Sort";
  Generate();
  delay(500);
  Merge_Sort();
  delay(2000);
  
  title = "Quick Sort";
  Generate();
  delay(500);
  Quick_Sort();
  delay(2000);
  
  title = "Cocktail Sort";
  Generate();
  delay(500);
  Cocktail_Sort();
  delay(2000);
  
  title = "Select Sort";
  Generate();
  delay(500);
  Select_Sort();
  delay(2000);
  
  title = "Buble Sort";
  Generate();
  delay(500);
  Buble_Sort();
  delay(2000);
  
  title = "Pancake Sort";
  Generate();
  delay(500);
  Pancake_Sort();
  delay(2000);
}

void Swap(int i, int j)
{
  int temp = data[i];
  data[i] = data[j];
  data[j] = temp;
}

void Select_Sort()
{
  for (int i = 0; i < data.length; i++)
  {
    int index = i;
    int min = data[i];
    
    for (int j = i + 1; j < data.length; j++)
    {
      if (data[j] < min)
      {
        min = data[j];
        index = j;
      }
      
      delay(1);
    }
    
    if (index != i)
    {
      Swap(index, i);
    }
  }
}

void Buble_Sort()
{
  for (int i = 0; i < data.length - 1; i++)
  {
    if (data[i] > data[i+1])
    {
      Swap(i, i + 1);
      
      i = -1;
      
      delay(3);
    }
  }
}

void Flip(int i)
{
  int left = 0;
  while(left < i)
  {
     Swap(i, left);
     
     delay(1);
     
     i--;
     left++;
  }
}

int MaxIndex(int j)
{
  int index = 0;
  for(int i = 0; i < j; i++)
  {
    if(data[i] > data[index])
      index = i;
  }
  return index;
}

void Pancake_Sort()
{
  int size = data.length;
  while(size > 1)
  {
   int max = MaxIndex(size);
   if(max != size)
   {
     Flip(max);
     Flip(size - 1);
   }
   
   size--;
  }
}

void Cocktail_Sort()
{
  int start = 0;
  int end = data.length - 1;
  
  while (start < end)
  {
    int min = data[start];
    int index = start;
  
    for (int i = start; i < end + 1; i++)
    {
      if (data[i] < min)
      {
        min = data[i];
        index = i;
      }
      
      delay(1);
    }
    
    if (index != start)
    {
      Swap(index, start);
    }

    int max = data[end];
    index = end;
    
    for (int i = end; i > start; i--)
    {
      if (data[i] > max)
      {
        max = data[i];
        index = i;
      }
      
      delay(1);
    }
    
    if (index != end)
    {
      Swap(index, end);
    }
    
    start++;
    end--;
  }
}

void Quick_Sort()
{
  int[] stack = new int[data.length];
  
  int top = -1;
  int low = 0;
  int high = data.length - 1;
  
  stack[++top] = 0;
  stack[++top] = high;
  
  while (top >= 0)
  {
    high = stack[top--];
    low = stack[top--];
    
    int p = Partition(low, high);
    
    if (p - 1 > low)
    {
      stack[++top] = low;
      stack[++top] = p - 1;
    }
    
    if (p + 1 < high)
    {
      stack[++top] = p + 1;
      stack[++top] = high;
    }
  }
}

int Partition(int low, int high)
{
  int pivot = data[high];
  
  int i = low - 1;
  
  for (int j = low; j < high; j++)
  {
    if (data[j] <= pivot)
    {
      i++;
      Swap(i, j);
    }
    
    delay(10);
  }
  
  Swap(i + 1, high);
  
  return i + 1;
}

void Merge_Sort()
{
  
}

void Merge(int l, int m, int r)
{
  
}
