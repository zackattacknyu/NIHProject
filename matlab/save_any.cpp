#include <algorithm>
#include "mex.h"
#include "itkImage.h"
#include "itkImageFileWriter.h"
#include "itkMetaImageIO.h"
#include "itkMetaImageIOFactory.h"
#include "itkNiftiImageIO.h"
#include "itkNiftiImageIOFactory.h"
#include "itkNrrdImageIO.h"
#include "itkNrrdImageIOFactory.h"

template<typename VoxelType, unsigned int Dimension>
bool SaveImage(const char *p_cFileName, const VoxelType *p_voxelData, const unsigned int *p_uiDim, const double *p_dSpacing, const double *p_dOrigin) {
  typedef itk::Image<VoxelType, Dimension> ImageType;
  typedef typename ImageType::SizeType SizeType;
  typedef itk::ImageFileWriter<ImageType> WriterType;
  
  if (p_cFileName == NULL || p_voxelData == NULL || p_uiDim == NULL)
    return false;

  double a_dDefaultSpacing[Dimension];
  std::fill(a_dDefaultSpacing, a_dDefaultSpacing+Dimension, 1.0);
  
  double a_dDefaultOrigin[Dimension];
  std::fill(a_dDefaultOrigin, a_dDefaultOrigin+Dimension, 0.0);
  
  if (p_dSpacing == NULL)
    p_dSpacing = a_dDefaultSpacing;
  
  if (p_dOrigin == NULL)
    p_dOrigin = a_dDefaultOrigin;

  typename ImageType::Pointer p_clImage = ImageType::New();
  
  if (!p_clImage) {
    mexPrintf("Error: Could not allocate image container.\n");
	return false;
  }

  typename WriterType::Pointer p_clWriter = WriterType::New();
  
  if (!p_clWriter) {
    mexPrintf("Error: Could not allocate writer.\n");
	return false;
  }
  
  p_clImage->SetSpacing(p_dSpacing);
  p_clImage->SetOrigin(p_dOrigin);
  
  size_t totalSize = 1;
  
  {
    SizeType clSize;
	for (int i = 0; i < Dimension; ++i) {
      clSize[i] = p_uiDim[i];
	  totalSize *= p_uiDim[i];
	}
  
	p_clImage->SetRegions(clSize);
  }
  
  p_clImage->GetPixelContainer()->SetImportPointer((VoxelType *)p_voxelData, totalSize, false);
  
  p_clWriter->SetFileName(p_cFileName);
  p_clWriter->SetInput(p_clImage);
  
  try {
    p_clWriter->Update();
  }
  catch (itk::ExceptionObject &e) {
    mexPrintf("Error: %s\n", e.what());
	return false;
  }
  
  return true;
}

class Factory {
public:
  static Factory & GetInstance() {
    static Factory clFactory;
	return clFactory;
  }
  
  class Node {
  public:
    virtual ~Node() { }

	virtual bool Matches(const mxArray *) const = 0;
	virtual bool Save(const char *, const mxArray *, const double *, const double *) const = 0;
  };
  
  template<bool (*IsType)(const mxArray *), typename VoxelType>
  class NodeTemplate : public Node {
  public:
    bool Matches(const mxArray *p_arg) const {
	  return p_arg != NULL && (*IsType)(p_arg);
	}
	
	bool Save(const char *p_cFileName, const mxArray *p_image, const double *p_dSpacing, const double *p_dOrigin) const {
	  const size_t imageDim = mxGetNumberOfDimensions(p_image);
	  const VoxelType * const p_voxelData = (const VoxelType *)mxGetData(p_image);
	  const mwSize * const p_mexDimensions = mxGetDimensions(p_image);
	  
	  std::vector<unsigned int> vDim(imageDim);
	  
	  for (size_t i = 0; i < imageDim; ++i)
	    vDim[i] = (unsigned int)p_mexDimensions[i];
	
	  switch (imageDim) {
	  case 2:
	    return SaveImage<VoxelType,2>(p_cFileName, p_voxelData, &vDim[0], p_dSpacing, p_dOrigin);
	  case 3:
	    return SaveImage<VoxelType,3>(p_cFileName, p_voxelData, &vDim[0], p_dSpacing, p_dOrigin);
      case 4:
        return SaveImage<VoxelType,4>(p_cFileName, p_voxelData, &vDim[0], p_dSpacing, p_dOrigin);	  
	  }
	  
	  return false;
	}
  };
  
  template<bool (*IsType)(const mxArray *), typename VoxelType>
  void Register() {
	std::shared_ptr<Node> p_clNode(new NodeTemplate<IsType, VoxelType>());
    m_vNodes.push_back(p_clNode);
  }
  
  std::shared_ptr<Node> GetNode(const mxArray *p_image) const {
    for (size_t i = 0; i < m_vNodes.size(); ++i) {
	  if (m_vNodes[i]->Matches(p_image))
	    return m_vNodes[i];
	}
	
	return std::shared_ptr<Node>();
  }
  
private:

  std::vector<std::shared_ptr<Node> > m_vNodes;

  Factory() {
	Register<&mxIsDouble, double>();
	Register<&mxIsSingle, float>();
	Register<&mxIsInt16, short>();
	Register<&mxIsUint16, unsigned short>();
	Register<&mxIsInt8, char>();
	Register<&mxIsUint8, unsigned char>();
  }
};

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]) {
  itk::MetaImageIOFactory::RegisterOneFactory();
  itk::NiftiImageIOFactory::RegisterOneFactory();
  itk::NrrdImageIOFactory::RegisterOneFactory();
  
  Factory &clFactory = Factory::GetInstance();
  
  if (nrhs < 2)
    mexErrMsgTxt("Usage: err = save_mhd('file.mhd', matrix, spacing, origin)\n");


  if (!mxIsChar(prhs[0]))
    mexErrMsgTxt("First argument expected to be a string.\n");

  char a_cFileName[1024] = "";
  const double *p_dOrigin = NULL;
  const double *p_dSpacing = NULL;
  
  mxGetString(prhs[0], a_cFileName, sizeof(a_cFileName));
  
  size_t originSize = 0;
  size_t spacingSize = 0;
  size_t imageDim = 0;
  
  switch (nrhs) {
  case 4:
    if (!mxIsDouble(prhs[3]))
      mexErrMsgTxt("Origin is expected to be double precision.\n");
  
    originSize = mxGetNumberOfElements(prhs[3]);
    p_dOrigin = mxGetPr(prhs[3]);
  case 3:
    if (!mxIsDouble(prhs[2]))
	  mexErrMsgTxt("Origin is expected to be double precision.\n");
  
    spacingSize = mxGetNumberOfElements(prhs[2]);
	p_dSpacing = mxGetPr(prhs[2]);
  }
  
  imageDim = mxGetNumberOfDimensions(prhs[1]);
  
  if (originSize != 0 && imageDim != originSize)
    mexErrMsgTxt("Dimension mismatch between image and origin.");

  if (spacingSize != 0 && imageDim != spacingSize)
    mexErrMsgTxt("Dimension mismatch between image and spacing.");
  
  std::shared_ptr<Factory::Node> p_clNode = clFactory.GetNode(prhs[1]);
  
  if (!p_clNode)
    mexErrMsgTxt("Could not get helper node.\n");

  if (!p_clNode->Save(a_cFileName, prhs[1], p_dSpacing, p_dOrigin))
    mexErrMsgTxt("Failed to save image.\n");  
}