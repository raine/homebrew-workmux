class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.260"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.260/workmux-darwin-arm64.tar.gz"
      sha256 "aded087d76f65360fb5c010b4c92e0b35e665d6d0530901096444254f4773a05"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.260/workmux-darwin-amd64.tar.gz"
      sha256 "e1fbc422fba3b659c1de36b8eb3014c8ff30a4a93ddd546679e0763190323758"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.260/workmux-linux-arm64.tar.gz"
      sha256 "c2db930f13e30bb32ab21b5042633ccca08ffb61d36528c3852095d5295e6d5a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.260/workmux-linux-amd64.tar.gz"
      sha256 "e1282f64cf4712f44fb7cc7842d5e37350b0801dae43156cce752a04f72b1d57"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
