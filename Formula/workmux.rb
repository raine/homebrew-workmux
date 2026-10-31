class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.278"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.278/workmux-darwin-arm64.tar.gz"
      sha256 "6d2ce0a174e116d7003d35ce42021bfd5e6564ddae25cd906f8edb4920b9f65b"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.278/workmux-darwin-amd64.tar.gz"
      sha256 "a0e881073511d39e19e811eee3349c7c36c4e18289aca901323640fd16f7dd7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.278/workmux-linux-arm64.tar.gz"
      sha256 "fac8de7198478879f6c7ea18a2cf1ee9161a4e0606eed6fe97a94c1098a604b4"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.278/workmux-linux-amd64.tar.gz"
      sha256 "ba6bfac2a10d6849992ed8e71c1417cbd0666f64be1eff44a65895cec68461a0"
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
