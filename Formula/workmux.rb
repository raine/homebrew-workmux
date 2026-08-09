class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.238"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.238/workmux-darwin-arm64.tar.gz"
      sha256 "85dbf00641a899c50870666c65579d506b80898fcb025b238bd779f1e71980ef"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.238/workmux-darwin-amd64.tar.gz"
      sha256 "c9c78ae82dbbc6954129de221096df79b91c60245337f745ae1f6563a44178bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.238/workmux-linux-arm64.tar.gz"
      sha256 "a328b526d12448bfc2c119197d758aaafe6e71787edc0a7223644027e2243a58"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.238/workmux-linux-amd64.tar.gz"
      sha256 "c97312e35fb50d6391f88c140b0edcff1b4ff3c6c27d30ef1b203780abb8266e"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
