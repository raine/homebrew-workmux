class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.99"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.99/workmux-darwin-arm64.tar.gz"
      sha256 "a8c63179e1b7e8f1a82364fd94905ec2866331165a2f445203d61f7849306a97"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.99/workmux-darwin-amd64.tar.gz"
      sha256 "ad2cbf18d6403838704e37e37fc8cef474d26df7d8c3a29ff19210d0f942c2a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.99/workmux-linux-arm64.tar.gz"
      sha256 "0c116dd06634072c7c3abed6fcbec195b07085d4c4edc46f9102e633ab0b3d54"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.99/workmux-linux-amd64.tar.gz"
      sha256 "c11b80d1c4ff9c91d71cbcae8dbb571e21fa6fcb5e70a50efd7d0d39c16fe440"
    end
  end

  def install
    bin.install "workmux"

    generate_completions_from_executable(bin/"workmux", "completions bash", shells: [:bash])
    generate_completions_from_executable(bin/"workmux", "completions fish", shells: [:fish])
    generate_completions_from_executable(bin/"workmux", "completions zsh", shells: [:zsh])
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
