class Metsuke < Formula
  version '0.0.1'
  homepage 'https://github.com/masawada/metsuke'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/masawada/metsuke/releases/download/v0.0.1/metsuke_0.0.1_darwin_arm64.tar.gz'
      sha256 'b5dbd67033053c439994c65190a0665e354420a30dc94d7a5aa71f8b7591bde9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/metsuke/releases/download/v0.0.1/metsuke_0.0.1_darwin_amd64.tar.gz'
      sha256 '9814ad97d3ca4dd0623ff4a96808f8cc1908fa420708f509a901bc190782a8d6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/masawada/metsuke/releases/download/v0.0.1/metsuke_0.0.1_linux_arm64.tar.gz'
      sha256 'c6feee4f11c336d238d20d4c9b1066975cf22b7960585acb081b9d839c03fef8'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/metsuke/releases/download/v0.0.1/metsuke_0.0.1_linux_amd64.tar.gz'
      sha256 '97b52b1cf900c58e061524f32587618159c35139a866cdadb56b5bc89bf35781'
    end
  end

  head do
    url 'https://github.com/masawada/metsuke.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'metsuke'
  end
end
