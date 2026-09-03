class Eda < Formula
  version '0.0.1'
  homepage 'https://github.com/masawada/eda'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/masawada/eda/releases/download/v0.0.1/eda_0.0.1_darwin_arm64.tar.gz'
      sha256 '44f0f3467708c34ba1144b7e115db60549d40aeeeca4f0473ef6ad2692044013'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/eda/releases/download/v0.0.1/eda_0.0.1_darwin_amd64.tar.gz'
      sha256 '83c23105c7f67ab931670c8c76a0c229dc7ab7ff433da06e4e2d03fcb342c541'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/masawada/eda/releases/download/v0.0.1/eda_0.0.1_linux_arm64.tar.gz'
      sha256 '5c337d5047d8eab43e3e30b0fb7d9585996fd872f4f8b8264c2ac53405e8d941'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/eda/releases/download/v0.0.1/eda_0.0.1_linux_amd64.tar.gz'
      sha256 'fa75b3c8ae57cba4ed8ddde0163b9f75d3fe2d7b294053e36131dc845bb85830'
    end
  end

  head do
    url 'https://github.com/masawada/eda.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'eda'
  end
end
