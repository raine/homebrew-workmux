class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.268"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.268/workmux-darwin-arm64.tar.gz"
      sha256 "9b52389d04b14fccf52586b8ae2d81340a9a3dbccf6cf01d53bbed62e5b46d0a"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.268/workmux-darwin-amd64.tar.gz"
      sha256 "a7beb4328de2c090655562ad20271f6ed048946a7d24b1c4561d3b0d34bc450d"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.268/workmux-linux-arm64.tar.gz"
      sha256 "098cb98ef912d2621fbeaf0f57b4abcec38768bf026a82ea718fd0d4e56380b7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.268/workmux-linux-amd64.tar.gz"
      sha256 "c1c0e35a2a707c50e50df60ff80db7c8b9cedd7e8bc3c15cda172d8a84ea2e77"
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
