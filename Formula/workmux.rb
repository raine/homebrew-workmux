class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.102"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.102/workmux-darwin-arm64.tar.gz"
      sha256 "fbf80867ebbd35bd8f5f897fd4963ae7158d74410f0d7ff761b48b8f7b0b2f71"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.102/workmux-darwin-amd64.tar.gz"
      sha256 "ec02d3ea0c1289ef9f02957521cdf48918d6de1eb5a32881f2d4508b054a5063"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.102/workmux-linux-arm64.tar.gz"
      sha256 "e3e9a356f3e216fe2ddd7dbc390e2a4ee300f8355b952d5656759f025985097d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.102/workmux-linux-amd64.tar.gz"
      sha256 "be4192ebae6c726aa6bacec7fa4dd386882db64cf1937b21466d38a186cab08d"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
