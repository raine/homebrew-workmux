class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.224"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.224/workmux-darwin-arm64.tar.gz"
      sha256 "63b5fafeec7727990420099bc7a6ef3fee95b46910f6414a69393641ecd58f3f"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.224/workmux-darwin-amd64.tar.gz"
      sha256 "40de3ac36c7fd0c6b822c2dafaa97d0e3cc64124197b06bef7e02471ba33a8d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.224/workmux-linux-arm64.tar.gz"
      sha256 "e7111fe6fd1b3908c822db878f04ef2e986ff2dcd76493a6d69e48ff6276f452"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.224/workmux-linux-amd64.tar.gz"
      sha256 "137df0ac5887996d2b435be09d3813050f21fd0e7d6d17d9ac6ad7fccc61d721"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
