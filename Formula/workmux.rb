class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.103"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.103/workmux-darwin-arm64.tar.gz"
      sha256 "31368c8a961a91fa72a595505e9ebda2a66e9cd984f832db3879ff68a9f5d91f"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.103/workmux-darwin-amd64.tar.gz"
      sha256 "e7012f7a4e9db11fda33737fdc0f78b8d82115b0ffa905b929e63263ddd9f2b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.103/workmux-linux-arm64.tar.gz"
      sha256 "ef283860423ef70787023489fe07466ace8411da2df97e60cb206a1ec4a5af6c"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.103/workmux-linux-amd64.tar.gz"
      sha256 "e07558ffcfb085dbb305194f788add132d475943879222770381b8c17c900682"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
