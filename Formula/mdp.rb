class Mdp < Formula
  version '0.3.3'
  homepage 'https://github.com/masawada/mdp'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/masawada/mdp/releases/download/v0.3.3/mdp_0.3.3_darwin_arm64.tar.gz'
      sha256 'c2204d922a02eb0694d6ebfe6ab72364877438fec8281b3d1a239884e2d287d4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/mdp/releases/download/v0.3.3/mdp_0.3.3_darwin_amd64.tar.gz'
      sha256 '8927a73ed91e7b786a3db0e6a0966d880ba0521a96c1f55e481dd356151b7ce8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/masawada/mdp/releases/download/v0.3.3/mdp_0.3.3_linux_arm64.tar.gz'
      sha256 'ea6093fb50645054b953118b008dc58f7254d5ecffe08f4b419f1aff960e0dae'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/masawada/mdp/releases/download/v0.3.3/mdp_0.3.3_linux_amd64.tar.gz'
      sha256 '1a928a4d13dbdf8a2309feb08194a34dd10104891dadfc4cc14d75c49c814205'
    end
  end

  head do
    url 'https://github.com/masawada/mdp.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mdp'
  end
end
