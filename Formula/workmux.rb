class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.74"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.74/workmux-darwin-arm64.tar.gz"
      sha256 "71fda40a0b15f43a3baad827af8b05c43b875bbc9452bfe357d814982aabbd8a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.74/workmux-darwin-amd64.tar.gz"
      sha256 "40d3c5357561ba0ba53afe675297fb21a8cdaaaff7045531cf233cf287772109"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.74/workmux-linux-arm64.tar.gz"
      sha256 "134b6ca5ea90945a6293fca737e32909ef6ebc4264ac148770b5914251eac6b2"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.74/workmux-linux-amd64.tar.gz"
      sha256 "fd6fcc697b64e67843bd83ade01bcfcdc5ae0020a105b13c9559aa1349bcdba9"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
