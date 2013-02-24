#include <stdio.h>
#include <iostream>
#include <stdlib.h>
 #include <sstream>
 #include <fstream>

uint  _mergeSort(uint arr[], uint temp[], uint left, uint right);
uint merge(uint arr[], uint temp[], uint left, uint mid, uint right);
  
/* This function sorts the input array and returns the
   number of inversions in the array */
uint mergeSort(uint arr[], uint array_size)
{
    uint *temp = (uint *)malloc(sizeof(uint)*array_size);
    return _mergeSort(arr, temp, 0, array_size - 1);
}
  
/* An auxiliary recursive function that sorts the input array and
  returns the number of inversions in the array. */
uint _mergeSort(uint arr[], uint temp[], uint left, uint right)
{
  uint mid, inv_count = 0;
  if (right > left)
  {
    /* Divide the array uinto two parts and call _mergeSortAndCountInv()
       for each of the parts */
    mid = (right + left)/2;
  
    /* Inversion count will be sum of inversions in left-part, right-part
      and number of inversions in merging */
    inv_count  = _mergeSort(arr, temp, left, mid);
    inv_count += _mergeSort(arr, temp, mid+1, right);
  
    /*Merge the two parts*/
    inv_count += merge(arr, temp, left, mid+1, right);
  }
  return inv_count;
}
  
/* This funt merges two sorted arrays and returns inversion count in
   the arrays.*/
uint merge(uint arr[], uint temp[], uint left, uint mid, uint right)
{
  uint i, j, k;
  uint inv_count = 0;
  
  i = left; /* i is index for left subarray*/
  j = mid;  /* i is index for right subarray*/
  k = left; /* i is index for resultant merged subarray*/
  while ((i <= mid - 1) && (j <= right))
  {
    if (arr[i] <= arr[j])
    {
      temp[k++] = arr[i++];
    }
    else
    {
      temp[k++] = arr[j++];
  
     /*this is tricky -- see above explanation/diagram for merge()*/
      inv_count = inv_count + (mid - i);
    }
  }
  
  /* Copy the remaining elements of left subarray
   (if there are any) to temp*/
  while (i <= mid - 1)
    temp[k++] = arr[i++];
  
  /* Copy the remaining elements of right subarray
   (if there are any) to temp*/
  while (j <= right)
    temp[k++] = arr[j++];
  
  /*Copy back the merged elements to original array*/
  for (i=left; i <= right; i++)
    arr[i] = temp[i];
  
  return inv_count;
}
  
/* Driver progra to test above functions */
uint arr[100000];
int main(int argv, char** args)
{
    uint i = 0;
std::ifstream input;
input.open ("input.txt");
    for (std::string line; std::getline(input, line);) {
 //   std::cout << line << std::endl;
    std::stringstream s_str( line );

    s_str >> arr[i];
    
        ++i;
    }
    std::cout << i << std::endl;
    
//  uint arr[] = {0,4,3};
  printf(" Number of inversions are %u \n", mergeSort(arr, i));
  getchar();
  return 0;
}

