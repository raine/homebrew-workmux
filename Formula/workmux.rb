class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.262"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.262/workmux-darwin-arm64.tar.gz"
      sha256 "270f43bed607a69473af92c9f7b7f8b856cb9cc7fed4e8311ac0a05a136b1e34"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.262/workmux-darwin-amd64.tar.gz"
      sha256 "afa2bef412475bfdb90bb9b95c3f50981d6b4de387cd145963cfbe74ed727ebf"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.262/workmux-linux-arm64.tar.gz"
      sha256 "5e2927771aa6c76cd5f4ee7b8f6405ec0cd46d76d1f259e9878ceb24e8ecbc4b"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.262/workmux-linux-amd64.tar.gz"
      sha256 "cc4bb06d010ba040d9137b3cc8a054f7461476c946c3e2b9cec416e222a392d3"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
