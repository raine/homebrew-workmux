class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.150"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.150/workmux-darwin-arm64.tar.gz"
      sha256 "c6fb91091a81f3e1df7c1da964b41788c6d2a42de95b6eabcc1e047a6ba92d2f"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.150/workmux-darwin-amd64.tar.gz"
      sha256 "605154d5901fcbe1a5940e771ba130c4e8e390e5550dca71c02c75ef32cabe27"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.150/workmux-linux-arm64.tar.gz"
      sha256 "5b9fff23d3a8356519bf8d241f4c9ace61c788f29c00f03ea9a51c922246b17b"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.150/workmux-linux-amd64.tar.gz"
      sha256 "377383f8471d6a61e31d43450004c6bff42be415d9f81f1c860259566cab0d14"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
