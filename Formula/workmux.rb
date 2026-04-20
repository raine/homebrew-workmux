class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.184"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.184/workmux-darwin-arm64.tar.gz"
      sha256 "0a8be5331bbc29cd47e4ea08ca8d573d971faf6f099d25190e6c632e2990a326"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.184/workmux-darwin-amd64.tar.gz"
      sha256 "b0b3cf757d396b85e8e50c34ae952529b1465ffe81b90f53ce4cab765ff5265c"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.184/workmux-linux-arm64.tar.gz"
      sha256 "9f86e1e19d99e3010fafbefe276a81791d1f7e13ac3934f58781605e98aa0c69"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.184/workmux-linux-amd64.tar.gz"
      sha256 "aabb7337a6d053ee3e3cbfb85a44cb1954b7e826e14e8c3bc3f615b8dfb2d47e"
    end
  end

  def install
    bin.install "workmux"

    generate_completions_from_executable(bin/"workmux", "completions", shells: [:bash, :fish, :zsh])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/workmux --version")
  end
end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
