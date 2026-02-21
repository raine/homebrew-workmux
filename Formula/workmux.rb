class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.119"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.119/workmux-darwin-arm64.tar.gz"
      sha256 "64de91aac3e1c37a797e9d1bb9414ee15639580b6b8c3dc89953e1dc42f5453c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.119/workmux-darwin-amd64.tar.gz"
      sha256 "cf687c818e10b800aa86d9be5691395b85b3fe879f41f3cb66f0a3d72af33331"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.119/workmux-linux-arm64.tar.gz"
      sha256 "640ecff1c2226ead7147a76c8c15af7e995fec610668051564f6c1c0f0090fa7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.119/workmux-linux-amd64.tar.gz"
      sha256 "0e28f66346c9c8a733eb95af64707ef94b45be12d7d16e67dc36db581f8926cd"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
