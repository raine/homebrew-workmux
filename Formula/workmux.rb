class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.265"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.265/workmux-darwin-arm64.tar.gz"
      sha256 "b2f83de4e5256f92e89cbd77d845fa8bb185100945f32329711edea8ef297687"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.265/workmux-darwin-amd64.tar.gz"
      sha256 "0d4b261396bf4bc2476638946653e8ec26d1c6166d83f0b501e8ad7f1c93d71c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.265/workmux-linux-arm64.tar.gz"
      sha256 "c8e69692e6a720daa8c5dca72400b846b0d690ded1a99459d30bf3b9e2760242"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.265/workmux-linux-amd64.tar.gz"
      sha256 "c9ac9402eee0f227814eb0d772ca74936966ad0a56846479bc54f121421ba49f"
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
