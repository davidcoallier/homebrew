require 'formula'

# even though "file -b" reports this as a zip archive, it's just a binary
class JythonHttpDownloadStrategy <CurlDownloadStrategy
  def stage
    FileUtils.mv @dl, File.basename(@url)
  end
end

class Jython <Formula
  url 'http://downloads.sourceforge.net/project/jython/jython/2.5.1/jython_installer-2.5.1.jar'
  homepage 'http://www.jython.org'
  md5 '2ee978eff4306b23753b3fe9d7af5b37'

  def download_strategy
    JythonHttpDownloadStrategy
  end

  def install
    system "java", "-jar", "jython_installer-2.5.1.jar", "-s", "-d", prefix
  end
end
