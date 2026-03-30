class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.164"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.164/workmux-darwin-arm64.tar.gz"
      sha256 "70961423bd2cfbd098b98b8af87799512e0a3262f8ffe21406b5138880336b6d"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.164/workmux-darwin-amd64.tar.gz"
      sha256 "a895f5f733802f8e4d34499c0bf6a27ff1806196531cf2982019902a71a9b68b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.164/workmux-linux-arm64.tar.gz"
      sha256 "6e316bad56b95eeeedb75b14984c1851a768b3cc9e4c9fce80cb886ab3654173"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.164/workmux-linux-amd64.tar.gz"
      sha256 "5a7a3f454990ca80d75cefb2e5094660d5a1285a4ce0a81ad37a2071eae680eb"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
