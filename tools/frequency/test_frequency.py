import unittest
from tempfile import NamedTemporaryFile
import os

from Frequency import freq

class FrequencyTests(unittest.TestCase):
    
    
    def test_freq_simple(self):
        """Test simple frequency count"""
        
        text = """one potato, two potato, three potato, four
        five potato, six potato; seven potato - more!"""
        
        output = "output.dat"
        
        textfile = NamedTemporaryFile(delete=False)
        textfile.write(text)
        textfile.close()
        
        freq(textfile.name, output)
        
        self.assertTrue(os.path.exists(output))
        self.addCleanup(os.unlink, output)
        
        with open(output) as h:
            table = h.read()
            
        # check for the header
        self.assertIn("Word\tCount\tPercent", table)
        # and some counts
        self.assertIn("potato\t6\t28.57", table)
        self.assertIn("one\t1\t4.76", table)
        # check that punctuation made it
        self.assertIn(",\t4", table)
        
        
        
if __name__ == '__main__':
    unittest.main()