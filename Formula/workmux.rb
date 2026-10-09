class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.272"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.272/workmux-darwin-arm64.tar.gz"
      sha256 "30ec6ed10f56b2a7e92a2002e79cd5dabe67a181a4d2dcf98492f3a96ccaafe5"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.272/workmux-darwin-amd64.tar.gz"
      sha256 "2022a06149addf9b416ba7fe422bc3b151386211949e600d9d6373f93d4847e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.272/workmux-linux-arm64.tar.gz"
      sha256 "594f73e088c7fd78e5c864b1bc34789ed47993b907e9ed22a1fa7887ac4ff9cf"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.272/workmux-linux-amd64.tar.gz"
      sha256 "3048fe62c03c0150a716b7289cc0c04fe7c9b7190503d969c6ff4c1e1b062457"
    end
  end

  def install
    bin.install "workmux"
    generate_completions_from_executable(bin/"workmux", "completions")
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
