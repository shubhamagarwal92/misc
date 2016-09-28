from pyPdf import PdfFileReader
from pyPdf import PdfFileWriter

file1= open('file1.pdf','rb')
pdf1 = PdfFileReader(file1)
newFile = 'newFile.pdf'
writer = PdfFileWriter()
writer.addPage(pdf1.getPage(0))
writer.addPage(pdf1.getPage(1))
file2 = open('file2.pdf','rb')
pdf2=PdfFileReader(file2)
writer.addPage(pdf2.getPage(0))
newPdf = open(newFile,'wb')
writer.write(newPdf)
newPdf.close()
